- [Shadowsocks介绍](#Shadowsocks介绍)
- [VPS搭建Shadowsocks（ss）教程](#VPS搭建Shadowsocks)

---------------------------------------------------------------------------------------------------------------------
## Shadowsocks介绍  

[Shadowsocks官网](https://shadowsocks.org/en/index.html)  
[Shadowsocks原版 Github](https://github.com/shadowsocks)  
[Shadowsocks分支ShadowsocksRR（SSRR）](https://github.com/shadowsocksrr)

[Yet another SIP003 plugin for shadowsocks, based on v2ray](https://github.com/shadowsocks/v2ray-plugin)  


客户端下载链接（GitHub）：  
[Mac客户端](https://github.com/shadowsocks/ShadowsocksX-NG)  
[Win客户端](https://github.com/shadowsocks/shadowsocks-windows)  
[Android客户端](https://github.com/shadowsocks/shadowsocks-android)  




Shadowsocks（简称SS）是一种基于Socks5代理方式的加密传输协议，也可以指实现这个协议的各种开发包。目前包使用Python、C、C++、C#、Go语言、Rust等编程语言开发，大部分主要实现（iOS平台的除外）采用Apache许可证、GPL、MIT许可证等多种自由软件许可协议开放源代码。

Shadowsocks分为服务器端和客户端，在使用之前，需要先将服务器端程序部署到服务器上面，然后通过客户端连接并创建本地代理。

在中国大陆，本工具广泛用于突破防火长城（GFW），以浏览被封锁、遮蔽或干扰的内容。2015年8月22日，Shadowsocks原作者Clowwindy称受到了网络审查的压力，宣布停止维护此计划（项目）并移除其个人页面所存储的源代码[4][5]。

为了避免关键词过滤，网民会根据谐音将ShadowsocksR称为“酸酸乳”[注 1]（SSR），将Shadowsocks称为“酸酸”（SS）。另外，因为Shadowsocks(R)的标志均为纸飞机，所以专门提供Shadowsocks(R)或类似服务（如V2Ray）的网站则就被称为了“机场”。




特点
- Shadowsocks使用自行设计的协议进行加密通信。[6]加密算法有AES、Blowfish、ChaCha20、RC4等，除创建TCP连接外无需握手，每次请求只转发一个连接，无需保持“一直连线”的状态，因此在移动设备上相对较为省电。
- 所有的流量都经过算法加密，允许自行选择算法。
- Shadowsocks通过异步I/O和事件驱动程序运行，响应速度快。
- 客户端覆盖多个主流操作系统和平台，包括Windows、macOS、Android、Linux和iOS系统和路由器（OpenWrt）等[7]。





### ShadowsocksR

ShadowsocksR（简称SSR）是网名为breakwa11的用户发起的Shadowsocks分支，在Shadowsocks的基础上增加了一些资料混淆方式，称修复了部分安全问题并可以提高QoS优先级。[25]后来贡献者Librehat也为Shadowsocks补上了一些此类特性，[26]甚至增加了类似Tor的可插拔传输层功能。[27]

ShadowsocksR开始时曾有过违反GPL、发放二进制时不发放源码的争议，使得原开发作者不满[28]。不过后来ShadowsocksR项目由breakwa11转为了与Shadowsocks相同的GPL、Apache许可证、MIT许可证等多重自由软件许可协议。

2017年7月19日，ShadowsocksR作者breakwa11在Telegram频道ShadowsocksR news里转发了深圳市启用SS协议检测的消息并被大量用户转发，引发恐慌[29]。

7月24日，breakwa11发布了闭源的SS被动检测程序，引发争议[30]。7月27日，breakwa11遭到自称“ESU.TV”（恶俗TV）的不明身份人士人身攻击，对方宣称如果不停止开发并阻止用户讨论此事件将发布更多包含个人隐私的资料[31]，随后breakwa11表示遭到对方人肉搜索并公开个人资料的是无关人士，为了防止对方继续伤害无关人士，breakwa11将删除GitHub上的所有代码、解散相关交流群组，停止ShadowsocksR项目。但项目已被多人fork，并有人在其基础上继续发布新的版本，例如较为知名的SSRR（页面存档备份，存于互联网档案馆）（ShadowsocksRR）。



参考  
[Shadowsocks介绍](https://zh.wikipedia.org/wiki/Shadowsocks)  


---------------------------------------------------------------------------------------------------------------------
## VPS搭建Shadowsocks


VPS搭建Shadowsocks（ss）教程


科学上网：Vultr VPS 搭建 Shadowsocks（ss）教程（新手向）

搭建shadowsocks连接上之后，就可以开始搭建了。

1.安装锐速 / 谷歌 BBR 加速优化

1.2、谷歌 BBR

推荐装这个，执行下面命令安装谷歌BBR：

wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh
显示 “Press any key to start…” 按回车确认。回车后会出现一列内核版本让我们选择，输入序号 61 并回车开始安装。

然后开始选择内核版本
安装完后，按提示重启 VPS，输入 Y 回车重启。稍候 1min 等待重启完成，再重新连接 Xshell。

重启后输入 lsmod | grep bbr ，出现 tcp_bbr 即说明 BBR 已经启动。




2.安装SS
依次运行下面三行命令，如下图所示按要求输入相应信息。（建议：端口选择大于 1000 的。）

下载脚本：
wget — no-check-certificate -O shadowsocks.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks.sh

更改权限：
chmod +x shadowsocks.sh

运行脚本，开始安装：
./shadowsocks.sh 2>&1 | tee shadowsocks.log


安装完成，把标红的连接信息记录下来，就可以关闭 xshell 了。（出现这几行就说明安装成功）
服务端搭建完成！(*^▽^*)




3.多用户配置
强烈不建议小白操作此步！自己用的话不需要配置这一步，因为不熟悉操作的话，很容易在这一步出问题，大概率失败！

如果想和一两个亲友一起用的话，可以继续本步。先说注意事项：
输入法切英文
核对正确在保存不要漏
配置好后重启shadowsocks才会生效


首先，我们把配置信息准备好（# 开头的是注释，不要复制进去），把下面的代码复制到记事本中，按要求把 "port_password"{……} 中的端口和密码改为自己需要的。

```
# 1.先设置好端口和对应的密码
# 2.添加或删除的用户都在 "port_password"{……} 中
# 3.用户信息格式，注意末尾的英文逗号："端口"："密码",  如 "8006": "123456",
# 4."method" 为加密方式，可修改，默认也可以，客户端的加密方式也是这个
```

{
    "server":"0.0.0.0",
    "local_address":"127.0.0.1",
    "local_port":1080,
    "port_password":{
         "8989":"password0",
         "9001":"password1",
         "9002":"password2",
         "9003":"password3",
         "9004":"password4"
    },
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}

然后，在 /etc 下新建 shadowsocks.json 配置文件：

# 创建配置文件
vi /etc/shadowsocks.json

出现一列波浪线即进入 vim。
注意，敲黑板了！！！下面的操作很重要：
按 a ，然后把刚才准备好的 “配置信息” 粘贴进去，检查无误；
再按 Esc，输入 :wq 保存退出。
比如下面这个配置，设置了 3 个用户，分别使用 8000,8001,8002 端口，后面是对应的密码。


重启 shadowsocks 生效：
/etc/init.d/shadowsocks restart
多用户配置完成！




4.其他命令

卸载：
./shadowsocks.sh uninstall

控制：
/etc/init.d/shadowsocks start      # 启动
/etc/init.d/shadowsocks stop       # 停止
/etc/init.d/shadowsocks restart    # 重启
/etc/init.d/shadowsocks status     # 状态




四、使用
下面只要下载客户端连接就行了。包含 win、mac 和 安卓客户端。（IOS 需要在商店中安装）

客户端下载链接（GitHub）：  
[Mac客户端](https://github.com/shadowsocks/ShadowsocksX-NG)  
[Win客户端](https://github.com/shadowsocks/shadowsocks-windows)  
[Android客户端](https://github.com/shadowsocks/shadowsocks-android)  





参考[Vultr VPS 搭建 Shadowsocks（ss）教程（新手向）](https://medium.com/@jackme256/%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91-vultr-vps-%E6%90%AD%E5%BB%BA-shadowsocks-ss-%E6%95%99%E7%A8%8B-%E6%96%B0%E6%89%8B%E5%90%91-968613081aae)  

---------------------------------------------------------------------------------------------------------------------
