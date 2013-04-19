# Indro's prompt
# http://indrode.com/

# features:
# - signals when previous command returned error
# - current battery charge status
# - time
# - zsh history number
# - free space (plus space used by ~Trash)
# - git branch and clean/dirty status
# - readjusts on window resize

# ✈ pr0xy@unagi11 ~/Documents % ⚡                       ●●●●●●●○○○ [15:03:13] 510 22G(+2G)
#     |      |        |         |                           |          |       |    |    |
#  username  |       path       |                     battery charge   |   history  |    |
#          host            error marker                              time           |  trash size
                                                                              available space

local returned_error="%(?..%{$fg[red]%}⚡ %{$reset_color%})"

function battery_charge {
  #python ~/Projects/code/python/batcharge.py
}

function horizontal_line {
  local termwidth
  (( termwidth = $COLUMNS - 1 ))
  printf '—%.0s' {1..$termwidth}
}

function available_disk_space {
  df -H | grep $(cat ~/.oh-my-zsh/custom/.hd) | tr -s ' ' '=' | cut -d '=' -f4
}

function current_trash_size {
  du -h ~/Trash | tail -n1 | cut -f 1 | tr -d ' '
}

PROMPT='
%{$FG[240]%}$(horizontal_line)
[%m] %{$fg[yellow]%}✈ %{$fg_bold[green]%} %~$(git_prompt_info) %{$fg_bold[yellow]%}%%%{$reset_color%}%b ${returned_error}'

RPROMPT='$(battery_charge) %{$fg[yellow]%}[%*]%{$reset_color%} %! %{$fg[magenta]%}$(available_disk_space)(+$(current_trash_size))%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"


