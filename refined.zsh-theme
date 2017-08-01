  ####################
 # refined.zsh-theme
####################

REFINED_MODULES=(
  dir
  foo
  time
)

SEGMENT_SEPARATOR=''
REFINED_PREFIX=' '
REFINED_SEPARATOR=' '

function prompt_prefix() {
  echo -n "%(?.%F{green}$REFINED_PREFIX%f.%F{red}$REFINED_PREFIX%f)"
}

function prompt_chars() {
  echo -n '%B%F{cyan}❯%f%F{magenta}❯%f%F{yellow}❯%f%b'
}

function prompt_time() {
  echo %D{%T}
}

function prompt_foo() {
  echo '%F{221}foo%f'
}

function prompt_dir() {
  echo '%B%F{cyan}%~%f%b'
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
