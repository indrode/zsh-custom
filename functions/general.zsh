# ---------------------------------------------
# - general functions for every day shell-ing -
# ---------------------------------------------

function show-trash {
  du -h ~/.Trash
}

function clean-trash {
  rm -Rf ~/.Trash/*
}

# cd and ls
function cdl() {
  cd $1 && ls -trahl
}

# gitio script to shorten urls from command line
# see: https://gist.github.com/defunkt/1209316
function gitio {
  $ZSHCUSTOM/scripts/gitio.rb $1
}

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
function cdmy() {
  cd ~/Projects/$1
}
_cdmy() {
  _files -W ~/Projects
}
compdef _cdmy cdmy

# opens an application from /Applications
function go() {
  open /Applications/$1
}
_go() {
  _files -W /Applications
}
compdef _go go

# open man pages in Preview
function pdfman() {
  man $1 -t | open -f -a Preview;
}

function mdax {
  MDAX=$(curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=EXS3.DE&f=l1')
  echo "MDAX: $MDAX"
}

function tdax {
  TDAX=$(curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=EXS2.DE&f=l1')
  echo "TDAX: $TDAX"
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
      todos_file=$HOME/Sync/raven/.todos
      ;;
    "local")
      echo "${txtgrn}${txtbld}<<LOCAL SCOPE>>${txtrst}"
      todos_file=$HOME/.todos
      ;;
    "edit")
      # ask for global or local todo source to edit
      echo -n "Enter scope of todo file to edit (global/local): "
      read scope

      if [ "$scope" = "global" ]
      then
        $EDITOR $HOME/Sync/raven/.todos
      else
        $EDITOR $HOME/.todos
      fi

      echo "${ok_notice} ($scope todo source file opened using '$EDITOR')"
      happy_exit
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

# stash
# stores small snippets, urls, etc. in cloud
# run:
#   stash set
#   stash get
function stash {
  ok_notice="${txtylw}--> OK${txtrst}"
  source_file=$HOME/Sync/raven/.stash
  case $1 in
    "status")
      word_count="$(wc -l ~/Sync/raven/.stash | cut -d "/" -f1 | tr -d ' ')"
      echo "${txtcyn}There are $(echo "$word_count - 1" | bc) rows in the stashfile.${txtrst}"
      ;;
    "kill")
      rm $source_file && echo "" >> $source_file
      echo "${ok_notice} (stash erased)"
      ;;
    "set")
      echo "${txtcyn}Add to stashfile:${txtrst}"
      read todo
      # add date tag: date +"%m-%d-%Y %H:%M"
      # add tag support
      echo "[tag][date]$todo" >> $source_file
      echo "${ok_notice} (stash written)"
      ;;
    "get")
      cat $source_file
      echo "${ok_notice} (end of file)"
      ;;
    "edit")
      $EDITOR $source_file
      echo "${ok_notice} (stash file opened using '$EDITOR')"
      ;;
    "help")
      echo "commands: get, set, kill, status, edit, help"
      echo "e.g. stash get"
      ;;
    *)
      echo "stash what? (type 'stash help' for instructions)"
      angry_exit
      ;;
  esac
}

# disk space report (incl. mounted volumes)
function space {
  df -h | grep 'File' | cut -c1-42 -c67- >> ~/.space
  df -Ph | grep '/dev/' | cut -c1-42 -c67- | grep -v '/private/' >> ~/.space
  cat ~/.space
  rm ~/.space
}

function folder-sizes {
  find . -maxdepth 1 -type d -mindepth 1 -exec du -hs {} \;
}
