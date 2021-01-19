- [Git下载代码、提交代码、查看记录、查看状态、提交、回滚](#Git下载代码、提交代码、查看记录、查看状态、提交、回滚)
- [Git修改和配置用户名和邮箱](#Git修改和配置用户名和邮箱)
- [本地代码库回滚和远程代码库回滚](#本地代码库回滚和远程代码库回滚)
- [一、git clone](#一、git clone)
- [二、git remote](#二、git remote)
- [三、git fetch](#三、git fetch)
- [四、git pull](#四、git pull)
- [五、git push](#五、git push)
- [Git恢复之前版本的两种方法reset、revert](#Git恢复之前版本的两种方法reset、revert)
- [Git撤销中间某次提交](#Git撤销中间某次提交)
- [Git仓库分支(Branch)和标签(Tag)](#Git仓库分支(Branch)和标签(Tag))
- [Git推送tag到服务端](#Git推送tag到服务端)
- [Git还原最近一次提交记录](#Git还原最近一次提交记录)
- [Git撤销已经提交到远程服务器的commit](#Git撤销已经提交到远程服务器的commit)


---------------------------------------------------------------------------------------------------------------------
## Git下载代码、提交代码、查看记录、查看状态、提交、回滚


Git官网
https://git-scm.com/book/zh/v2



git使用用户名密码clone的方式：
git clone http://username:password@remote

eg: username:  abc@qq.com, pwd: test, git地址为git@xxx.com/test.git
git clone http://abc%40qq.com:test@git@xxx.com/test.git
注意：用户名密码中一定要转义 @符号转码后变成了%40

git clone http://abc%40qq.com:test@git@xxx.com/test.git $HOME/test


使用Git下载指定分支命令为：git clone -b 分支名仓库地址
使用Git下载v.2.8.1分支代码，使用命令：git clone -b v2.8.1 https://git.oschina.net/oschina/android-app.git



更新
git pull <远程主机名> <远程分支名>:<本地分支名>
比如，取回origin主机的next分支，与本地的master分支合并，需要写成下面这样。

$ git pull origin next:master
如果远程分支是与当前分支合并，则冒号后面的部分可以省略。

$ git pull origin next
上面命令表示，取回origin/next分支，再与当前分支合并。实质上，这等同于先做git fetch，再做git merge。



提交
git add .
git commit -m "add 3 files." // 一次性提交3个文件
git push origin master
上面命令表示，将本地的master分支推送到origin主机的master分支。如果后者不存在，则会被新建。
如果省略本地分支名，则表示删除指定的远程分支，因为这等同于推送一个空的本地分支到远程分支。



查看历史、状态
git log显示历史的提交列表
git show <commit-hashId> 便可以显示某次提交的修改内容
git show <commit-hashId> filename 可以显示某次提交的某个内容的修改信息。
git log --author="yangzl"

git status // 查看当前仓库状态（仓库下的工作区文件是否被修改过）



回滚
git reset --hard the_commit_id //把the_branch本地回滚到the_commit_id
git push origin :the_branch //删除远程 the_branch




比较版本不同
git diff readme.txt // 查看工作区的readme.txt与缓存区的readme.txt的区别




branch分支查看新建删除

#查看本地都有哪些分支
git branch

#查看所有的分支，包括远程的
git branch -a

#删除本地的某个分支
git branch -D hongchangfirst

#删除远程的分支
git branch -r -d origin/hongchangfirst

【git 删除远程分支】冒号前面的空格不能少，相当于把一个空分支push到server上，等于删除该分支。
git push origin :br (origin 后面有空格)


查看命令帮助
git switch -h
git clone -h


参考
https://www.cnblogs.com/chris0710/p/8925977.html
https://www.liaoxuefeng.com/wiki/896043488029600/896954074659008


---------------------------------------------------------------------------------------------------------------------
## 本地代码库回滚和远程代码库回滚

【本地代码库回滚】：
git reset --hard commit-id :回滚到commit-id，讲commit-id之后提交的commit都去除
git reset --hard HEAD~3：将最近3次的提交回滚


【远程代码库回滚】：
这个是重点要说的内容，过程比本地回滚要复杂
应用场景：自动部署系统发布后发现问题，需要回滚到某一个commit，再重新发布
原理：先将本地分支退回到某个commit，删除远程分支，再重新push本地分支

操作步骤：
1、git checkout the_branch
2、git pull
3、git branch the_branch_backup //备份一下这个分支当前的情况
4、git reset --hard the_commit_id //把the_branch本地回滚到the_commit_id
5、git push origin :the_branch //删除远程 the_branch
6、git push origin the_branch //用回滚后的本地分支重新建立远程分支
7、git push origin :the_branch_backup //如果前面都成功了，删除这个备份分支




---------------------------------------------------------------------------------------------------------------------

## Git修改和配置用户名和邮箱

git修改提交作者和邮箱

用户名和邮箱地址的作用
用户名和邮箱地址是本地git客户端的一个变量，不随git库而改变。
每次commit都会用用户名和邮箱纪录。
github的contributions统计就是按邮箱来统计的。

查看用户名和邮箱地址：
$ git config user.name
$ git config user.email

$ 
git config user.name "yangzl"
git config user.email "yangzl@XXX.com"

// 或者设置本地项目库配置，进入到仓库的根目录下面执行就可以了
git config user.name "yangzl"
git config user.email "youngzil@163.com"


修改用户名和邮箱地址：设置全局
git config --global user.name "yangzl"
git config --global user.email "youngzil@163.com"


参考
cnblogs.com/sunshinekevin/p/11617547.html
https://blog.csdn.net/cxq2111504104/article/details/102931136
https://blog.csdn.net/diu_brother/article/details/51982993




---------------------------------------------------------------------------------------------------------------------
§ git clone
§ git remote
§ git fetch
§ git pull
§ git push
---------------------------------------------------------------------------------------------------------------------
## 一、git clone

远程操作的第一步，通常是从远程主机克隆一个版本库，这时就要用到git clone命令。

 

$ git clone <版本库的网址>

比如，克隆jQuery的版本库。

 

$ git clone https://github.com/jquery/jquery.git

该命令会在本地主机生成一个目录，与远程主机的版本库同名。如果要指定不同的目录名，可以将目录名作为git clone命令的第二个参数。

 

$ git clone <版本库的网址> <本地目录名>

git clone支持多种协议，除了HTTP(s)以外，还支持SSH、Git、本地文件协议等，下面是一些例子。

 

$ git clone http[s]://example.com/path/to/repo.git/

$ git clone ssh://example.com/path/to/repo.git/

$ git clone git://example.com/path/to/repo.git/

$ git clone /opt/git/project.git

$ git clone file:///opt/git/project.git

$ git clone ftp[s]://example.com/path/to/repo.git/

$ git clone rsync://example.com/path/to/repo.git/

SSH协议还有另一种写法。

 

$ git clone [user@]example.com:path/to/repo.git/
通常来说，Git协议下载速度最快，SSH协议用于需要用户认证的场合。各种协议优劣的详细讨论请参考官方文档。

---------------------------------------------------------------------------------------------------------------------
## 二、git remote


$ git remote
origin
使用-v选项，可以参看远程主机的网址。
 

$ git remote -v
origin  git@github.com:jquery/jquery.git (fetch)
origin  git@github.com:jquery/jquery.git (push)

上面命令表示，当前只有一台远程主机，叫做origin，以及它的网址。
克隆版本库的时候，所使用的远程主机自动被Git命名为origin。如果想用其他的主机名，需要用git clone命令的-o选项指定。

$ git clone -o jQuery https://github.com/jquery/jquery.git

$ git remote
jQuery

上面命令表示，克隆的时候，指定远程主机叫做jQuery。
git remote show命令加上主机名，可以查看该主机的详细信息。

$ git remote show <主机名>
git remote add命令用于添加远程主机。

$ git remote add <主机名> <网址>
git remote rm命令用于删除远程主机。

$ git remote rm <主机名>
git remote rename命令用于远程主机的改名。

$ git remote rename <原主机名> <新主机名>


---------------------------------------------------------------------------------------------------------------------

## 三、git fetch

一旦远程主机的版本库有了更新（Git术语叫做commit），需要将这些更新取回本地，这时就要用到git fetch命令。

 

$ git fetch <远程主机名>

上面命令将某个远程主机的更新，全部取回本地。

git fetch命令通常用来查看其他人的进程，因为它取回的代码对你本地的开发代码没有影响。

默认情况下，git fetch取回所有分支（branch）的更新。如果只想取回特定分支的更新，可以指定分支名。

 

$ git fetch <远程主机名> <分支名>

比如，取回origin主机的master分支。

 

$ git fetch origin master

所取回的更新，在本地主机上要用"远程主机名/分支名"的形式读取。比如origin主机的master，就要用origin/master读取。

git branch命令的-r选项，可以用来查看远程分支，-a选项查看所有分支。

 

$ git branch -r

origin/master

 

$ git branch -a

* master

  remotes/origin/master

上面命令表示，本地主机的当前分支是master，远程分支是origin/master。

取回远程主机的更新以后，可以在它的基础上，使用git checkout命令创建一个新的分支。

 

$ git checkout -b newBrach origin/master

上面命令表示，在origin/master的基础上，创建一个新分支。

此外，也可以使用git merge命令或者git rebase命令，在本地分支上合并远程分支。

git checkout 版本号
git reset HEAD
 

 

$ git merge origin/master

# 或者

$ git rebase origin/master

上面命令表示在当前分支上，合并origin/master。


---------------------------------------------------------------------------------------------------------------------

## 四、git pull

git pull命令的作用是，取回远程主机某个分支的更新，再与本地的指定分支合并。它的完整格式稍稍有点复杂。

 

$ git pull <远程主机名> <远程分支名>:<本地分支名>

比如，取回origin主机的next分支，与本地的master分支合并，需要写成下面这样。

 

$ git pull origin next:master

如果远程分支是与当前分支合并，则冒号后面的部分可以省略。

 

$ git pull origin next

上面命令表示，取回origin/next分支，再与当前分支合并。实质上，这等同于先做git fetch，再做git merge。

 

$ git fetch origin

$ git merge origin/next

在某些场合，Git会自动在本地分支与远程分支之间，建立一种追踪关系（tracking）。比如，在git clone的时候，所有本地分支默认与远程主机的同名分支，建立追踪关系，也就是说，本地的master分支自动"追踪"origin/master分支。

Git也允许手动建立追踪关系。

 

git branch --set-upstream master origin/next

上面命令指定master分支追踪origin/next分支。

如果当前分支与远程分支存在追踪关系，git pull就可以省略远程分支名。

 

$ git pull origin

上面命令表示，本地的当前分支自动与对应的origin主机"追踪分支"（remote-tracking branch）进行合并。

如果当前分支只有一个追踪分支，连远程主机名都可以省略。

 

$ git pull

上面命令表示，当前分支自动与唯一一个追踪分支进行合并。

如果合并需要采用rebase模式，可以使用--rebase选项。

 

$ git pull --rebase <远程主机名> <远程分支名>:<本地分支名>

如果远程主机删除了某个分支，默认情况下，git pull 不会在拉取远程分支的时候，删除对应的本地分支。这是为了防止，由于其他人操作了远程主机，导致git pull不知不觉删除了本地分支。

但是，你可以改变这个行为，加上参数 -p 就会在本地删除远程已经删除的分支。

 

$ git pull -p

# 等同于下面的命令

$ git fetch --prune origin

$ git fetch -p

---------------------------------------------------------------------------------------------------------------------


## 五、git push

git push命令用于将本地分支的更新，推送到远程主机。它的格式与git pull命令相仿。

 

$ git push <远程主机名> <本地分支名>:<远程分支名>

注意，分支推送顺序的写法是<来源地>:<目的地>，所以git pull是<远程分支>:<本地分支>，而git push是<本地分支>:<远程分支>。

如果省略远程分支名，则表示将本地分支推送与之存在"追踪关系"的远程分支（通常两者同名），如果该远程分支不存在，则会被新建。

 

$ git push origin master

上面命令表示，将本地的master分支推送到origin主机的master分支。如果后者不存在，则会被新建。

如果省略本地分支名，则表示删除指定的远程分支，因为这等同于推送一个空的本地分支到远程分支。

 

$ git push origin :master

# 等同于

$ git push origin --delete master

上面命令表示删除origin主机的master分支。

如果当前分支与远程分支之间存在追踪关系，则本地分支和远程分支都可以省略。

 

$ git push origin

上面命令表示，将当前分支推送到origin主机的对应分支。

如果当前分支只有一个追踪分支，那么主机名都可以省略。

 

$ git push

如果当前分支与多个主机存在追踪关系，则可以使用-u选项指定一个默认主机，这样后面就可以不加任何参数使用git push。

 

$ git push -u origin master

上面命令将本地的master分支推送到origin主机，同时指定origin为默认主机，后面就可以不加任何参数使用git push了。

不带任何参数的git push，默认只推送当前分支，这叫做simple方式。此外，还有一种matching方式，会推送所有有对应的远程分支的本地分支。Git 2.0版本之前，默认采用matching方法，现在改为默认采用simple方式。如果要修改这个设置，可以采用git config命令。

 

$ git config --global push.default matching

# 或者

$ git config --global push.default simple

还有一种情况，就是不管是否存在对应的远程分支，将本地的所有分支都推送到远程主机，这时需要使用--all选项。

 

$ git push --all origin

上面命令表示，将所有本地分支都推送到origin主机。

如果远程主机的版本比本地版本更新，推送时Git会报错，要求先在本地做git pull合并差异，然后再推送到远程主机。这时，如果你一定要推送，可以使用--force选项。

 

$ git push --force origin

上面命令使用--force选项，结果导致远程主机上更新的版本被覆盖。除非你很确定要这样做，否则应该尽量避免使用--force选项。

最后，git push不会推送标签（tag），除非使用--tags选项。

 

$ git push origin --tags


---------------------------------------------------------------------------------------------------------------------

## Git恢复之前版本的两种方法reset、revert



git reset
原理： git reset的作用是修改HEAD的位置，即将HEAD指向的位置改变为之前存在的某个版本

1. 查看版本号：
git log

2. 使用“git reset --hard 目标版本号”命令将版本回退：
git reset --hard 目标版本号
git log

3. 使用“git push -f”提交更改：
git push -f【此时如果用“git push”会报错，因为我们本地库HEAD指向的版本比远程库的要旧】



git revert
原理： git revert是用于“反做”某一个版本，以达到撤销该版本的修改的目的。比如，我们commit了三个版本（版本一、版本二、 版本三），突然发现版本二不行（如：有bug），想要撤销版本二，但又不想影响撤销版本三的提交，就可以用 git revert 命令来反做版本二，生成新的版本四，这个版本四里会保留版本三的东西，但撤销了版本二的东西。

1. 查看版本号：
git log

2.使用“git revert -n 版本号”反做，并使用“git commit -m 版本名”提交：
git revert -n 8b89621019c9adc6fc4d242cd41daeb13aeb9861
注意： 这里可能会出现冲突，那么需要手动修改冲突的文件。而且要git add 文件名。
git commit -m "revert add text.txt" 
git log

3.使用“git push”推上远程库：
git push


参考
https://blog.csdn.net/yxlshk/article/details/79944535


---------------------------------------------------------------------------------------------------------------------

## Git撤销中间某次提交


1、普通的简单提交，直接git revert然后push提交就好了
git revert 100047dcc


2、如果是撤销一个merge的提交，
    先查看父commit_id：git log commit_id：比如Merge: 80d8b76f 7b8c0e95
    git revert 100047dcc -m 1，参数 -m 就是指定要撤销的那个提价，从左往右，从1开始数；也就是我撤销的是80d8b76f，如果要撤销7b8c0e95，就是-m 2
    接着其把代码冲突，然后我就解决冲突，保留主分支的代码，去掉那个人的代码。
    然后push提交就好了




参考
https://blog.csdn.net/u013066244/article/details/79920012



---------------------------------------------------------------------------------------------------------------------
## Git仓库分支(Branch)和标签(Tag)

标签(Tag)也是属于仓库Repository的



一、tag 标签使用方法

1. 列出标签
# git tag #     //在控制台打印出当前仓库的所有标签
# git tag -l ‘v0.1.*’ #   //搜索符合模式的标签


2 打标签
客户端上操作：
#git clone http://admin@ald8.cn:8080/r/ald8.git  //先连接下载分支
# git checkout master   //切到master
# git tag v1.00440376 -m "20190424第一版"     //tag 自定义版本标识 版本id号 -m "备注“


3. 切换标签（这个适用于代码回滚或切换到指定标签版本）
git checkout [tagname]  //与切换分支命令相同
# git checkout V1.02     //当前目录全部代码切换到V1.02时的代码  


4. 删除标签
客户端上操作：
# git tag  -d v1.00         //删除本地标签
# git push origin  :v1.00   //删除git服务器上的标签


5. 标签发布
# git push origin V1.00      //将V1.00标签提交到git服务器
# git push origin --tags #   //将本地所有标签一次性提交到git服务器



二、发布和回滚

代码第一次上线发布做版本标签
# git tag v1.00 440376 -m "20190424第一版"  //打标签
#  git push origin V1.00   //标签发布
# git checkout v1.00       //开始切换版本到v1.00，文件结构会自动更新


第二次上线发布做版本标签git tag V1.01
[root@ald8 www]# cd /data/www/ald8   
[root@ald8 ald8]# git tag v1.010a7e9f -m "	20190430" //打标签
[root@ald8 ald8]#  git push origin v1.01   //标签发布
[root@ald8 ald8]# cp -rp ald8 ald8.v1.00   //切换版本时先备份，可以应急手动快速回滚第一个版本
[root@ald8 ald8]# git checkout v1.01       //开始切换版本到v1.01，文件结构会自动更新
Previous HEAD position was 440376f... Initial commit
HEAD is now at 0a7e9fc... 111


假如第二次发布的版本发现有bug，需要快速回滚到第一版本，这里有两种方式
A . 删除备当前版本目录文件ald8，再将第一版的备份文件ald8.v1.00改名成ald8即可.
[root@ald8 /]# rm /data/www/ald8 -rf 
[root@ald8 /]# mv /data/www/ald8.v1.00 /data/www/ald8

B. 使用git切换版本的功能，直接执行切换命令即可
[root@ald8 /]# cd /data/www/ald8
[root@ald8 ald8]# git checkout v1.00
Previous HEAD position was 0a7e9fc... 111
HEAD is now at 440376f... Initial commit
这样就完成了版本的回滚。




参考
https://blog.csdn.net/iprettydeveloper/article/details/53944125
https://blog.csdn.net/cbuy888/article/details/89497440
https://www.cnblogs.com/senlinyang/p/8527764.html
https://blog.csdn.net/jdsjlzx/article/details/98654951


---------------------------------------------------------------------------------------------------------------------
## Git推送tag到服务端



将tag同步到远程服务器
git push origin v20201215-RELEASE

推送所有：
git push origin --tags


1.push单个tag推送
git push origin [tagname]

2.push所有tag
git push --tags
或
git push origin --tags

 
很早之前，我们就提到过用git tag来给工程打上标签，但是这个命令只是在本地仓库打标签而已，

为了能把标签同步到远程服务器，我们可以这样做：

默认情况下，git push并不会把tag标签传送到远端服务器上，只有通过显式命令才能分享标签到远端仓库。
1.push单个tag，命令格式为：git push origin [tagname]
例如：
git push origin v1.0 #将本地v1.0的tag推送到远端服务器


2.push所有tag，命令格式为：git push [origin] --tags
例如：
git push --tags
或
git push origin --tags

以上命令经检验通过，如果不起作用，请在Git控制台上确认你的账号是否有权限推送Tag。这一点很重要，因为这个原因，我有过一段时间很抓狂。



创建Tag
git tag -a tagName -m "my tag"

给指定的某个commit号加tag
git tag -a v1.2 9fceb02 -m "my tag"


列出已有的tag
git tag

#查询远程tags的命令如下：
git ls-remote --tags origin


git删除tag
git tag -d tagName 删除tag
git push origin :refs/tags/tagName  删除远程
git push origin :refs/tags/2020-09-07-RELEASE  删除远程

git tag -d 2020-01-16-RELEASE
git tag -d 2020-05-19-RELEASE
git tag -d 2020-06-09-RELEASE
git tag -d 2020-06-16-RELEASE
git tag -d 2020-06-23-RELEASE
git tag -d 2020-07-14-RELEASE
git tag -d 2020-08-11-RELEASE
git tag -d v20200907-RELEASE
git tag -d v20200923-RELEASE
git tag -d v20200927-RELEASE
git tag -d v20201023-RELEASE


git push origin :refs/tags/2020-01-16-RELEASE
git push origin :refs/tags/2020-05-19-RELEASE
git push origin :refs/tags/2020-06-09-RELEASE
git push origin :refs/tags/2020-06-16-RELEASE
git push origin :refs/tags/2020-06-23-RELEASE
git push origin :refs/tags/2020-07-14-RELEASE
git push origin :refs/tags/2020-08-11-RELEASE
git push origin :refs/tags/v20200907-RELEASE
git push origin :refs/tags/v20200923-RELEASE
git push origin :refs/tags/v20200927-RELEASE
git push origin :refs/tags/v20201023-RELEASE


git tag -d v20201215-RELEASE
git push origin :refs/tags/v20201215-RELEASE




tag重命名：先根据已有的tag创建一个新的tag推送到服务器，再删除

把【2020-09-07-RELEASE4】重命名为【v20200907-RELEASE】

git tag v20200907-RELEASE 2020-09-07-RELEASE4
git push origin v20200907-RELEASE

git tag -d 2020-09-07-RELEASE4
git push origin :refs/tags/2020-09-07-RELEASE4




问题场景：
同事A在本地创建tagA并push同步到了远程->同事B在本地拉取了远程tagA(git fetch)->同事A工作需要将远程标签tagA删除->同事B用git fetch同步远端信息，git tag后发现本地仍然记录有tagA

分析：对于远程repository中已经删除了的tag，即使使用git fetch --prune，甚至"git fetch --tags"确保下载所有tags，也不会让其在本地也将其删除的。而且，似乎git目前也没有提供一个直接的命令和参数选项可以删除本地的在远程已经不存在的tag（我目前是没找到有关这类tag问题的git命令~~，有知道的同学可以告知我下，互相进步）。
解决方法：

git tag -l | xargs git tag -d #删除所有本地分支
git fetch origin --prune #从远程拉取所有信息
git branch --contains Tag_V1.0.0 # 看看本地哪个分支包含这个tag/commit

#查询远程tags的命令如下：
git ls-remote --tags origin

tag常用git命令：
git tag #列出所有tag
git tag -l v1.* #列出符合条件的tag（筛选作用）
git tag [tag名] #创建轻量tag（无-m标注信息）
git tag -a [tag名] #创建含注解的tag

git push origin --tags #推送所有本地tag到远程
git push origin [本地tag名] #推送指定本地tag到远程

git tag -d [本地tag名] #删除本地指定tag
git push origin :refs/tags/[远程tag名] #删除远程指定tag

git fetch origin [远程tag名] #拉取远程指定tag
git show [tag名] #显示指定tag详细信息


---------------------------------------------------------------------------------------------------------------------
## Git还原最近一次提交记录


首先先把本地的代码备份

git stash save 'message...可以添加一些注释'

显示保存进度的列表。也就意味着，git stash命令可以多次执行。

git stash list


版本号可用如下指令查看

git log remotes/origin/master

先在本地回退到需要的版本

git reset --hard 6f2c8c38

强制把本地提交到远端覆盖远端的【必须是自己提交后没有其他人提交】

git push origin master --force



更新代码

git pull


通过git stash pop命令恢复进度后，会删除当前进度。

git stash pop [–index] [stash_id]
git stash pop 恢复最新的进度到工作区。git默认会把工作区和暂存区的改动都恢复到工作区。
git stash pop --index 恢复最新的进度到工作区和暂存区。（尝试将原来暂存区的改动还恢复到暂存区）
git stash pop stash@{1}恢复指定的进度到工作区。stash_id是通过git stash list命令得到的



git stash apply [–index] [stash_id]
除了不删除恢复的进度之外，其余和git stash pop 命令一样。

git stash drop [stash_id]
删除一个存储的进度。如果不指定stash_id，则默认删除最新的存储进度。

git stash clear
删除所有存储的进度。



---------------------------------------------------------------------------------------------------------------------

## Git撤销已经提交到远程服务器的commit



0零【可选】、如果需要可以把本地的先暂存起来

git stash save "暂存区名字"


一、使用git log查看需要撤回的commitId

git log

二、撤销：

方式一：  
//撤销commit，但不修改代码  
git reset commitId

方式二：  
//撤销commit，同时将代码恢复到对应ID的版本  
git reset --hard commitId


三、需要将撤销提交到远程服务器的执行：

git push origin HEAD --force


四、需要将撤销提交到远程服务器的执行：

git push origin HEAD --force


五【可选】、如果执行了第 0零 步，需要还原  
在IDEA中最好可以直接使用可视化界面操作  

git stash pop命令恢复之前缓存的工作目录 这个指令将缓存堆栈中的第一个stash删除，并将对应修改应用到当前的工作目录下。

git stash apply命令，将缓存堆栈中的stash多次应用到工作目录中，但并不删除stash拷贝。



参考  
https://www.cnblogs.com/pbblogs/p/11922638.html



---------------------------------------------------------------------------------------------------------------------
