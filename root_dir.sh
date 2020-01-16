#!/bin/bash
# 获取当前根目录路径

export GIM_HOME=$(
  cd $(dirname $0)
  pwd
)
