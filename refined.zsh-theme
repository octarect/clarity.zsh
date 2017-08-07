  ####################
 # refined.zsh-theme
####################

REFINED_MODULES=(
  dir
  host
  time
  git
)

REFINED_PREFIX=' '
REFINED_SEPARATOR=' '

function prompt_time() {
  echo -n '%D{%T}'
}

function prompt_host() {
  echo -n '%F{yellow}@%M%f'
}

function prompt_dir() {
  _dirpath=`dirs`
  arr=("${(@s'/')_dirpath}")
  if [ $_dirpath[1] = '/' ]; then
    res="/"
    shift arr
  else
    res='~'
    shift arr
  fi
  if [ ${#arr} -gt 3 ]; then
    n_cmp=$(( ${#arr} - 3 ))
    for i in `seq 1 ${#arr}`
    do
      dir=$arr[$i]
      if [ $i -le $n_cmp ]; then
        dir=$dir[1]
      fi
      if [ $i -eq 1 -a $_dirpath[1] = '/' ]; then
        res="$res$dir"
      else
        res="$res/$dir"
      fi
    done
    dirpath=$res
  else
    dirpath=$_dirpath
  fi
  echo -n '%B%F{cyan}'$dirpath'%f%b'
}


ZSH_THEME_GIT_PROMPT_ADDED='%F{green} %f'
ZSH_THEME_GIT_PROMPT_MODIFIED='%F{yellow} %f'
ZSH_THEME_GIT_PROMPT_DELETED='%F{red} %f'
function prompt_git() {
  echo -n " $(git_prompt_info) $(git_prompt_status)"
}

function prompt_prefix() {
  echo -n "%(?.%F{green}$REFINED_PREFIX%f.%F{red}$REFINED_PREFIX%f)"
}

function prompt_chars() {
  echo -n '%B%F{cyan}❯%f%F{magenta}❯%f%F{yellow}❯%f%b'
}

function build_prompt() {
  first=1
  for module in $REFINED_MODULES
  do
    if [ $first -eq 1 ]; then
      first=0
    else
      echo -n '%{%f%b%k%}'$REFINED_SEPARATOR
    fi
    echo -n "$(prompt_$module)"
  done
}

PROMPT='
%{%f%b%k%}$(prompt_prefix) $(build_prompt)
$(prompt_chars)%{%f%b%k%} '
