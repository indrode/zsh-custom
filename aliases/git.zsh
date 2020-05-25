# ---------------
# - git aliases -
# ---------------

# 1. basic flow
alias g='git'
alias gs=' git status'
alias gpl=' git pull'
alias gpush='git push'
alias ga='git add'
alias gco=' git checkout'
alias gcom=' git checkout master'
alias gd=' git diff'
alias gcommit='git commit -v'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll='git log -1 --stat --pretty=oneline'
alias gb='git branch'
alias gss='git stash'
alias gsa='git stash apply'
alias gsp='git stash pop'
alias gh='gl -- '

# 2. custom
alias rev='git log -1 --pretty=%H | pbcopy'

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

# 4. github
alias github-status="curl https://status.github.com/api/last-message.json"
alias github-fullstatus="curl https://status.github.com/api/messages.json"

function gupd {
  NUM_STASHES=$(git stash list | wc -l)
  CURRENT_BRANCH=$(git branch --show-current)
  git stash
  git checkout master
  git pull
  git checkout $CURRENT_BRANCH
  git merge master

  NEW_NUM_STASHES=$(git stash list | wc -l)
  if [ NUM_STASHES != NEW_NUM_STASHES ]
  then
    git stash pop
  fi
}
