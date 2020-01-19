#!/bin/bash
# web install script

# temp variable
version=0.5.0
github_prefix=https://github.com/catshub/gim/archive/v$version.tar.gz

# root_dir
GIM_HOME=~/.gim
if [ ! -d $GIM_HOME ]; then
  mkdir $GIM_HOME
fi
cd $GIM_HOME

# get tar.gz
tmp_dir=$(mktemp -d gim.XXXXXXXXXX)
tmp_file=gim_$version.tar.gz
curl -L -o $tmp_file $github_prefix
tar -zxf $tmp_file -C $tmp_dir
mv $tmp_dir/*/* .

# clean
rm -rf $tmp_dir
rm $tmp_file

# do local install
bash local_install.sh
