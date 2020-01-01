go语言
https://golang.org/project/
源码https://golang.org/dl/

mac 下安装go环境

执行brew install go 未安装brew则先安装brew 见文章末
配置环境变量 1. 设置goroot 2. 设置gopath
goroot和go path都设置到启动linux其中项中
执行 sudo vi /etc/profile 加入
#go config
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=/Users/xxx/go
执行wq! 强制保存

ps: 安装 brew

#在终端输入命令
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#安装后更新下
brew update

