#!/bin/bash

# shellcheck disable=SC2045
echo "全局用户：`git config --global user.name`"
echo "全局邮箱：`git config --global user.email`"

for dir in $(ls .)
do
  if [ -d $dir ]
  then
    cd $dir
    echo '----------------------------------------------------------------'
    echo "当前文件夹是$dir"
    echo "用户：`git config user.name`"
    echo "邮箱：`git config user.email`"

    git config user.name "yangzl"
    git config user.email "youngzil@163.com"

    echo "设置用户和邮箱后"
    echo "用户：`git config user.name`"
    echo "邮箱：`git config user.email`"
    cd ../
  fi
done
