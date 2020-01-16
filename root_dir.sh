#!/bin/bash
# 获取当前根目录路径

if [ -z "$GIM_HOME" -o "$1" = "1" ]; then
  # no $GIM_HOME or overwrite flag is 1
  # overwrite $GIM_HOME
  export GIM_HOME=$(
    cd $(dirname $0)
    pwd
  )
fi
echo "GIM_HOME: $GIM_HOME"
