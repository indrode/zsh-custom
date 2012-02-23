# ---------------
# - git aliases -
# ---------------

# 1. basic flow
alias g='git'
alias gs='git status'
alias gpl='git pull'
alias gpush='git push'
alias ga='git add'
alias gd='git diff'
alias gc='git checkout'
alias gcommit='git commit -v'
alias gl='git log'
alias gll='git log -1 --stat'
alias gb='git branch'
alias gss='git stash'
alias gsa='git stash apply'
alias gsp='git stash pop'

# 2. custom
alias rev='git log -1 | grep commit | cut -c 8-'

# 3. advanced (rarely used)
alias gba='git branch -a'
alias gdc='git diff --cached'
alias gdm='git diff master'
alias gr='git reset'
alias grh='git reset --hard'
alias gcp='git cherry-pick'
alias gm='git merge --no-ff'
alias gmf='git merge --ff-only'
alias grb='git rebase'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grbi='git rebase --ignore'
alias gf="git fetch"
alias gfix="git amend -C HEAD"