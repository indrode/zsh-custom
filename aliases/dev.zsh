# -----------------------------------
# - functions to assist development -
# -----------------------------------

function chpwd() {
  case $PWD in
    ~/Projects/simfy) echo "Welcome!";;
  esac
}

function migrate {
  be rake db:migrate
  be rake db:test:prepare
}

# all-in-one simfy launch
function simfy {
  case $1 in
  "help")
    cat $ZSHCUSTOM/.help
    ;;
  "init")
    init simfy
    ;;
  *)
    cd $HOME/Projects/simfy
    init simfy
    git status
    echo "run 'simfy help' for some hints"
    ;;
  esac
}

# project-specific initializations
function init {
  case $1 in
    "simfy")
      # RVM only
      # rvm use ree
      thor redis:start development
      thor redis:start test
      ruby script/solr.rb start
      ;;
    "help")
      echo "Help not available yet!"
      angry_exit
      ;;
    *)
      echo "Project not found!"
      angry_exit
      ;;
  esac
}

# repeat a command n times
# usage: repeat 5 echo hello!
function repeat() {
  n=$1
  shift
  while [ $(( n -= 1 )) -ge 0 ]
  do
    "$@"
  done
}

function build {
  export RUBY_HEAP_MIN_SLOTS=500000
  export RUBY_HEAP_SLOTS_INCREMENT=500000
  export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
  export RUBY_GC_MALLOC_LIMIT=100000000
  export RUBY_HEAP_FREE_MIN=500000
  export RAILS_ENV=test
  # export TEST_DB=$1
  export CHECK_DATABASE=true
  # export RSPEC_ORDER="--order rand"
  # export RSPEC_ORDER="--order rand:60271"

  mkdir -p tmp

  case $1 in
    "cucumber")
      bundle exec cucumber -p default features/plain
      ;;
    "cucumber_admin")
      bundle exec cucumber -p default features/admin
      ;;
    "cucumber_api")
      bundle exec cucumber -p default features/api
      ;;
    "cucumber_search")
      bundle exec cucumber -p search
      ;;
    "spec")
      bundle exec rspec `find spec -maxdepth 1 -mindepth 1 -type d | grep -v spec/integration`
      ;;
    "spec_integration")
      bundle exec rspec spec/integration --order random
      ;;
    *)
      unset TEST_DB
      bundle exec rspec `find spec -maxdepth 1 -mindepth 1 -type d | grep -v spec/integration`
      SPORK_INTEGRATION=true bundle exec rspec spec/integration --order random
      bundle exec cucumber -p default features/plain
      bundle exec cucumber -p search
      bundle exec cucumber -p default features/admin
      bundle exec cucumber -p default features/api
      ;;
  esac
}

# some aliases
alias staging="ssh staging"
for i in {1..13}
do
   alias "ss$i"="ssh s$i"
done