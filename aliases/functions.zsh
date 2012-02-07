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
  solr-server
  rvm use ree
  be /usr/local/bin/redis-server /usr/local/etc/redis-simfy.conf
  curl -s "http://localhost:8983/solr/admin/cores?action=CREATE&name=simfy_test&instanceDir=/Users/$(whoami)/Projects/simfy/solr/core" 2>&1 >/dev/null
  curl -s "http://localhost:8983/solr/admin/cores?action=CREATE&name=simfy_development&instanceDir=/Users/$(whoami)/Projects/simfy/solr/core" 2>&1 >/dev/null
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