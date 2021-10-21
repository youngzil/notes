# Git实际使用

## 通过git统计代码行数

统计一段时间内某个用户（提交记录）的增删行数
```shell
git log --author="lengfeng" --since='2021-03-01' --until='2021-03-02' --pretty=tformat: --numstat | awk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "增加的行数:%s 删除的行数:%s 总行数: %s\n",add,subs,loc }'
```
或者
```shell
git log --after="2021-03-02" --before="2021-03-04" --author="$(git config --get user.name)" --pretty=tformat: --numstat | awk '{ add += $1 ; subs += $2 ; loc += $1 + $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }'
```


git扫描 Log 单独统计每个人的增删行数
```shell
git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 + $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
```



git统计某一开发者提交代码的增删改动行数和具体详细的改动内容
```shell
echo "统计结果" && git log --author="lengfeng" --after="2018-04-16" --before="2021-04-16" --pretty=tformat: --numstat | awk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "增加行数:%s 删除行数:%s 变化总行数:%s\n",add,subs,loc }' && echo "详情如下:" && git log --word-diff --author="lengfeng" --since="2018-04-16 00:00:01" --until="2021-04-16 12:00:00" -p --stat
```

其实合并了两条git命令一次性输出：
```shell
git log --author="lengfeng" --after="2018-04-16" --before="2021-04-16" --pretty=tformat: --numstat | awk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "增加行数:%s 删除行数:%s 变化总行数:%s\n",add,subs,loc }'
```
和
```shell
git log --word-diff --author="lengfeng" --since="2018-04-16 00:00:01" --until="2021-04-16 12:00:00" -p --stat
```

参考  
[Mac通过git统计代码行数](https://blog.csdn.net/navysir8/article/details/78804740)  
[统计本地Git仓库中不同贡献者的代码行数的一些方法](https://blog.csdn.net/hp910315/article/details/52197614)  
[统计代码git提交的行数](https://www.cnblogs.com/xingzc/p/5987087.html)  



## 循环目录下所有项目设置Git用户和邮箱

setGitUserAndMail.sh

```shell
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
```

