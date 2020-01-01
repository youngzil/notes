方法1:
在终端中直接运行命令
export http_proxy=http://proxyAddress:port
这个办法的好处是简单直接，并且影响面很小（只对当前终端有效，退出就不行了）。

如果你用的是ss代理，在当前终端运行以下命令，那么wget curl 这类网络命令都会经过ss代理
export ALL_PROXY=socks5://127.0.0.1:1080



方法2:
把代理服务器地址写入shell配置文件.bashrc或者.zshrc

直接在.bashrc或者.zshrc添加下面内容
export http_proxy="http://localhost:port"
export https_proxy="http://localhost:port"

以使用shadowsocks代理为例，ss的代理端口为1080,那么应该设置为
export http_proxy="socks5://127.0.0.1:1080"
export https_proxy="socks5://127.0.0.1:1080"

或者直接设置ALL_PROXY
export ALL_PROXY=socks5://127.0.0.1:1080

localhost就是一个域名，域名默认指向 127.0.0.1，两者是一样的。
然后ESC后:wq保存文件，接着在终端中执行
source ~/.bashrc

或者退出当前终端再起一个终端。 这个办法的好处是把代理服务器永久保存了，下次就可以直接用了。
或者通过设置alias简写来简化操作，每次要用的时候输入setproxy，不用了就unsetproxy。
alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"
alias ip="curl -i http://ip.cn"




方法3:
改相应工具的配置，比如apt的配置

sudo vim /etc/apt/apt.conf
在文件末尾加入下面这行

Acquire::http::Proxy "http://proxyAddress:port"
保存apt.conf文件即可。
关于apt的代理设置可以参考这里

关于git的代理设置看这里:用shadowsocks加速git clone




方法4(推荐):
利用proxychains在终端使用socks5代理

补充：
如果代理服务器需要登陆，这时可以直接把用户名和密码写进去
http_proxy=http://userName:password@proxyAddress:port






https://blog.fazero.me/2015/09/15/%E8%AE%A9%E7%BB%88%E7%AB%AF%E8%B5%B0%E4%BB%A3%E7%90%86%E7%9A%84%E5%87%A0%E7%A7%8D%E6%96%B9%E6%B3%95/





