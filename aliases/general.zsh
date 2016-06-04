# -------------------
# - general aliases -
# -------------------

#setup zp-zsh
alias setup-zsh='cd $ZSHCUSTOM && sh setup.sh && cd -'

#notify (require `gem install terminal-notifier`)
alias notify='terminal-notifier -message'

#ultimate grep
#grep history for 'sudo' ---> hh G sudo
alias G='| grep --color=auto -i'

#command upgrades
alias cp='cp -v'
alias mv='mv -v'

#history cleaners
alias ls=' ls'

#chruby
alias r222="source /usr/local/opt/chruby/share/chruby/chruby.sh && chruby ruby-2.2.2"
alias r230="source /usr/local/opt/chruby/share/chruby/chruby.sh && chruby ruby-2.3.0"

#alias
alias aliases="cat $ZSHCUSTOM/aliases/git.zsh $ZSHCUSTOM/aliases/general.zsh"
alias aliases-open="subl $ZSHCUSTOM/aliases/general.zsh"
alias aliases-reload="source $ZSHCUSTOM/aliases/general.zsh"

#bundler
alias be='bundle exec'
alias tbe='time bundle exec'
alias ber='nocorrect bundle exec rspec'

#maintenance
alias lsdu='du -csh $(pwd)'
alias check-space='du -h ~/ | grep "^[0-9]*.[0-9]G"'
alias ip='ifconfig | grep cast | cut -c 6-20'
alias pid="ps x | grep -i $1"
alias grep="grep --color=auto"

#navigation
alias hh='history'
alias hs='history | grep --color=auto'
alias tailh='history | tail -n20'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias ls='ls -G'
alias l='ls -lha'
alias ll='ls -lha'
alias cdf='cd `osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)"`'

#tools
alias lastfm='ruby ~/projects/code/ruby/recent_scrobbles.rb $1'
alias init-transfer='bash $ZSHCUSTOM/scripts/zsh-watch_outgoing.sh &'
alias start-spotify="ssh soma 'open /Applications/Spotify.app'"

#zeus
alias z='zeus'
alias zstart='zeus start'
alias zr='zeus rspec'
alias zc='zeus cucumber'

#workflow
alias r='bundle exec rspec'
alias br='bundle exec rspec'
alias s='spring'
alias rs='rake spec'

#mysql
alias start-mysql='brew services start mysql'
alias stop-mysql='brew services stop mysql'

#postgres
alias start-postgres='brew services start postgres'
alias stop-postgres='brew services stop postgres'

#redis
alias start-redis='brew services start redis'
alias stop-redis='brew services stop redis'

#stuff found online http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias quiet="osascript -e 'set volume 0.5'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

# MAC manipulators (see https://gist.github.com/jashkenas/5113149)
alias random-mac='sudo ifconfig en0 ether `openssl rand -hex 6 | sed "s/\(..\)/\1:/g; s/.$//"`'
# alias restore-mac='sudo ifconfig en0 ether YOUR_ORIGINAL_MAC_ADDRESS_GOES_HERE'
