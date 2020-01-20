#!/bin/bash

# 返回 .gitignore 文件提示
__GIM_FILES_TIP() {
  local filter="${COMP_WORDS[COMP_CWORD]}"
  local _FILES=$(cat $GIM_HOME/indexes)
  COMPREPLY=($(compgen -W "$_FILES" -- ${filter}))
}

__GIM() {
  case $COMP_CWORD in
  0) #仍在完成根命令，这里不需要处理
    ;;
  1) #根命令已经完成，这里开始补充一级主命令
    __GIM_FILES_TIP ;;
  esac
}

# complete is a bash builtin, but recent versions of ZSH come with a function
# called bashcompinit that will create a complete in ZSH. If the user is in
# ZSH, load and run bashcompinit before calling the complete function.
if [[ -n ${ZSH_VERSION-} ]]; then
  autoload -U +X bashcompinit && bashcompinit
  autoload -U +X compinit && if [[ ${ZSH_DISABLE_COMPFIX-} = true ]]; then
    compinit -u
  else
    compinit
  fi
fi

complete -o dirnames -F __GIM gim
