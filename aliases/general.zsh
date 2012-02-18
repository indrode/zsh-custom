# -------------------
# - general aliases -
# -------------------

#ultimate grep
#grep history for 'sudo' ---> hh|P sudo
alias P='grep --color=auto -i'

#alias
alias aliases="cat $ZSHCUSTOM/aliases/git.zsh $ZSHCUSTOM/aliases/general.zsh"
alias aliases-open="subl $ZSHCUSTOM/aliases/general.zsh"
alias aliases-reload="source $ZSHCUSTOM/aliases/general.zsh"

#bundler
alias be='bundle exec'

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
alias ll='ls -lahF'
alias ls='ls -G'
alias cdf='cd `osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)"`'

#tools
alias lastfm='ruby ~/projects/code/ruby/recent_scrobbles.rb $1'

#mysql
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'

#rmv
alias rvm-set='rvm --default use'
alias rvm-restart='rvm_reload_flag=1 source '\''$HOME/.rvm/scripts/rvm'\'''

#redis
alias redis='/usr/local/bin/redis-server'
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
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"