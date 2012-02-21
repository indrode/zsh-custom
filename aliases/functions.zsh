# ---------------------------------------------
# - general functions for every day shell-ing -
# ---------------------------------------------

# exiting (not so) gracefully by killing the process
function angry_exit {
  echo "${txtred}⚡⚡⚡ kthxbye!${txtrst}"
  kill -SIGINT $$
}

# exiting (not so) gracefully by killing the process
function happy_exit {
  echo "${txtgrn}☼ kthxbye...${txtrst}"
  kill -SIGINT $$
}

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
# run:
#   todo <scope>
# where scope is 'global' or 'local'
function todo {
  ok_notice="${txtylw}--> OK${txtrst}"
  case $1 in
    "global")
      echo "${txtgrn}${txtbld}<<GLOBAL SCOPE>>${txtrst}"
      todos_file=$HOME/Dropbox/.todos
      ;;
    "local")
      echo "${txtgrn}${txtbld}<<LOCAL SCOPE>>${txtrst}"
      todos_file=$HOME/.todos
      ;;
    *)
      echo "no scope specified!"
      angry_exit
      ;;
  esac
  
  echo "Enter TODO tasks! ('help' for available commands)"
  while [ true ]; do
    read todo
    case $todo in
      "list") . "$todos_file" && echo "$ok_notice";;
      "quit") echo "$ok_notice (bye!)" && break;;
      "help") echo "--> commands: help, kill, list, quit";;
      "kill") rm $todos_file && echo "" >> $todos_file && echo "$ok_notice (all tasks removed)";;
      *) echo "echo -e '- $todo'" >> $todos_file && echo "$ok_notice (task added)";;
    esac
  done
}

# swap-
# stores small snippets, urls, etc. in cloud
# options: 
function swap {
  ok_notice="${txtylw}--> OK${txtrst}"
  source_file=$HOME/Dropbox/.swap
  case $1 in
    "status")
      echo "${txtcyn}There are $(wc -w ~/Dropbox/.swap | cut -d "/" -f1) words in the swapfile.${txtrst}"
      ;;
    "kill")
      rm $source_file && echo "" >> $source_file
      echo "${ok_notice} (swap erased)"
      ;;
    "set")
      echo "${txtcyn}Add to swapfile:${txtrst}"
      read todo
      echo "$todo" >> $source_file
      echo "${ok_notice} (swap written)"
      ;;
    "get")
      cat $source_file
      ;;
    "help")
      echo "commands: get, set, kill, status, help"
      echo "e.g. swap get"
      ;;
    *)
      echo "swap what? (type 'swap help' for instructions)"
      angry_exit
      ;;
  esac
}

# check or go to a drive volume
function drive {
  if [ -z "$1" ]; then
    ( cd /Volumes && ls )
  else
    cd /Volumes/$1
    # requires figlet (fink install figlet)
    echo "${txtylw}"
    figlet $1
    echo "${txtrst}"
    df -h |grep -i $1
  fi
}

# check number of unread emails
function gmail {
  curl -u $MAILNAME@$1.com:$(cat ~/.oh-my-zsh/custom/.$1) --silent 'https://mail.google.com/mail/feed/atom' | sed -n 's|<fullcount>\(.*\)</fullcount>|\1|p'
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
      solr-server
      rvm use ree
      be /usr/local/bin/redis-server /usr/local/etc/redis-simfy.conf
      script/services start_redis ./tmp/redis/redis_test
      curl -s "http://localhost:8983/solr/admin/cores?action=CREATE&name=simfy_test&instanceDir=/Users/$(whoami)/Projects/simfy/solr/core" 2>&1 >/dev/null
      curl -s "http://localhost:8983/solr/admin/cores?action=CREATE&name=simfy_development&instanceDir=/Users/$(whoami)/Projects/simfy/solr/core" 2>&1 >/dev/null
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