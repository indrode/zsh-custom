# ---------------------------
# - this one rules them all -
# ---------------------------

# pr0xy settings (indrode.com)

# global variables
export ZSH=$HOME/.oh-my-zsh
export ZSHCUSTOM=$HOME/.oh-my-zsh/custom

# personal settings
CONFIG_FILE=$ZSH/custom/settings/config

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
plugins=(git brew osx gem zsh-syntax-highlighting zsh-completions)

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
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/opt/casks"
export HOMEBREW_BUILD_FROM_SOURCE=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ANALYTICS=1
export VAULT_TOKEN=`cat ~/.vault-token`

# skip commands in .zsh_nocorrect (aka blacklisted)
# HINT: use 'blacklist my_word' to add commands to the list
if [ -f $ZSHCUSTOM/zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < $ZSHCUSTOM/zsh_nocorrect
fi

# load settings
. ~/.oh-my-zsh/custom/settings

# load aliases and functions
. ~/.oh-my-zsh/custom/aliases/general.zsh
. ~/.oh-my-zsh/custom/aliases/git.zsh
. ~/.oh-my-zsh/custom/functions/general.zsh
. ~/.oh-my-zsh/custom/functions/dev.zsh

# display archey info
# brew install archey
archey -c

if [ -f "$ZSH/custom/settings/intro" ]; then
  echo "${txtylw}"
  cat $ZSH/custom/settings/intro
  echo "${txtrst}"
fi

# set ruby version

if [ "$RUBY_MANAGER" = "chruby" ]
  then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  chruby $DEFAULT_RUBY
fi

if [ "$RUBY_MANAGER" = "rbenv" ]
  then
  export RBENV_ROOT=/usr/local/var/rbenv
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fi

echo "[$RUBY_MANAGER] $(ruby -v)"

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

# use autojump
# brew install autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# create tmp folder for Sidekiq
mkdir -p /tmp/sidekiq

unalias mysql
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh

autoload -U compinit && compinit
