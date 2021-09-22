- [Git介绍](#Git介绍)
- [Git分支管理和提交注释规范](#Git分支管理和提交注释规范)
- [MacOS 给 Git(Github)设置代理（HTTP/SSH）](#MacOS给Git(Github)设置代理（HTTP/SSH）)
- [](#)
- [](#)



---------------------------------------------------------------------------------------------------------------------

## Git介绍

Git客户端：
https://git-scm.com/
https://github.com/git/git
https://github.com/git/git-scm.com
https://git-scm.com/book/zh/v2

Git大文件存储，Git Large File Storage：
https://git-lfs.github.com
https://github.com/git-lfs/git-lfs



.ignore插件：
https://github.com/hsz/idea-gitignore
https://github.com/github/gitignore




https://www.gitbook.com/
https://github.com/GitbookIO/gitbook

https://github.com/git-tips/tips

https://git-scm.com/book/zh/v1/%E8%B5%B7%E6%AD%A5-%E5%AE%89%E8%A3%85-Git


Git的gitattributes文件详解
https://blog.csdn.net/taiyangdao/article/details/78484623



---------------------------------------------------------------------------------------------------------------------
## Git分支管理和提交注释规范


Git分支管理规范：Git-flow方式
Git-flow工具：Sourcetree、IDEA插件（Git Flow Integration、GitToolBox、Git Commit Template）
Git提交注释规范：<type>(<scope>): <subject> // 提交消息头Message header 



Git提交注释日志规范
细节见：https://www.jianshu.com/p/d0ba3c2b678d
最广泛的 angular 规范 ，大家可以瞻仰下：  https://github.com/angular/angular/commits/master

如何规范你的Git commit？
https://developer.aliyun.com/article/770277



IDEA插件
GitToolBox
Git Flow Integration
Git Commit Template



---------------------------------------------------------------------------------------------------------------------

## Git上传文件报错

LFS upload missing objects, tried manually uploading

git lfs fetch --all
git lfs push --all origin master
git config -f .lfsconfig lfs.url https://github.com/youngzil/notes.git/info/lfs




---------------------------------------------------------------------------------------------------------------------
## MacOS给Git(Github)设置代理（HTTP/SSH）


## 分辨需要设置的代理

- HTTP 形式：
  > git clone https://github.com/owner/git.git
- SSH 形式：
  > git clone git@github.com:owner/git.git

## 一、HTTP 形式
### 走 HTTP 代理

```bash
git config --global http.proxy "http://127.0.0.1:8080"
git config --global https.proxy "http://127.0.0.1:8080"
```

### 走 socks5 代理（如 Shadowsocks）

```bash
git config --global http.proxy "socks5://127.0.0.1:1080"
git config --global https.proxy "socks5://127.0.0.1:1080"
```

### 取消设置

```bash
git config --global --unset http.proxy
git config --global --unset https.proxy
```

## 二、SSH 形式

修改 `~/.ssh/config` 文件（不存在则新建）：

```
# 必须是 github.com
Host github.com
   HostName github.com
   User git
   # 走 HTTP 代理
   # ProxyCommand socat - PROXY:127.0.0.1:%h:%p,proxyport=8080
   # 走 socks5 代理（如 Shadowsocks）
   # ProxyCommand nc -v -x 127.0.0.1:1080 %h %p
```


参考  
https://gist.github.com/chuyik/02d0d37a49edc162546441092efae6a1


---------------------------------------------------------------------------------------------------------------------


