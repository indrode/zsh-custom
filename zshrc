# ---------------------------
# - this one rules them all -
# ---------------------------

# pr0xy settings (indrode.com)

# global variables
ZSH=$HOME/.oh-my-zsh
ZSHCUSTOM=$HOME/.oh-my-zsh/custom
ZSH_THEME="indro"
MAILNAME="indro.de"

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

# load aliases, shortcuts
. ~/.oh-my-zsh/custom/aliases/general.zsh
. ~/.oh-my-zsh/custom/aliases/git.zsh
. ~/.oh-my-zsh/custom/aliases/functions.zsh
. ~/.oh-my-zsh/custom/shortcuts.zsh

# aliases to edit zsh config
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl $ZSH"

# some oh-my-zsh settings
COMPLETION_WAITING_DOTS="true"

# which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# see: https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
# custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew bundler osx gem)

source $ZSH/oh-my-zsh.sh

# customize to your needs...
export NODE_PATH="/usr/local/lib/node_modules"
export RUBYOPT="rubygems"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # this loads RVM into a shell session.
export PATH=/usr/local/bin:$HOME/.rvm/gems/ree-1.8.7-2010.02/bin:$HOME/.rvm/gems/ruby-1.9.3-p0/bin:$HOME/.rvm/gems/ruby-1.9.3-p0@global/bin:$HOME/.rvm/rubies/ruby-1.9.3-p0/bin:$HOME/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin
export SOLR_BIN=/usr/local/Cellar/solr/3.5.0/libexec/example

# skip commands in .zsh_nocorrect (aka blacklisted)
# HINT: use 'blacklist my_word' to add commands to the list
if [ -f $ZSHCUSTOM/zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < $ZSHCUSTOM/zsh_nocorrect
fi

# startup items:
# 1. last login info
# 2. mounted drives status
# 3. unread emails count
# 4. todo list items

# display info of locally mounted drives
df -hl

# display number of unread emails
echo
echo "${txtylw}You have $(gmail gmail) unread personal emails.${txtrst}"
echo "${txtblu}You have $(gmail simfy) unread simfy emails.${txtrst}"
echo

# global todos (stored in the cloud)
if [ -f "$HOME/Dropbox/.todos" ]; then
  echo "${txtcyn}Global TODOs:${txtrst}"
  . "$HOME/Dropbox/.todos"
fi

# local todos
if [ -f "$HOME/.todos" ]; then
  echo "${txtcyn}Local TODOs:${txtrst}"
  . "$HOME/.todos"
fi


