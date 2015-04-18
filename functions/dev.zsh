# -----------------------------------
# - functions to assist development -
# -----------------------------------

function deploy! {
  git log -1 --pretty=%H | pbcopy
  bundle exec cap production deploy
}

function staging-deploy! {
  git log -1 --pretty=%H | pbcopy
  bundle exec cap staging deploy
}

function start-simfy {
  ruby -v
  start-mysql
  start-redis
  thor redis:start test
  thor redis:start
}

function stop-simfy {
  thor redis:stop test
  thor redis:stop
  stop-redis
  stop-mysql
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
  export CHECK_DATABASE=true

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
for i in {1..19}
do
   alias "ss$i"="ssh s$i"
done
