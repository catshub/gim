#!/bin/bash
# 获取当前根目录路径创建根目录

export GIM_HOME=~/.gim
if [ ! -d "$GIM_HOME" ]; then
  mkdir $GIM_HOME
fi
echo "GIM_HOME: $GIM_HOME"
