///
QQ、微信、企业微信
QQ音乐、迅雷、网易邮箱大师、有道云笔记、有道词典、搜狗输入法
TeamViewer
V2RayX
XMind
Office（WPS）
IDEA（GoLand、PyCharm、WebStorm、CLion）
OmniGraffle）
The Unarchiver
EasyConnect

docker

Chrome
VSCODE(Visual Studio Code)

Termius（CRT、iTerm2）


在终端使用:
//显示隐藏文件
defaults write com.apple.finder AppleShowAllFiles -bool true
//不显示隐藏文件
defaults write com.apple.finder AppleShowAllFiles -bool false


IDEA
Maven
JDK



安装Xcode

xcode-select --install

如果报错：不能安装该软件,因为当前无法从软件更新服务器获得。

只需要去这个地址 https://developer.apple.com/download/more/ 在左边的搜索框中搜索Command Line Tools 然后回车
将其中适合你电脑版本的那个下载下来安装好即可。


安装之后再次执行xcode-select --install
xcode-select: error: command line tools are already installed, use "Software Update" to install updates

更新软件
Update them from Software Update in System Preferences or run:
  softwareupdate --all --install --force

If that doesn't show you an update run:
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install



安装brew

官方命令安装报错：
curl: (7) Failed to connect to raw.githubusercontent.com port 443: Connection refused
/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/universal-darwin19/rbconfig.rb:229: warning: Insecure world writable dir /usr/local/bin in PATH, mode 040777

就直接设置代理，或者使用其他的源安装

安装之后
brew -v


安装 brew cask
brew tap homebrew/cask
brew install brew-cask-completion


安装switchhosts
brew install switchhosts --cask 
或者
brew cask install switchhosts


安装Git
brew install git

