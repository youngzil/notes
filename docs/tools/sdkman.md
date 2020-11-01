1、官网
2、安装和使用
3、管理JDK版本
4、管理Gradle版本


---------------------------------------------------------------------------------------------------------------------


[SDKMAN官网](https://sdkman.io/)  
[SDKMAN Github](https://github.com/sdkman/sdkman-cli)  



---------------------------------------------------------------------------------------------------------------------
安装和使用


安装：
curl -s "https://get.sdkman.io" | bash

source "$HOME/.sdkman/bin/sdkman-init.sh"


sdk version

sdk help

sdk list

SDKMAN!版本升级
$ sdk selfupdate

# 强制重新安装
$ sdk selfupdate force


sdkman 卸载
如果我们不喜欢 sdkman 了，我们也可以轻松的卸载掉它:

$ tar zcvf ~/sdkman-backup_$(date +%F-%kh%M).tar.gz -C ~/ .sdkman
$ rm -rf ~/.sdkman
最后打开你的 .bashrc、.bash_profile 和/或者 .profile，找到并删除下面这几行。

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/home/dudette/.sdkman/bin/sdkman-init.sh" ]] && source "/home/dudette/.sdkman/bin/sdkman-init.sh"
我用的 zshrc，找到 .zshrc 文件删除掉上面内容即可



参考
https://sdkman.io/install
https://www.baeldung.com/java-sdkman-intro
https://www.cnblogs.com/FraserYu/p/11880130.html
https://www.jianshu.com/p/8597c22550a6
https://sourabhbajaj.com/mac-setup/Java/sdkman.html


---------------------------------------------------------------------------------------------------------------------
管理JDK版本


列出Java的版本
sdk list java


安装Java JDk
sdk install java 14.0.2-zulu


使用JDK版本
sdk use java 14.0.1.j9-adpt

默认JDK版本
sdk default java 14.0.1.j9-adpt


卸载
sdk uninstall java 14.0.1.j9-adpt


升级jdk版本
sdk upgrade java


sdk current java
java -version



---------------------------------------------------------------------------------------------------------------------
管理Gradle版本

sdk list gradle

sdk install gradle
# 后面跟上版本号即可
$ sdk install gradle 4.4.1

安装本地包
$ sdk install groovy 3.0.0-SNAPSHOT /path/to/groovy-3.0.0-SNAPSHOT

5.5 卸载包
$ sdk uninstall scala 2.11.6

选择版本
选择一个版本用于当前终端:
$ sdk use scala 2.12.1

5.7 设置默认版本
$ sdk default scala 2.11.6

查看当前使用的版本

$ sdk current java
  Using java version 8u111

#查看所有本地包的当前版本
$ sdk current
  Using:
  groovy: 2.4.7
  java: 8u111
  scala: 2.12.1

sdk版本升级
$ sdk upgrade springboot
  Upgrade:
  springboot (1.2.4.RELEASE, 1.2.3.RELEASE < 1.2.5.RELEASE)

# 本地所有sdk全部升级
$ sdk upgrade

作者：Cursor_fei
链接：https://www.jianshu.com/p/8597c22550a6
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。




---------------------------------------------------------------------------------------------------------------------







