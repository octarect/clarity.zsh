function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

PROMPT='%{$fg[cyan]%}%~ %(!.%{$fg_bold[red]%}#.%{$fg_bold[red]%}❯%{$fg_bold[green]%}❯%{$fg_bold[blue]%}❯)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="[ "
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[white]%} $(emojify :poop:)"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%} $(emojify :innocent:)"

RPROMPT='${ret_status} %{$fg[white]%} $(git_prompt_info) $(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[white]%}$(emojify :bomb:)"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}$(emojify :gun:)"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[yellow]%}$(emojify :boom:)"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[red]%}$(emojify :knife:)"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[magenta]%}$(emojify :pill:)"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}$(emojify :eggplant:)"
