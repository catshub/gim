#!/bin/bash

# 0. 创建根目录
export GIM_HOME=~/.gim
if [ ! -d "$GIM_HOME" ]; then
  mkdir $GIM_HOME
fi
cd $GIM_HOME
echo "GIM_HOME: $GIM_HOME"

# 1. get gitignore repo
## bash clone.sh 1
gitignore_url="https://github.com/github/gitignore/archive/master.zip"
gitignore_zip=gitignore.zip
sub_dir=submodules/gitignore
tmp_dir=$(mktemp -d submodules.XXXXXXXXXX)
curl -L -o $GIM_HOME/$gitignore_zip $gitignore_url
tar -xf $GIM_HOME/$gitignore_zip -C $GIM_HOME/$tmp_dir
[ ! -d $sub_dir ] && mkdir $sub_dir
mv $tmp_dir/*/* $sub_dir
## clean
rm -rf $tmp_dir
rm $gitignore_zip

# 2. create indexes
## 读取所有模板文件并转化为小写
_FILES=($(ls $GIM_HOME/submodules/gitignore | grep '.gitignore$' | tr A-Z a-z))
## 去除尾部
_FILES_NAME=${_FILES[@]/.gitignore/} # _FILES_NAME=${_FILES[@]%.gitignore}
echo $_FILES_NAME > $GIM_HOME/indexes

# 3. 更新 .zshrc
# copy to ~/.zshrc
if [ -z "$(cat ~/.zshrc | grep GIM_HOME)" ]; then
  echo "" >>~/.zshrc
  user_dir=$(echo ~)
  echo "export GIM_HOME=${GIM_HOME/${user_dir}/~}" >>~/.zshrc
  # echo "PATH=\$PATH:\$GIM_HOME/bin" >>~/.zshrc
  echo "[ -s \$GIM_HOME/gim_completion.sh ] && . \$GIM_HOME/gim_completion.sh" >>~/.zshrc
  echo "" >>~/.zshrc
fi

# end
cp $GIM_HOME/bin/gim /usr/local/bin/
