# ---------------------------
# - this one rules them all -
# ---------------------------

# pr0xy settings (indrode.com)

# global variables
export ZSH=$HOME/.oh-my-zsh
export ZSHCUSTOM=$HOME/.oh-my-zsh/custom
export ZSH_THEME="indro"
export MAILNAME="indro.de"
export EDITOR=subl

# simpler bash text colors and attributes
txtund=$(tput sgr 0 1)    # underline
txtbld=$(tput bold)       # bold
txtred=$(tput setaf 1)    # red
txtgrn=$(tput setaf 2)    # green
txtylw=$(tput setaf 3)    # yellow
txtblu=$(tput setaf 4)    # blue
txtpur=$(tput setaf 5)    # purple
txtcyn=$(tput setaf 6)    # cyan
txtwht=$(tput setaf 7)    # white
txtrst=$(tput sgr0)       # text reset

# aliases to edit zsh config
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl $ZSH"

# some oh-my-zsh settings
COMPLETION_WAITING_DOTS="true"

# which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# see: https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
# custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# example format: plugins=(rails git textmate ruby lighthouse bundler)
plugins=(git brew osx gem)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# customize to your needs...
export CC=/usr/local/bin/gcc-4.2
export NODE_PATH="/usr/local/lib/node_modules"
export RUBYOPT="rubygems"

# RVM only:
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # this loads RVM into a shell session.

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin
export PATH="$HOME/.rbenv/bin:$PATH"
export SOLR_BIN=/usr/local/Cellar/solr/3.5.0/libexec/example

# skip commands in .zsh_nocorrect (aka blacklisted)
# HINT: use 'blacklist my_word' to add commands to the list
if [ -f $ZSHCUSTOM/zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < $ZSHCUSTOM/zsh_nocorrect
fi

# rbenv
eval "$(rbenv init -)"

# load aliases, shortcuts
. ~/.oh-my-zsh/custom/aliases/general.zsh
. ~/.oh-my-zsh/custom/aliases/git.zsh
. ~/.oh-my-zsh/custom/aliases/functions.zsh
. ~/.oh-my-zsh/custom/aliases/dev.zsh
. ~/.oh-my-zsh/custom/shortcuts.zsh

# load settings
. ~/.oh-my-zsh/custom/.settings

if [ -f "$ZSH/custom/.settings/INTRO.setting" ]; then
  echo "\n${txtylw}"
  cat $ZSH/custom/.settings/INTRO.setting
  echo "${txtrst}"
fi

# display swapfile status
if [ -f "$ZSH/custom/.settings/ENABLE_SWAP.setting" ]; then
  swap status
fi

# display number of unread emails
if [ -f "$ZSH/custom/.settings/CHECK_MAIL.setting" ]; then
  echo "\n${txtblu}You have $(gmail gmail) unread personal emails.${txtrst}"
  echo "${txtblu}You have $(gmail simfy) unread simfy emails.${txtrst}"
fi

# global todos (stored in the cloud)
if [ -f "$HOME/Dropbox/.todos" ]; then
  echo "\n${txtcyn}Global TODOs:${txtrst}"
  . "$HOME/Dropbox/.todos"
fi

# local todos
if [ -f "$HOME/.todos" ]; then
  echo "\n${txtcyn}Local TODOs:${txtrst}"
  . "$HOME/.todos"
fi

