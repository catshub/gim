#!/bin/bash

# 读取所有模板文件并转化为小写
_FILES=($(ls $GIM_HOME/submodules/gitignore | grep '.gitignore$' | tr A-Z a-z))
# 去除尾部
_FILES_NAME=${_FILES[@]/.gitignore/}

echo $_FILES_NAME > $GIM_HOME/indexes
