


软件下载网站：
[Xclient](https://xclient.info/)  
[麦氪搜(iMacso.com)](https://www.imacso.com/)  
[MacWk](https://www.macwk.com/)  
[]()  






MAC OS 如何安装命令行工具:Command Line Tools
打开终端输入：xcode-select --install 回车
安装好了测试结果：gcc -v
切换root：sudo -i



mac install telnet :
brew tap theeternalsw0rd/telnet
brew install telnet


安装 Homebrew：
命令粘贴至终端
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
Run `brew help` to get started
brew -v
brew更新到最新版本，执行：brew update


install：brew install git
update：brew upgrade git
查看：which git
安装git不生效，使用brew link git
安装git-lfs：brew install git-lfs



安装Erlang，执行：brew install erlang
安装RabbitMQ Server，执行：brew install rabbitmq


安装golang：brew install go


brew install gradle



MacOS快捷键
https://support.apple.com/zh-cn/HT201236
https://support.apple.com/zh-cn/guide/mac-help/mchlp2469/mac

MacOS触摸板使用
https://support.apple.com/zh-cn/HT204895


一个手指：鼠标左键，二个手指：鼠标右键
两根手指：用双指轻点两下可放大或缩小网页或 PDF，放大页面，上下滚动，在网页上回退或前进页面
三根手指：全屏左右滑动，展示全部打开应用
四根手指：到桌面，到启动台


mac软件参考  
[awesome-mac](https://github.com/jaywcjlove/awesome-mac/blob/master/README-zh.md)  
[Awesome Mac](https://wangchujiang.com/awesome-mac/index.zh.html)  




mac 系统怎么访问局域网内的共享文件夹
解决方法
1、点击 Finder 前往菜单中的「前往服务器」（或快捷键 command+k）
2、在连接服务器对话框中输入「smb://Windows主机的IP地址」，其中 smb 是访问 Windows 共享文件夹所使用的协议名称，SMB：服务器信息块协议（Server Message Block protocol）。
3、连接Windows主机后会显示该主机的所有共享文件夹，选择想要访问的一个即可






macOS环境 查看端口、进程号、进程名


记录一些mac下的常用命令：

1、查看进程号

ps -ef | grep 进程名

ps -ef | grep java | grep zookeeper



2、查看端口被哪个进程监听

sudo lsof -i :端口

lsof -i tcp:8080

该命令会显示占用8080端口的进程，有其 pid



3、查看进程监听的端口

sudo lsof -nP -p 进程号 | grep LISTEN

sudo lsof -nP | grep LISTEN | grep 进程号

lsof -nP -p 5450 | grep LISTEN
lsof -nP | grep LISTEN | grep 39269



知道进程号，查看进程详细信息

ps | grep 39269



4、查看监听端口的进程

sudo lsof -nP | grep LISTEN | grep 端口号

lsof -nP | grep LISTEN | grep 8080



5、看到一个新的方法（MacOS统计TCP/UDP端口号与对应服务）

echo "### TCP LISTEN ###"
lsof -nP -iTCP -sTCP:LISTEN



https://blog.csdn.net/glw0223/article/details/86737591



