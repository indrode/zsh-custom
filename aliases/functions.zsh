# add to nocorrect list
function blacklist {
  echo "$1" >> ~/.oh-my-zsh/custom/zsh_nocorrect
  echo "ok"
}

# go to project folder
function cdmy {
	cd ~/Projects/$1
}

# opens an application from /Applications
function go {
  open "/Applications/$1.app"
}

# open man pages in Preview
function pdfman() {
  man $1 -t | open -f -a Preview;
}

# todo list manager v2
# lets you add to .todos or remove-all (kill)
function todo {
  echo "Enter TODO tasks! ('help' for available commands)"
  while [ 1 == 1 ]; do
    read -e TODO
    case $TODO in
      list) . "$HOME/.todos" && echo "--> done!";;
      quit) echo "--> bye!" && break;;
      help) echo "--> commands: help, kill, list, quit";;
      kill) rm ~/.todos && echo "echo ' '" >> ~/.todos && echo "--> all tasks removed!";;
      * ) echo "echo -e '- $TODO'" >> ~/.todos && echo "--> task added!";;
    esac
  done
}

# check number of unread emails
function gmail {
  cat ~/.oh-my-zsh/custom/.gmail | pbcopy
  curl -u indro.de@gmail.com --silent 'https://mail.google.com/mail/feed/atom' | sed -n 's|<fullcount>\(.*\)</fullcount>|\1|p'
}

# simfy specific initializations
# loads ree, redis, solr, and solr cores
function init_simfy {
  echo "initializing simfy for $1..."
  solr-server
  rvm use ree
  be /usr/local/bin/redis-server /usr/local/etc/redis-simfy.conf
  curl -s "http://localhost:8983/solr/admin/cores?action=CREATE&name=simfy_test&instanceDir=/Users/$1/Projects/simfy/solr/core" 2>&1 >/dev/null
  curl -s "http://localhost:8983/solr/admin/cores?action=CREATE&name=simfy_development&instanceDir=/Users/$1/Projects/simfy/solr/core" 2>&1 >/dev/null
  echo
  echo "to run builds locally:"
  echo "build (cucumber|cucumber_admin|cucumber_api|cucumber_search|spec|spec_integration)"
}

# run guard
function gg {
  be rake db:test:prepare
  guard
}

# gc branch_name    -> git checkout branch_name
# gc                -> git checkout
function gc {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
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

  bundle install --quiet
  mkdir -p tmp
  bundle exec rake db:migrate db:test:prepare

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
      bundle exec rspec `find spec -maxdepth 1 -mindepth 1 -type d | grep -v spec/integration` $RSPEC_ORDER
      ;;
    "spec_integration")
      bundle exec rspec spec/integration $RSPEC_ORDER
      ;;
    *)
      unset TEST_DB
      bundle exec spec `find rspec -maxdepth 1 -mindepth 1 -type d | grep -v spec/integration` $RSPEC_ORDER
      SPORK_INTEGRATION=true bundle exec rspec spec/integration --order random
      bundle exec cucumber -p default features/plain
      bundle exec cucumber -p search features/search
      ;;
  esac
}