# ---------------------------
# - this one rules them all -
# ---------------------------

# pr0xy settings (indrode.com)

# global variables
export ZSH=$HOME/.oh-my-zsh
export ZSHCUSTOM=$HOME/.oh-my-zsh/custom

# personal settings
CONFIG_FILE=$ZSH/custom/.settings/CONFIG.setting
if [ -f $CONFIG_FILE ];
then
  source $CONFIG_FILE
else
  echo "File $CONFIG_FILE does not exist. Please create configuration files by running:"
  echo "  setup-zsh"
fi

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
plugins=(git brew osx gem zsh-syntax-highlighting)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh
source $ZSHCUSTOM/scripts/iterm2.zsh

# customize to your needs...
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:erasedups
export CC=/usr/bin/gcc-4.2
export CC=/usr/local/bin/gcc-4.2
export HISTIGNORE="&:[ ]*:exit"
export NODE_PATH="/usr/local/lib/node_modules"
export RUBYOPT="rubygems"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# RVM only:
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # this loads RVM into a shell session.

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin
# export PATH="$HOME/.rbenv/bin:$PATH"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin

# skip commands in .zsh_nocorrect (aka blacklisted)
# HINT: use 'blacklist my_word' to add commands to the list
if [ -f $ZSHCUSTOM/zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < $ZSHCUSTOM/zsh_nocorrect
fi

# load aliases, shortcuts
. ~/.oh-my-zsh/custom/aliases/general.zsh
. ~/.oh-my-zsh/custom/aliases/git.zsh
. ~/.oh-my-zsh/custom/aliases/functions.zsh
. ~/.oh-my-zsh/custom/aliases/dev.zsh
. ~/.oh-my-zsh/custom/shortcuts.zsh

# load settings
. ~/.oh-my-zsh/custom/.settings

if [ -f "$ZSH/custom/.settings/INTRO.setting" ]; then
  echo "${txtylw}"
  cat $ZSH/custom/.settings/INTRO.setting
  echo "${txtrst}"
fi

# display swapfile status
if [ -f "$ZSH/custom/.settings/ENABLE_SWAP.setting" ]; then
  swap status
fi

# display number of unread emails
#if [ -f "$ZSH/custom/.settings/CHECK_MAIL.setting" ]; then
#  echo "${txtblu}You have $(gmail simfy) unread simfy emails.${txtrst}"
#fi

# global todos (stored in the cloud)
if [ -f "$HOME/Sync/raven/.todos" ]; then
  echo "\n${txtcyn}Global TODOs:${txtrst}"
  . "$HOME/Sync/raven/.todos"
fi

# local todos
if [ -f "$HOME/.todos" ]; then
  echo "\n${txtcyn}Local TODOs:${txtrst}"
  . "$HOME/.todos"
fi

unalias mysql
chruby 2.1.3
