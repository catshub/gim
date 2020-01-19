#!/bin/bash

# 0. 创建根目录
export GIM_HOME=~/.gim
if [ ! -d "$GIM_HOME" ]; then
  mkdir $GIM_HOME
fi
echo "GIM_HOME: $GIM_HOME"

# 1. clone gitignore repo
bash clone.sh 1

# 2. create indexes
bash create_indexes.sh

# copy to ~/.zshrc
if [ -z "$(cat ~/.zshrc | grep GIM_HOME)" ]; then
  echo "" >>~/.zshrc
  user_dir=$(echo ~)
  echo "export GIM_HOME=${GIM_HOME/${user_dir}/~}" >>~/.zshrc
  # echo "PATH=\$PATH:\$GIM_HOME/bin" >>~/.zshrc
  echo "[ -s \$GIM_HOME/gim_completion.sh ] && . \$GIM_HOME/gim_completion.sh" >>~/.zshrc
  echo "" >>~/.zshrc
fi

#
cp $GIM_HOME/bin/gim /usr/local/bin/gim
