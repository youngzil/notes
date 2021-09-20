- [Homebrew介绍和安装](#Homebrew介绍和安装)
    - [Homebrew安装](#Homebrew安装)
- [Homebrew常用的brew命令](#Homebrew常用的brew命令)
- [安装过程中遇到的问题](#安装过程中遇到的问题)
    - [连接不上网站的问题](#连接不上网站的问题)
- [Homebrew的brew install 和 brew cask install 的区别](#Homebrew的brew-install-和-brew-cask-install-的区别)


---------------------------------------------------------------------------------------------------------------------

## Homebrew介绍和安装

[Homebrew官网](https://brew.sh/)  
[Homebrew Documentation](https://docs.brew.sh/)  
[Homebrew Github](https://github.com/Homebrew/brew)  
[Mac App Store Search & Install any app on Mac](http://macappstore.org/)  




🍺 The missing package manager for macOS (or Linux)  
mac缺少macOS（或Linux）的软件包管理器


Homebrew 是一款 Mac OS 平台下的软件包管理工具，拥有安装、卸载、更新、查看、搜索等很多实用的功能。

Homebrew 通过简单的一条指令，就可以实现包管理，不需要关心各种依赖和文件路径的情况。

Homebrew 的两个术语：
- Formulae：软件包，包括了这个软件的依赖、源码位置及编译方法等；
- Casks：已经编译好的应用包，如图形界面程序等。


Homebrw相关的几个文件夹用途：
- bin：用于存放所安装程序的启动链接（相当于快捷方式）
- etc：brew安装程序的配置文件默认存放路径
- Library：Homebrew 系统自身文件夹
- Cellar：通过brew安装的程序将以 [程序名/版本号] 存放于本目录下

1. 通过brew install安装应用最先是放在/usr/local/Cellar/目录下。
2. 有些应用会自动创建软链接放在/usr/bin或者/usr/sbin，同时也会将整个文件夹放在/usr/local
3. 可以使用brew list 软件名确定安装位置。可以在mac终端直接输入 brew list mysql


### Homebrew安装

Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Run `brew help` to get started

brew -v

brew更新到最新版本，执行：brew update


---------------------------------------------------------------------------------------------------------------------

## Homebrew常用的brew命令

- 查看brew版本：brew -v
- 更新brew版本：brew update
- 本地软件库列表：brew list 列出已安装的软件
- 查看软件库版本：brew list --versions
- 查找/搜索软件包：brew search xxx （xxx为要查找软件的关键词），如brew search wget
- 安装软件包：brew install xxx （xxx为软件包名称），如brew install wget
- 卸载软件包：brew uninstall xxx
- 卸载软件：brew remove 软件名，如brew remove wget
- 安装软件：brew cask install xxx（xxx为软件名称）
- 卸载软件：brew cask uninstall xxx
- 查找软件安装位置：which xxx （xxx为软件名称）
- 列出过时的软件包（已安装但不是最新版本）：brew outdated
- 更新过时的软件包（全部或指定）：brew upgrade 或 brew upgrade wget
- 用浏览器打开brew的官方网站：brew home
- 显示软件信息：brew info
- 显示包依赖：brew deps


要获取最新的包的列表，首先得更新 Homebrew 自己。这可以用 brew update 办到。
- brew update


更新包 (formula)  
更新之前，我会用 brew outdated 查看哪些包可以更新。
- brew outdated

然后就可以用 brew upgrade 去更新了。Homebrew 会安装新版本的包，但旧版本仍然会保留。
- brew upgrade             # 更新所有的包
- brew upgrade $FORMULA    # 更新指定的包


清理旧版本  
一般情况下，新版本安装了，旧版本就不需要了。我会用 brew cleanup 清理旧版本和缓存文件。Homebrew 只会清除比当前安装的包更老的版本，所以不用担心有些包没更新但被删了。
- brew cleanup             # 清理所有包的旧版本
- brew cleanup $FORMULA    # 清理指定包的旧版本
- brew cleanup -n          # 查看可清理的旧版本包，不执行实际操作  
这样一套下来，该更新的都更新了，旧版本也被清理了。


锁定不想更新的包  
如果经常更新的话，brew update 一次更新所有的包是非常方便的。但我们有时候会担心自动升级把一些不希望更新的包更新了。数据库就属于这一类，尤其是 PostgreSQL 跨 minor 版本升级都要迁移数据库的。我们更希望找个时间单独处理它。这时可用 brew pin 去锁定这个包，然后 brew update 就会略过它了。
- brew pin $FORMULA      # 锁定某个包
- brew unpin $FORMULA    # 取消锁定


其他几个常用命令
- brew info 可以查看包的相关信息，最有用的应该是包依赖和相应的命令。比如 Nginx 会提醒你怎么加 launchctl ，PostgreSQL 会告诉你如何迁移数据库。这些信息会在包安装完成后自动显示，如果忘了的话可以用这个命令很方便地查看。
- brew info $FORMULA    # 显示某个包的信息
- brew info             # 显示安装了包数量，文件数量，和总占用空间
- brew deps 可以显示包的依赖关系，我常用它来查看已安装的包的依赖，然后判断哪些包是可以安全删除的。
- brew deps --installed --tree # 查看已安装的包的依赖，树形显示

还有很多有用的命令和参数，没事 man brew 一下可以涨不少知识。

参考定期更新 Homebrew  
https://github.com/Homebrew/brew/blob/master/docs/FAQ.md  
https://segmentfault.com/a/1190000004353419  
[Homebrew常用安装卸载命令](https://blog.csdn.net/jelatinprotain/article/details/111191407)  

---------------------------------------------------------------------------------------------------------------------
## 安装过程中遇到的问题

### 连接不上网站的问题

1. 如何解决类似 curl: (7) Failed to connect to raw.githubusercontent.com port 443: Connection refused 的问题

笔者最近发现 github 的用户头像和自己文章中的图片显示不出来了。然后今天发现安装 homeBrew 和 nvm 出现了标题的报错信息。

以上是安装 pnpm 的报错信息，可以发现，脚本需要到 raw.githubusercontent.com 上拉取代码。

网上搜索了一下，发现是 github 的一些域名的 DNS 解析被污染，导致DNS 解析过程无法通过域名取得正确的IP地址。


### 解决方案

打开 [https://www.ipaddress.com/](https://www.ipaddress.com/) 输入访问不了的域名

查询之后可以获得正确的 IP 地址

在本机的 host 文件中添加，建议使用 switchhosts 方便 host 管理
```
199.232.68.133 raw.githubusercontent.com
199.232.68.133 user-images.githubusercontent.com
199.232.68.133 avatars2.githubusercontent.com
199.232.68.133 avatars1.githubusercontent.com
```

添加以上几条 host 配置，页面的图片展示就正常了，homebrew 也能装了，nvm 也行动灵活了。


参考  
[如何解决类似 curl: (7) Failed to connect to raw.githubusercontent.com port 443: Connection refused 的问题 #10](https://github.com/hawtim/blog/issues/10)


---------------------------------------------------------------------------------------------------------------------
## Homebrew的brew install 和 brew cask install 的区别

Homebrew 提供了两种安装软件的方式，brew install 和 brew cask install，下面对两种方式进行一些解释说明。

### 1. brew install

brew 是下载源码解压，然后 ./configure && make install ，同时会包含相关依存库，并自动配置好各种环境变量。

Homebrew is the easiest and most flexible way to install the UNIX tools Apple didn’t include with macOS.

对于对程序员只需通过简单的指令，就能快速安装和升级本地的各种开发环境，非常快捷方便。



### 2. brew cask install
brew cask 是针对已经编译好了的应用包（.dmg/.pkg）下载解压，然后放在统一的目录中（Caskroom），省掉了自己下载、解压、安装等步骤。

Homebrew-Cask extends Homebrew and brings its elegance, simplicity, and speed to macOS applications and large binaries alike.

这个对一般用户来说会比较方便，包含很多在 AppStore 里没有的常用软件。


简单来说，
- brew install 用来安装一些不带界面的命令行工具和第三方库。
- brew cask install 用来安装一些带界面的应用软件。



参考  
[brew install 和 brew cask install 的区别](https://zhuanlan.zhihu.com/p/138059447)  
[brew和brew cask有什么区别？](https://www.zhihu.com/question/22624898)  



---------------------------------------------------------------------------------------------------------------------









