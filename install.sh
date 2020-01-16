#!/bin/bash

# 0. 初始化一个 $GIM_HOME 供使用
bash root_dir.sh

# 1. clone gitignore repo
bash clone.sh

# # 2. create indexes
bash create_indexes.sh
