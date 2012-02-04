# ---------------------------
# - this one rules them all -
# ---------------------------

# path to oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh
ZSHCUSTOM=$HOME/.oh-my-zsh/custom
ZSH_THEME="indro"

#to be removed:
df -hl

# aliases, custom functions, other configs
# . ~/.zsh/aliases/common.zsh
# . ~/.zsh/functions/
# . ~/.zsh/config.zsh

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
plugins=(brew)
plugins=(bundler)
plugins=(osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export NODE_PATH="/usr/local/lib/node_modules"
export RUBYOPT="rubygems"
[[ -s "/Users/pr0xy/.rvm/scripts/rvm" ]] && source "/Users/pr0xy/.rvm/scripts/rvm"  # this loads RVM into a shell session.
export PATH=/usr/local/bin:/Users/pr0xy/.rvm/gems/ruby-1.9.3-p0/bin:/Users/pr0xy/.rvm/gems/ruby-1.9.3-p0@global/bin:/Users/pr0xy/.rvm/rubies/ruby-1.9.3-p0/bin:/Users/pr0xy/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin
export SOLR_BIN=/usr/local/Cellar/solr/3.5.0/libexec/example

# skip commands in .zsh_nocorrect (aka blacklisted)
# HINT: use 'blacklist my_word' to add commands to the list
if [ -f $ZSHCUSTOM/zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < $ZSHCUSTOM/zsh_nocorrect
fi