function get_status_icon() {
  echo '%(?.%F{green} %f.%F{red} %f)'
}

function get_rprompt() {
  local -a arr
  local sep='%F{white}|%f'
  while [ $# -gt 0 ]
  do
    if [ -n "$1" ];then
      arr=($arr $1 "$sep")
    fi
    shift
  done
  arr=($arr[1,-2])
  
  str="$arr[*]"
  echo $str
}

PROMPT='%F{cyan}%~%f $(get_status_icon) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[white]%} "

RPROMPT='$(get_rprompt "$(git_prompt_info)" "$(git_prompt_status)") %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="%F{cyan} %f"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow} %f"
ZSH_THEME_GIT_PROMPT_DELETED="%F{red} %f"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue} %f"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{magenta} %f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{green} %f"

