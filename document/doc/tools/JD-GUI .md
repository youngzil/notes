官网
http://jd.benow.ca/

Java Decompiler projects home page: http://jd.benow.ca
Java Decompiler Wikipedia page: http://en.wikipedia.org/wiki/Java_Decompiler
JD-GUI source code: https://github.com/java-decompiler/jd-gui




Install JD-GUI on Mac OSX
一、打开终端
二、安装brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null

三、使用brew安装 
brew cask install jd-gui



如果jd-gui启动不了，java1.9不能使用jd-gui，需要使用1.8
在/Applications/JD-GUI.app/Contents/MacOS
打开jd-gui的启动脚本文件(vim,sublime等只要是文本编辑器都可以）：
universalJavaApplicationStub.sh
在257行左右JAVACMD最后赋值语句最后加入语句：
JAVACMD="/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home/bin/java"

参考
https://blog.csdn.net/YoungStunner/article/details/78699864



Java反编译工具使用对比
https://blog.csdn.net/chenchunlin526/article/details/78259682




