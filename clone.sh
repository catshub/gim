#!/bin/bash
# clone子仓库

_gitignore="https://github.com/github/gitignore.git"
_dir=$GIM_HOME/submodules/gitignore

if [ "$1" != "1" -a -d "$_dir" ]; then
  # do not overwrite
  exit 0
fi

clone_repo() {
  # clone
  if [ -d "$_dir" ]; then
    rm -rf $_dir
  fi
  git clone --single-branch --depth 1 $1 $_dir
}

clean_repo() {
  if [[ -s $_dir/.git ]]; then
    echo "clear $_dir/.git"
    rm -rf $_dir/.git
  fi
}

_do() {
  # 1. clone repo
  clone_repo $_gitignore
  # 2 clean repo
  clean_repo
}

_do
