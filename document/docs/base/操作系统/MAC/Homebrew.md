

列出过时的软件包（已安装但不是最新版本）
brew outdated

更新过时的软件包（全部或指定）
brew upgrade 或 brew upgrade wget






1、通过brew install安装应用最先是放在/usr/local/Cellar/目录下。
2、有些应用会自动创建软链接放在/usr/bin或者/usr/sbin，同时也会将整个文件夹放在/usr/local
3、可以使用brew list 软件名确定安装位置。可以在mac终端直接输入 brew list mysql


安装 Homebrew：
命令粘贴至终端
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
Run `brew help` to get started
brew -v
brew更新到最新版本，执行：brew update


搜索软件：brew search 软件名，如brew search wget
安装软件：brew install 软件名，如brew install wget
卸载软件：brew remove 软件名，如brew remove wget
brew list           列出已安装的软件
brew update     更新brew
brew home       用浏览器打开brew的官方网站
brew info         显示软件信息
brew deps        显示包依赖



要获取最新的包的列表，首先得更新 Homebrew 自己。这可以用 brew update 办到。
brew update


更新包 (formula)
更新之前，我会用 brew outdated 查看哪些包可以更新。
brew outdated

然后就可以用 brew upgrade 去更新了。Homebrew 会安装新版本的包，但旧版本仍然会保留。
brew upgrade             # 更新所有的包
brew upgrade $FORMULA    # 更新指定的包


清理旧版本
一般情况下，新版本安装了，旧版本就不需要了。我会用 brew cleanup 清理旧版本和缓存文件。Homebrew 只会清除比当前安装的包更老的版本，所以不用担心有些包没更新但被删了。
brew cleanup             # 清理所有包的旧版本
brew cleanup $FORMULA    # 清理指定包的旧版本
brew cleanup -n          # 查看可清理的旧版本包，不执行实际操作
这样一套下来，该更新的都更新了，旧版本也被清理了。


锁定不想更新的包
如果经常更新的话，brew update 一次更新所有的包是非常方便的。但我们有时候会担心自动升级把一些不希望更新的包更新了。数据库就属于这一类，尤其是 PostgreSQL 跨 minor 版本升级都要迁移数据库的。我们更希望找个时间单独处理它。这时可用 brew pin 去锁定这个包，然后 brew update 就会略过它了。
brew pin $FORMULA      # 锁定某个包
brew unpin $FORMULA    # 取消锁定


其他几个常用命令
brew info 可以查看包的相关信息，最有用的应该是包依赖和相应的命令。比如 Nginx 会提醒你怎么加 launchctl ，PostgreSQL 会告诉你如何迁移数据库。这些信息会在包安装完成后自动显示，如果忘了的话可以用这个命令很方便地查看。
brew info $FORMULA    # 显示某个包的信息
brew info             # 显示安装了包数量，文件数量，和总占用空间
brew deps 可以显示包的依赖关系，我常用它来查看已安装的包的依赖，然后判断哪些包是可以安全删除的。
brew deps --installed --tree # 查看已安装的包的依赖，树形显示

还有很多有用的命令和参数，没事 man brew 一下可以涨不少知识。

参考定期更新 Homebrew
https://github.com/Homebrew/brew/blob/master/docs/FAQ.md
https://segmentfault.com/a/1190000004353419






