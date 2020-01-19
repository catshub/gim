#!/bin/bash
# web install script

# temp variable
version=0.3.0
tmp_dir=$(mktemp -d gim.XXXXXXXXXX)
github_prefix=https://github.com/catshub/gim/archive/v$version.tar.gz

# root_dir
GIM_HOME=~/.gim
if [ ! -d $GIM_HOME ]; then
  mkdir $GIM_HOME
fi
cd $GIM_HOME

# get tar.gz
tmp_file=gim_$version
curl -L -o $tmp_file.tar.gz $github_prefix
tar -zxf $tmp_file -C $tmp_file
mv $tmp_file/*/* .gim

# clean
rm -rf $tmp_file
rm $tmp_file.tar.gz

# do local install
bash local_install.sh
