- [V2Ray介绍](#V2Ray介绍)
- [基于V2Ray的衍生版本Xray](#基于V2Ray的衍生版本Xray)
- [基于V2Ray的工具](#基于V2Ray的工具)
    - [V2RayX](#V2RayX)
    - [V2rayU](#V2rayU)
    - [Qv2ray](#Qv2ray)
- [Just My Socks详细讲解](#Just-My-Socks详细讲解)
- [V2Ray Server搭建](#V2Ray-Server搭建)



---------------------------------------------------------------------------------------------------------------------
## V2Ray介绍  

Project V 是一个工具集合，它可以帮助你打造专属的基础通信网络。Project V 的核心工具称为V2Ray，其主要负责网络协议和功能的实现，与其它 Project V 通信。V2Ray 可以单独运行，也可以和其它工具配合，以提供简便的操作流程。

2019年2月，V2Ray项目创始人Victoria Raymond突然消失，其Twitter、Telegram以及知乎。

随后开源社区进行重组成立 V2Fly 社区，并于2019年6月2日表示：“由于原开发者长期不上线，其他维护者没有完整权限。为了方便维护，我们创建了新的organization：https://github.com/v2fly 原organization中的仓库：v2ray/v2ray-core将会一直同步更新。”


[V2Ray官网Project V ](https://v2ray.com/)  
[V2Ray下载安装](https://www.v2ray.com/chapter_00/install.html)  


[V2fly社区官网](https://www.v2fly.org/)  
[V2fly新手指南](https://www.v2fly.org/guide/start.html)  



[V2Fly地址，V2Ray原作者离开后社区维护版（新）](https://github.com/v2fly/v2ray-core)  
[V2Ray官网原版（老）](https://github.com/v2ray/v2ray-core)


[V2Ray安装包](https://github.com/v2ray/dist/)

[Homebrew安装V2Ray](https://github.com/v2ray/homebrew-v2ray)

[V2Ray下载安装指南](https://github.com/v2fly/fhs-install-v2ray/blob/master/README.zh-Hans-CN.md)


[科学上网V2Ray](https://www.triadprogram.com/%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91v2ray-2021%E5%B9%B43%E6%9C%88%E8%AF%A6%E7%BB%86%E6%8C%87%E5%8D%97/)  
[V2Ray教程](https://tlanyan.pp.ua/v2ray-tutorial/)




## 基于V2Ray的衍生版本Xray

[Project X 社区](https://xtls.github.io)
[Project X Github](https://github.com/XTLS/Xray-core)  

一个Debian包维护者发现XTLS库的LICENSE不是BSD许可，提了一个issue希望作者 @rprx 能修改方便打包，详见 https://github.com/XTLS/Go/issues/9。由这个issue引发了广泛讨论，rprx认为目前许可不是问题，也有不少人认为协议是立场的体现，各执一词。

最终V2ray(V2fly社区)维护者经过投票确认XTLS不符合V2ray的MIT协议，并在V2ray-core 4.33.0版本移除了XTLS。rprx和其拥护者行动起来，很快就创建了Project X项目和Xray子项目（Xray取名来自XTLS和V2ray的结合），并发布了Xray-core的多个版本。这便是Xray的大致由来。


2020年11月，因为开源许可证等原因[12]XTLS被V2Ray社区从V2ray core移除，VLESS及XTLS的作者和支持者基于V2Ray另行组建了Project X 组织，开发了基于V2Ray的衍生版本Xray[13]。该软件完全兼容V2Ray的配置文件和传输协议，由于Project X社区非常活跃，大部分新版图形化客户端已支持Xray。

Project X originates from XTLS protocol, provides a set of network tools such as Xray-core and Xray-flutter.
Project X源于XTLS协议，提供了Xray-core、Xray-flutter等一套网络工具。

Xray-core 是 v2ray-core 的超集，含更好的整体性能和 XTLS 等一系列增强，且完全兼容 v2ray-core 的功能及配置。

Xray-flutter 是一个优雅的跨平台图形界面工具


[Xray教程](https://tlanyan.pp.ua/xray-tutorial/#bnp_i_2)




## Xray和V2ray的区别

在说明Xray和V2ray区别之前，先说一下三个相近但不同的概念：

1. V2ray：Project V 是用于构建基础通信网络的工具合集，其核心工具称为V2Ray。V2ray主要负责网络协议和功能的实现，既可以单独运行，也可以和其它工具配合。V2ray官网是：https://v2ray.com/，Github项目主页是：https://github.com/v2ray，TG讨论组是：@projectv2ray；

2. V2fly：出现一些科学上网作者被喝茶事件后，V2ray原开发者长期不上线，其他维护者没有完整权限，导致V2ray项目维护困难。因此社区在2019年组建了V2fly组织，继续维护V2ray，也是目前V2ray发展的主力。V2fly官网是：https://www.v2fly.org，Github项目主页是：https://github.com/v2fly，TG通知频道：@v2fly，TG交流群为：@v2fly_chat；

3. Xray：因许可理念之争，VLESS和XTLS的作者单独创建了Xray项目，目前是V2ray的超集，后续可能有不同的发展路线。Xray文档官网（测试中）：https://xtls.github.io/， Github项目主页：https://github.com/XTLS，TG交流群：@projectXray。


从上面可以看到，先有V2ray(Project V)，然后是V2fly，最后才出来Xray(Project X)。其中V2fly是V2ray的社区，可以认为两者是同一个组织。




## 基于V2Ray的工具  

其实目前在苹果电脑的MAC系统下面，V2RAY的客户端最常用就也就两种。一个是V2RayX，另一个是V2RayU。


[V2Ray维基百科](https://zh.wikipedia.org/wiki/V2Ray)


[基于V2Ray的工具地址](https://www.v2ray.com/awesome/tools.html)
[神一样的V2Ray工具们](https://www.v2fly.org/awesome/tools.html#%E5%9C%A8%E7%BA%BF%E5%B7%A5%E5%85%B7)  
[V2Ray客户端参考](https://tlanyan.pp.ua/v2ray-clients-download/)  
[V2Ray客户端](https://v2xtls.org/v2ray%E5%AE%A2%E6%88%B7%E7%AB%AF/)  


[V2Ray Mac 客户端下载，用于科学上网。V2RayX、V2RayU下载安装及使用教程](https://www.v2rayssr.com/macv2ray.html)  




## V2RayX

[基于V2Ray的工具地址](https://www.v2ray.com/awesome/tools.html)

V2RayW 是一个基于 V2Ray 内核的 Windows 客户端。用户可以通过界面生成配置文件，并且可以手动更新 V2Ray 内核。

V2RayX 是一个基于 V2Ray 内核的 Mac OS X 客户端。用户可以通过界面生成配置文件，并且可以手动更新 V2Ray 内核。V2RayX 还可以配置系统代理。

[Windows客户端V2RayW](https://github.com/Cenmrev/V2RayW)  
[Mac OS X 客户端V2RayX](https://github.com/Cenmrev/V2RayX)  
[Android上的V2rayNG](https://github.com/2dust/v2rayNG)  

[V2RayX客户端下载](https://github.com/Cenmrev/V2RayX/releases)  




## V2rayU

[V2rayU Github](https://github.com/yanue/V2rayU)  
[V2rayU下载地址](https://github.com/yanue/V2rayU/releases)

V2rayU,基于v2ray核心的mac版客户端,用于科学上网,使用swift编写,支持vmess,shadowsocks,socks5等服务协议,支持订阅, 支持二维码,剪贴板导入,手动配置,二维码分享等

V2RayX 是一个基于 V2Ray 内核的 Mac OS X 客户端。

用户可以通过界面生成配置文件，并且可以手动更新 V2Ray 内核。

V2RayX 还可以配置系统代理。





## Qv2ray

[Qv2ray Github](https://github.com/Qv2ray/Qv2ray)






## Just My Socks详细讲解

[Just My Socks 详细图文购买教程](https://justmysocks.xyz/justmysocks-v2ray/) ，搬瓦工官方出品的代理服务


Just My Socks配置讲解   
[Android [shadowsocks]](https://justmysocks3.net/members/index.php?rp=/knowledgebase/7/How-to-use-Just-My-Socks-on-Android-shadowsocks.html)  
[Android [v2ray]](https://justmysocks3.net/members/index.php?rp=/knowledgebase/11/How-to-use-Just-My-Socks-on-Android-v2ray.html)  
[Mac [shadowsocks]](https://justmysocks3.net/members/index.php?rp=/knowledgebase/8/How-to-use-Just-My-Socks-on-a-Mac-shadowsocks.html)  
[Mac [v2ray]](https://justmysocks3.net/members/index.php?rp=/knowledgebase/10/How-to-use-Just-My-Socks-on-a-Mac-v2ray.html)




## V2Ray Server搭建


一键安装命令（然后就都是中文，你随便设置，复制最后反馈给你的ssr信息）
bash <(curl -s -L https://git.io/v2ray.sh)



[V2Ray下载安装指南](https://github.com/v2fly/fhs-install-v2ray/blob/master/README.zh-Hans-CN.md)


[一键安装V2Ray](https://chinacm.medium.com/%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85v2ray-2b5ae495b6c9)


[V2Ray新脚本安装服务器](http://loonlog.com/2020/10/5/v2ray-server-new/)  
[V2Ray一键安装脚本](https://github.com/233boy/v2ray/wiki/V2Ray%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E8%84%9A%E6%9C%AC)  
[如何搭建一个 V2Ray Server](https://blog.huangyz.name/tech/2017/10/17/how-to-build-a-v1ray-vps.html)   
[小白也可以搭建的V2Ray服务器安装教程](http://loonlog.com/2019/7/2/v2ray-vpn-fanqiang/)  
[面向新手的V2Ray搭建指南](https://yearliny.com/v2ray-build-guide-for-novices/)



---------------------------------------------------------------------------------------------------------------------
