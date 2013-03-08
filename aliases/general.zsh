# -------------------
# - general aliases -
# -------------------

#setup zp-zsh
alias setup_zsh='cd $ZSHCUSTOM && sh setup.sh && cd -'

#ultimate grep
#grep history for 'sudo' ---> hh|P sudo
alias P='grep --color=auto -i'

#command upgrades
alias cp='cp -v'

#chruby
alias r193="source /usr/local/opt/chruby/share/chruby/chruby.sh && chruby ruby-1.9.3"

#alias
alias aliases="cat $ZSHCUSTOM/aliases/git.zsh $ZSHCUSTOM/aliases/general.zsh"
alias aliases-open="subl $ZSHCUSTOM/aliases/general.zsh"
alias aliases-reload="source $ZSHCUSTOM/aliases/general.zsh"

#bundler
alias be='bundle exec'
alias tbe='time bundle exec'

#maintenance
alias check_space='du -h ~/ | grep "^[0-9]*.[0-9]G"'
alias ip='ifconfig | grep cast | cut -c 6-20'
alias pid="ps x | grep -i $1"
alias grep="grep --color=auto"

#navigation
alias hh='history'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias ll='ls -lahF'
alias ls='ls -G'
alias cdf='cd `osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)"`'

#tools
alias lastfm='ruby ~/projects/code/ruby/recent_scrobbles.rb $1'
alias init_transfer='bash $ZSHCUSTOM/scripts/zsh-watch_outgoing.sh &'

#mysql
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'

#redis
alias redis-start='launchctl start io.redis.redis-server'
alias redis-stop='launchctl stop io.redis.redis-server'

#solr
alias solr-server='solr simfy > ~/.logs/solr.log 2>&1 &'
alias solr-start='be ruby script/solr.rb start'
alias solr-bootstrap='be ruby script/solr.rb bootstrap'

#hal screensaver commands
alias hal9000="cd /System/Library/Frameworks/ScreenSaver.framework/Resources && nohup ./ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background &"
alias hal-exit="kill `ps -ef |grep ScreenSaverEngine|grep -v grep|awk {'print $2'}`"
alias hal-pid="ps -ef |grep ScreenSaverEngine |cut -c 6-"

#stuff found online http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias quiet="osascript -e 'set volume 0.5'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

# MAC manipulators (see https://gist.github.com/jashkenas/5113149)
alias random_mac='sudo ifconfig en0 ether `openssl rand -hex 6 | sed "s/\(..\)/\1:/g; s/.$//"`'
# alias restore_mac='sudo ifconfig en0 ether YOUR_ORIGINAL_MAC_ADDRESS_GOES_HERE'
