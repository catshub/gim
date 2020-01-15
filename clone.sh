#!/bin/bash
# clone子仓库

gitignore=https://github.com/github/gitignore.git

git clone $gitignore --single-branch --depth 1
