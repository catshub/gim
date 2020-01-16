#!/bin/bash
# clone子仓库

_gitignore="https://github.com/github/gitignore.git"
_dir=$GIM_HOME/submodules/gitignore

clone_repo() {
  # clone
  git clone --single-branch --depth 1 $1 $_dir
}

clean_repo() {
  if [[ -s $_dir/.git ]]; then
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
