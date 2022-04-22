# VPN的使用


- [Shadowsocks影梭](Shadowsocks影梭.md)  
- [V2Ray](V2Ray.md)  
- [常见名词](#常见名词)
- [VPS和VPN](#VPS和VPN)  
  - [常用的VPS](#常用的VPS)
  - [翻墙VPN/机场/梯子](#翻墙VPN/机场/梯子)  
- [代理服务器](#代理服务器)  
- [域名污染—DNS域名解释](#域名污染—DNS域名解释)  
- [什么是VPN](#什么是VPN)  
- [隧道协议TP和点对点隧道协议PPTP](#隧道协议TP和点对点隧道协议PPTP)  
- [什么是Shadowsocks（ss｜影子代理｜机场｜酸酸乳）](#什么是Shadowsocks（ss｜影子代理｜机场｜酸酸乳）)  
- [科学上网V2Ray](#科学上网V2Ray)  
- [VPN协议](#VPN协议)  
  - [OpenVPN](#OpenVPN)  
  - [IPsec](#IPsec)  
  - [IKEv2/IPSec](#IKEv2/IPSec)  
  - [WireGuard](#WireGuard)
  - [PPTP](#PPTP)  
  - [L2TP/IPSec](#L2TP/IPSec)  
  - [SSTP](#SSTP)  
  - [SoftEther](#SoftEther)  
  - [Lightway](#Lightway)  
  - [Nordlynx](#Nordlynx)  


---------------------------------------------------------------------------------------------------------------------
## 常见名词

Shadowsocks（ss｜影子代理｜机场｜酸酸乳）

先有V2ray(Project V)，然后是V2fly，最后才出来Xray(Project X)

翻墙VPN/机场/梯子

科学上网（翻墙）
简单地说，V2Ray 是一个与 Shadowsocks 类似的代理软件，可以用来科学上网（翻墙）学习国外先进科学技术。


[翻墙软件VPN推荐，中国仅2款好用(2021年10月最新)](https://github.com/vpncn/vpncn.github.io)


## VPS和VPN

VPS (Virtual Private Server)：虚拟专用服务器
VPN (Virtual Private Network)：虚拟专用网络


使用VPS创建您自己的VPN
可以租用VPS，并在其上安装VPN软件以获取您自己的VPN。



[What is the Difference Between a VPS and VPN?](https://www.liquidweb.com/blog/vps-vs-vpn/)





### 常用的VPS

[搬瓦工VPS云主机](https://bandwagonhost.com/)  
[Linode VPS云主机](https://www.linode.com/)  




### 翻墙VPN/机场/梯子

[Just My Socks（搬瓦工机场）](https://justmysocks3.net/members/cart.php)  
[ExpressVPN](https://www.expressvpn.com/order)  
[NordVPN官网](https://nordvpn.com/zh/)  
[光年VPN](https://lightyearapp.live/zh/pricing)  
[PandaVPN（熊猫VPN）](https://www.pankvyh.xyz/)  
[Surfshark VPN](https://order.surfshark.com/)  
[快帆VPN](https://www.kuaifan.co/act/payment.html)  
[PureVPN](https://www.purevpn.com/)  


ExpressVPN默认采用军事级别的AES-256位加密方式，这是目前全球范围内最强的加密方式，美国政府和全球大部分银行都采用的是这种加密技术。此外，ExpressVPN支持多种VPN协议，包括OpenVPN、IKEv2、L2TP/IPaec、WireGuard、PPTP、SSTP、Lightway。其中OpenVPN是最强大的VPN协议，而IKEv2主要为移动端设备提供加密服务，这两种VPN协议都是目前使用最广泛，也是最标准、最安全VPN协议。

实际测试，自己提供的客户端不够智能，无法选择性代理网站（没有类似V2Ray的PAC模式），网速也一点都不快，查资料还可以，看视频，youtube就不行了【我只试用了一两天，主要是只能全局代理，让我在公司访问公司内网，或者在家里使用，爱奇艺、淘宝、JD等因为全局代理，定位错误，都被导到国际站，让我苦不堪言，就只能退费了】




---------------------------------------------------------------------------------------------------------------------

### 代理服务器

计算机通信时，除客户端和服务器以外，还有一些用于通信数据转发的应用，例如代理，它扮演了位于服务器和客户端 “中间人”的角色，接收由客户端发送的请求并转发给服务器，同时也接收服务器返回的响应并转发给客户端。

代理服务器中有一类叫缓存服务器，当代理转发从服务器返回的响应时，代理服务器将会保存一份资源的副本。利用缓存可减少对源服务器的访问，因此也就节省了通信流量和通信时间。

了解代理服务器的原理，对理解下面要讲的翻墙、科学上网非常有帮助。因为目前所有的翻墙工具，都是基于代理服务的原理建立的，都可以称为“代理软件”。而我们日常的上网活动，其实都要通过代理服务器中转，包括帮我们装宽带的服务商(ISP)就是个代理。



### 域名污染—DNS域名解释

DNS 协议提供通过域 名查找 IP 地址，或逆向从 IP 地址反查域名的服务。


早期GFW(中国国家防火墙) 就是干扰一下 DNS解释，行话叫–域名污染。效果就是：你访问某些网站的时候，获取到的 IP 地址是错误的，这样自然你就去不到了。

对付域名污染是很简单的：因为操作系统–比如windows，在系统目录中有个host 文件，里面保存了域名和 IP地址的对应表。当浏览器去解析一个域名时，会先从本地的 host 文件中读取。当存在的时候，就直接访问网站的IP地址，不需要 DNS 请求。这样就避免了 DNS 污染。

这招有个条件：首先你要知道，要访问的网站的真实IP地址。

后来，GFW 开始在国际出口的路由器上，定向干扰某些服务器的数据。这些路由器都是大名鼎鼎的思科出品的。思科被曝出参与美国的棱镜计划，爱德华·斯诺登曾经揭露过，美国国家安全局通过思科路由器监控中国的网络和电脑。这就是为什么我们要使用华为的网络设备。

不过，现在修改host文件这招早已经没用了。所以，大概了解一下就好，我们继续看。




### 什么是VPN

虚拟私人网络（英语：virtual private network，缩写：VPN）是上个20世纪90年代，互联网开始流行时出现的技术。当时的数据传输是不加密的广播传播，通信数据都是不加密的。后来，为了保障数据安全，大型跨国企业尤其是银行业，为此要铺设昂贵的数据专线。而vpn技术就是在这种情况下出现的：用于连接大型企业间私人网络的通讯方法，它利用隧道协议（Tunneling Protocol）来达到发送端认证、消息保密与准确性等功能。

而VPN技术变成了翻墙的工具，是无奈之下的选择。因为翻墙需要使用代理服务器，而VPN技术是为了安全的登陆公司的服务器，如果这个服务器又具备代理功能，那么它成为翻墙工具也就顺理成章了。

VPN 有这么几个方案或者叫协议：PPTP、L2TP 、OpenVPN、IPsec、WireGuard，还有 Cisco AnyConnect，以及它们的一些变种。 我们看看这几种方案的特点：
1. PPTP 最简单轻快，服务端部署简单，但是由于加密比较薄弱，在逐渐升级的 GFW 面前，经常不堪一击。
2. OpenVPN 是加密强度最高的，因为他不是通过用户名密码验证的，而是需要服务端生成客户端证书来认证的。但是 OpenVPN 的服务端部署还是比较复杂的。L2TP 就介于两者之间。
3. Cisco AnyConnect 可以参考我的文章详细介绍，他是思科公司的解决方案，使用非常方便，而且还是苹果设备默认支持的几种方式之一，所以随着苹果设备的大卖，用的也多了起来。

VPN 还有个设计上的问题，它是全局的解决方案，虽然有些VPN代理软件可以在客户端做到部分代理，但是翻墙之后，连国内的网站还是会变慢一些。这和VPN的设计原理有关：VPN目的是为了保护数据、隐私，翻墙只是副业。





### 隧道协议TP和点对点隧道协议PPTP

隧道协议（英语：Tunneling Protocol）[1]是一种网络协议，在其中，使用一种网络协议（发送协议），将另一个不同的网络协议，封装在负载部分。使用隧道的原因是在不兼容的网络上传输数据，或在不安全网络上提供一个安全路径。

隧道则是对比分层式的模型，如OSI模型或TCP/IP。隧道协议通常（但并非总是）在一个比负载协议还高的层级，或同一层。要了解协议堆栈，负载和发送协议都须了解。传统的分层式协议，如OSI模型或TCP/IP模型，HTTP协议 ，并不被认为是隧道协议。隧道是在相隔甚远的客户端和服务器两者之间进行中转，并保持双方通信连接的应用程序。


点对点隧道协议（英语：Point to Point Tunneling Protocol，缩写为PPTP）是实现虚拟专用网（VPN）的方式之一。PPTP使用传输控制协议（TCP）创建控制通道来发送控制命令，以及利用通用路由封装（GRE）通道来封装点对点协议（PPP）数据包以发送资料。这个协议最早由微软等厂商主导开发，但因为它的加密方式容易被破解，微软已经不再建议使用这个协议。

[隧道协议](https://zh.wikipedia.org/wiki/%E9%9A%A7%E9%81%93%E5%8D%8F%E8%AE%AE)  
[点对点隧道协议PPTP](https://zh.wikipedia.org/wiki/%E9%BB%9E%E5%B0%8D%E9%BB%9E%E9%9A%A7%E9%81%93%E5%8D%94%E8%AD%B0)  
[]()  





### 什么是Shadowsocks（ss｜影子代理｜机场｜酸酸乳）

Shadowsocks是2012、2013年左右出现，ShadowsocksR是它的一个分支。由于它的logo是架纸飞机，所以又叫它“机场”。这货的出现，才真正称得上科学上网，因为它就是为翻墙而生的。

Shadowsocks 的基本工作原理是利用一个可以访问境外的服务器做的中转。但是现在，通常 Shadowsocks 的服务端都是部署在国外的 VPS 上。Shadowsocks 包括：客户端、服务器端，客户端从 Windows、Linux、Mac OS X，到手机端的 Android、iOS，甚至有路由器的版本。

上图是对shadowsocks技术的简单诠释，技术原理很简单：就是通过代理服务器访问，不过shadowsocks在防火墙内外都有个服务器，所以才形象的称它：影子代理。
Android 平台大多用 Shadowsocks 了。由于 Android 平台的开放性，装个 Shadowsocks 客户端，各种分 IP 代理、分应用代理，简直不能更爽。
苹果手机iOS 就比较特殊了，由于苹果的政策比较严格，为iOS开发软件，还要得到苹果开发人员认证，每年还要向苹果公司缴纳保护费。所以，大多iOS翻墙软件要收费。在 iOS 平台，翻墙还是用 VPN 和 Cisco AnyConnect。

这段时间还有一些类似的技术，比如：trojan、ssr都是shadowsocks技术的改进版，最稳定还是v2ray。






## 科学上网V2Ray

V2Ray 是 Project V 下的一个工具。Project V 是一个包含一系列构建特定网络环境工具的项目，而 V2Ray 属于最核心的一个。 简单地说，V2Ray 是一个与 Shadowsocks 类似的代理软件，可以用来科学上网（翻墙）学习国外先进科学技术。 V2Ray 的简单示意图如下：

首先，V2Ray 本身只是一个内核，V2Ray 上的图形客户端大多是调用 V2Ray 内核套一个图形界面。对于我们终端用户，需要各种图形界面的客户端比如：Qv2ray、V2RayN，然后加V2Ray 内核添加进去。有些客户端是将V2Ray 内核捆绑在一起的，这样将方便使用了。

其次，V2Ray 使用了新的自行研发的 VMess 协议，改正了 Shadowsocks 一些已有的缺点，更难被墙检测到。在 V2Ray 上客户端与服务器的通信主要是通过 VMess 协议通信。

v2ray包括：内核和图形客户端。内核就是翻墙的核心，图形客户端是为了我们用户方便使用。

v2ray内核是一个开源软件，安全性是非常有保证的，因为它公开源码，大神们都是火眼金睛，有什么后门一早就被发现了。v2ray的内核大小一般20–40M。下面是内核的截图。内核是使用go语言编写的，加上用户界面，总容量不会超过100M。超过100M的，里面一定加料。




[科学上网V2Ray](https://www.triadprogram.com/%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91v2ray-2021%E5%B9%B43%E6%9C%88%E8%AF%A6%E7%BB%86%E6%8C%87%E5%8D%97/)



---------------------------------------------------------------------------------------------------------------------

## VPN协议

其中OpenVPN是最强大的VPN协议，而IKEv2主要为移动端设备提供加密服务，这两种VPN协议都是目前使用最广泛，也是最标准、最安全VPN协议。

PPTP、L2TP、OpenVPN三种隧道协议的概念

针对VPN加密，目前AES（高级加密标准）是当今使用的最常见的加密密码之一。大多数VPN使用密钥长度为128位或256位的AES加密。即便是在量子计算方面取得进步，AES-128也被认为是安全的。

隧道分离 · SSL/TLS



- OpenVPN的技术核心是虚拟网卡，其次是SSL协议实现。（推荐，目前是主流）
- IKEv2/IPSec（推荐，尤其是手机）
- PPTP(Point to Point Tunneling Protocol，点对点隧道协议)默认端口号：1723（过时，不推荐）
- L2TP/IPSec(Layer 2 Tunneling Protocol，第二层隧道协议)(互联网安全协议IPsec，Internet Protocol Security)（过时，偶尔可用）
- WireGuard:WireGuard是一种较新的VPN协议，旨在提供比现有协议更好的性能和更高的安全性。它于2020年从Beta正式发布，由于其性能优于传统协议，超越了OpenVPN和IKEv2/IPSec，因此被认为是今后VPN的发展方向。（推荐，只有少数顶级VPN服务商实现了）
- SSTP
- SoftEther
- Lightway：是ExpressVPN开发的VPN协议。
- Nordlynx：另一家大牌VPN厂商NordVPN也在进行相关的布局。目前NordVPN推出的新协议是Nordlynx（基于WireGuard协议），并已在其客户端广泛部署。


- Ipsec（互联网协议安全）：此协议的安全性分为两个阶段：它对会话进行认证，然后加密数据。
- L2TP（第2层隧道协议）：隧道协议，通常与IPSec组合，以优化VPN连接的安全性。L2TP基本上在这个协议的两个不同连接之间创建了一个隧道。
- PPTP（点到点隧道协议）：该协议基本上创建了一个隧道来放入数据包。
- SSL/TLS（安全套接字层/传输层安全性：此协议在电子商务网站中非常常见。
- Open VPN：此协议是一个开源VPN，它创建点对点和站点到网络连接。它还使用另一种基于SSL / TLS的自定义协议。
- SSH（安全Shell）：此协议创建一个隧道，同时加密所有数据。
- WireGuard：WireGuard是开放源代码VPN程序及协议，基于Linux内核实现，利用Curve25519进行密钥交换，ChaCha20用于加密，Poly1305用于数据认证，BLAKE2用于散列函数运算，支持IPv4和IPv6的第3层。





[最全VPN协议详解与对比（协议类型+区别+优缺点）- 如何选择合适的VPN协议？](https://www.extrabux.com/chs/guide/5683100)  
[VPN三种协议PPTP、L2TP、OPENVPN对比分析](https://www.yangkun.net/683)  
[不同VPN协议的优缺点](https://nosec.org/home/detail/2525.html)  
[]()  
[VPN 协议——从最好到最坏，以及您需要知道的一切](https://surfshark.com/blog/vpn-protocols)  
[WireGuard vs OpenVPN vs L2TP vs IKEv2 vs SSTP vs PPTP：2021年的差异/优缺点](https://www.extrabux.com/en/guide/5817704)  
[VPN协议比较Comparison of VPN protocols](https://www.ivpn.net/pptp-vs-ipsec-ikev2-vs-openvpn-vs-wireguard/)  
[比较前 6 种 VPN 协议：哪种 VPN 协议最适合您？](https://candid.technology/vpn-protocol-comparison-openvpn-wireguard-sstp-pptp-ipsec-ikev2-l2tp/)  
[OpenVPN 与 IPSec、WireGuard、L2TP 和 IKEv2（VPN 协议）](https://restoreprivacy.com/vpn/openvpn-ipsec-wireguard-l2tp-ikev2-protocols/)  
[VPN Protocols: The Differences Between PPTP, L2TP, OpenVPN, IKEv2, Lightway, and WireGuard (Networking FAQ)](https://blog.flashrouters.com/2020/08/16/what-is-the-differences-pptp-l2tp-openvpn-networking-faq/)  



---------------------------------------------------------------------------------------------------------------------

## OpenVPN

[OpenVPN官网](https://openvpn.net/)  
[OpenVPN社区](https://openvpn.net/community/)  
[OpenVPN Github](https://github.com/OpenVPN)  
[OpenVPN wiki](https://zh.wikipedia.org/wiki/OpenVPN)  
[Tunnelblick free software for OpenVPN on macOS](https://www.tunnelblick.net/)  


OpenVPN是一个用于创建虚拟私人网络加密通道的软件包，最早由James Yonan编写。OpenVPN允许创建的VPN使用公开密钥、电子证书、或者用户名／密码来进行身份验证。

它大量使用了OpenSSL加密库中的SSL/TLS协议函数库。

它不与IPsec兼容。

原理：OpenVPN的技术核心是虚拟网卡，其次是SSL协议实现。

OpenVPN使用OpenSSL库来加密数据与控制信息。这意味着，它能够使用任何OpenSSL支持的算法。它提供了HMAC功能以提高连接的安全性。此外，OpenSSL的硬件加速也能提高它的性能。2.3.0以后版本引入PolarSSL。


OpenVPN － OpenVPN是为多种身份验证方法开发的开源项目。它是一种非常通用的协议，可以在具有不同功能的许多不同设备上使用，并可以通过UDP或TCP在任何端口上使用。OpenVPN使用OpenSSL库和TLS协议提供出色的性能和强大的加密。



---------------------------------------------------------------------------------------------------------------------

## IPsec

互联网安全协议（英语：Internet Protocol Security，缩写：IPsec）是一个协议包，透过对IP协议的分组进行加密和认证来保护IP协议的网络传输协议族（一些相互关联的协议的集合）。

IPsec主要由以下协议组成：
一、认证头（AH），为IP数据报提供无连接数据完整性、消息认证以及防重放攻击保护[3][4]；
二、封装安全载荷（ESP），提供机密性、数据源认证、无连接完整性、防重放和有限的传输流（traffic-flow）机密性[5]；
三、因特网密钥交换（英语： Internet Key Exchange ，简称IKE或IKEv2)，为 AH、ESP 操作所需的 安全关联（SA） 提供算法、数据包和密钥参数[6]。



IPsec协议工作在OSI模型的第三层，使其在单独使用时适于保护基于TCP或UDP的协议（如安全套接子层（SSL）就不能保护UDP层的通信流）。这就意味着，与传输层或更高层的协议相比，IPsec协议必须处理可靠性和分片的问题，这同时也增加了它的复杂性和处理开销。相对而言，SSL/TLS依靠更高层的TCP（OSI的第四层）来管理可靠性和分片。


### IPsec实现

FreeS/WAN项目已经开发了一个开源的GNU/Linux操作系统下的IPsec实现。Free S/WAN项目的开发在2004年时被中止。Openswan、strongSwan和libreswan是Free S/WAN延续。

reeS/WAN，名称来自于自由安全广域网络（英语：Free Secure Wide-Area Networking）的缩写，一个自由软件专案，在Linux平台上实作了IPsec功能，希望能为互联网提供机会性加密（Opportunistic encryption）功能。这个专案由约翰·吉尔摩提出，大多数时候由休·丹尼尔管理，主要的技术领导者为亨利·斯宾塞。1997年秋天，这个专案的程式码在美国境外建立。

在2004年4月22日，释出2.06版后，这个专案停止活动。在2.04版时，分支为Openswan、libreswan与strongswan。



[IPsec wiki](https://zh.wikipedia.org/wiki/IPsec)
[How IPsec works, why we need it, and its biggest drawbacks](https://www.csoonline.com/article/2117067/data-protection-ipsec.html)  
[网络安全之IPsec详解](https://blog.csdn.net/qq_43561370/article/details/111814842)  
[技术点详解---IPSec VPN基本原理](http://www.h3c.com/cn/d_201005/675214_97665_0.htm)  
[IPsec vpn 详解](https://zhuanlan.zhihu.com/p/41601249)  
[IPSec VPN基本原理](https://cshihong.github.io/2019/04/03/IPSec-VPN%E5%9F%BA%E6%9C%AC%E5%8E%9F%E7%90%86/)  
[]()  


---------------------------------------------------------------------------------------------------------------------

## IKEv2/IPSec

[IKEv2 and your VPN – together for a speedy connection](https://surfshark.com/blog/ikev2-vpn)  
[]()  

IKEv2 (Internet Key Exchange v2)

IKEv2（Internet 密钥交换版本 2）是 IPSec 堆栈的一部分，用于在 VPN 协议中建立客户端和服务器之间的安全通信。由微软和思科开发。IKEv2 支持 IPSecs 的最新加密算法。


IKEv2是一种提供安全密钥交换会话的隧道协议。该协议是微软和思科合作的成果。与L2TP类似，它通常与IPsec配对使用以提供身份验证和加密功能。

IKEv2非常适合移动版VPN解决方案。这是因为它可以在任何暂时失去互联网连接的情况下重新连接。其次，它很擅长在网络交换期间重新连接（例如，从移动数据到WiFi网络时）。

IKEv2不像OpenVPN，PPTP或L2TP/IPsec协议那样受欢迎，但也有很大的VPN市场，特别是那些专注于移动版VPN的公司。因为它是专有软件，所以只支持Windows，iOS和Blackberry。


IKEv2/IPSec －带有Internet密钥交换版本2（IPSec / IKEv2）的Internet协议安全性是一种快速且安全的VPN协议。它已在许多操作系统（例如Windows、Mac OS和iOS）中自动进行预配置。它特别适合与移动设备重新建立连接。IKEv2的一个缺点是它是由Cisco和Microsoft开发的，不是像OpenVPN这样的开源项目。对于需要快速、轻量级VPN（该VPN安全且可以暂时断开连接以快速重新连接）的移动用户而言，IKEv2 / IPSec是一个不错的选择。


---------------------------------------------------------------------------------------------------------------------

## WireGuard

[WireGuard官网](https://www.wireguard.com/)  
[]()  


Wireguard 是市场上可用的开源 VPN 协议的最新成员。Wireguard 于 2020 年 3 月发布稳定版本，是一种专注于简单性和易用性的 VPN 协议。仅使用 4000 行代码来实现整个协议，与 OpenVPN 等具有 1,00,000 行代码的其他协议相比，Wireguard 的规模确实很小。

WireGuard 是一种较新的 VPN 协议，旨在提供比现有协议更好的性能和更高的安全性。它于 2020 年从测试版正式发布，并且由于在比较传统协议中具有更好的性能而继续受到欢迎。




WireGuard具有现代化，极快的速度和极简的体系结构，使用最先进的加密技术，并有详尽的学术研究支持。通过此组合，它超越了当前领先的协议– OpenVPN和IPSec。WireGuard仅包含4000行代码，因此易于部署，审核和发现错误。进行比较：OpenVPN在40万行代码上运行，这意味着WireGuard仅占OpenVPN代码体积的1％。

WireGuard － WireGuard是一种较新的VPN协议，与现有VPN协议相比，旨在提供更高的安全性和更好的性能。默认情况下，WireGuard在隐私方面存在一些问题，尽管大多数支持WireGuard的VPN已经克服这些问题。



---------------------------------------------------------------------------------------------------------------------

## PPTP


PPTP(Point to Point Tunneling Protocol，点对点隧道协议)默认端口号：1723

PPTP（点对点隧道协议）是最古老的 VPN，由微软在九十年代后期发布。该协议嵌入在 Microsoft 设备中使用 Windows 95 及更高版本的操作系统中，并且可以看到与 Linus 和 Android 设备捆绑在一起。因此，您无需在设备上安装任何第三方应用程序即可使用 PPTP，并且在大多数客户端设备上都可以轻松配置。



PPTP，即PPTF协议。该协议是在PPP协议的基础上开发的一种新的增强型安全协议，支持多协议虚拟专用网(VPN)，可以通过密码身份验证协议(PAP)、可扩展身份验证协议(EAP)等方法增强安全性。可以使远程用户通过拨入ISP、通过直接连接Internet或其他网络安全地访问企业网。

点对点隧道协议(PPTP)是一种支持多协议虚拟专用网络的网络技术，它工作在第二层。通过该协议，远程用户能够通过 Microsoft Windows NT工作站、Windows xp 、Windows 2000 和windows2003、windows7操作系统以及其它装有点对点协议的系统安全访问公司网络，并能拨号连入本地ISP，通过Internet 安全链接到公司网络。

PPTP协议是点对点隧道协议，其将控制包与数据包分开，控制包采用TCP控制。PPTP使用TCP协议，适合在没有防火墙限制的网络中使用。

PPTP －点对点隧道协议是一种基本的较旧的VPN协议，内置在许多操作系统中。不过，PPTP具有已知的安全漏洞，出于隐私和安全原因，就不太建议选择。


---------------------------------------------------------------------------------------------------------------------

## L2TP/IPSec

[L2TP VPN基本原理](https://cshihong.github.io/2019/08/21/L2TP-VPN%E5%9F%BA%E6%9C%AC%E5%8E%9F%E7%90%86/)  
[第二层隧道协议 wiki](https://zh.wikipedia.org/wiki/%E7%AC%AC%E4%BA%8C%E5%B1%82%E9%9A%A7%E9%81%93%E5%8D%8F%E8%AE%AE)

L2TPv3

L2TP / IPSec －具有Internet协议安全性也是不错选择。该协议比PPTP更安全，但是由于数据包是双重封装的，因此它并不总能提供最佳响应速度。它通常与移动设备一起使用，并内置在许多操作系统中。

L2TP（第 2 层隧道协议）协议是对 PPTP 协议的更新，由 Cisco 和 Microsoft 开发。的L2TP协议是一种封装/隧穿协议，该协议不提供加密因此它被耦合以用于IPSec的（因特网协议安全）协议的加密和认证。


第二层隧道协议（英语：Layer Two Tunneling Protocol，缩写为L2TP）是一种虚拟隧道协议，通常用于虚拟专用网。L2TP协议自身不提供加密与可靠性验证的功能，可以和安全协议搭配使用，从而实现数据的加密传输。经常与L2TP协议搭配的加密协议是IPsec，当这两个协议搭配使用时，通常合称L2TP/IPsec。


---------------------------------------------------------------------------------------------------------------------

## SSTP

[[MS-SSTP]: Secure Socket Tunneling Protocol (SSTP)](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-sstp/c50ed240-56f3-4309-8e0c-1644898f0ea8)  
[关于PPTP协议、L2TP协议和SSTP协议的定义](https://zhuanlan.zhihu.com/p/76851662)  
[]()  

安全套接字隧道协议（SSTP）与OpenVPN非常相似，唯一的区别在于它是Microsoft在Windows Vista中开发和引入的专有软件。

与OpenVPN一样，SSTP支持AES 256位密钥加密，并使用2048位SSL/TSL证书进行身份验证。该协议同样支持Linux，Windows和BSD系统。而对于Android和iOS等，仅通过第三方客户端提供支持。

SSTP 或安全套接字传输协议是 Microsoft 创建的一种补偿算法。与 PPTP 和 L2TP/IPSec 相比，它提供了更多的安全性，如今它在很多 VPN 中使用，但由于协议的性质，它只能在 Windows、路由器、Android 和 Linux 上使用。




---------------------------------------------------------------------------------------------------------------------

## SoftEther

[SoftEther VPN](https://www.softether.org)  
[SoftEtherVPN Github](https://github.com/SoftEtherVPN/SoftEtherVPN)  
[SoftEther VPN wiki](https://zh.wikipedia.org/wiki/SoftEther_VPN)  
[]()

SoftEther VPN是一个由日本程序员登大游（日语：登 大遊）因就读筑波大学时的硕士论文研究主题而开发的开源、跨平台、多重协议之虚拟专用网方案，此方案让一些虚拟专用网协议像是SSL VPN、L2TP、IPsec、OpenVPN以及微软SSTP都由同一个VPN服务器提供。在2014年1月4日以GNU通用公共授权条款的方式转变为开源软件。2019年1月21日转变为Apache License 2.0授权。




---------------------------------------------------------------------------------------------------------------------

## Lightway

[ExpressVPN官网](https://www.expressvpn.com/)  
[Lightway协议网站](https://www.expressvpn.com/lightway)  

Lightway：ExpressVPN 的现代 VPN 协议

Lightway是全球著名VPN厂商ExpressVPN主导研发的新一代VPN协议，它的目的是要超越传统的IKEv2/IPsec，以及OpenVPN等协议。与旧的VPN协议相比，Lightway具有的一些全新特点或优势包括：代码更加精简高效，连接和运行速度更快，且安全性及稳定性更好。此外，还可提供不同移动网络间的无缝切换，为移动用户提供更佳的使用体验。

根据ExpressVPN官方消息，Lightway未来还将开放源代码（开源），以便使得该协议更加透明、并接受更为广泛的检验。其实，不仅ExpressVPN在尝试新一代VPN协议，另一家大牌VPN厂商NordVPN也在进行相关的布局。目前NordVPN推出的新协议是Nordlynx（基于WireGuard协议），并已在其客户端广泛部署。

Lightway是ExpressVPN开发的VPN协议。 Lightway设计轻巧，运行速度更快，耗电量更少，并且易于审核和维护。 VPN协议构成了VPN服务的基础，将会大大提升VPN使用体验。 大多数提供商都使用相同的现成协议，但是ExpressVPN现在已经设计了自己的协议：Lightway。Lightway使用wolfSSL，其完善的加密库已受到第三方的广泛审查，包括针对FIPS 140-2标准的审查。 与其他主要VPN协议相比，它具有更少的代码行，这使审核发现和修复问题变得容易。并且，Lightway VPN协议目前也计划将公开源代码。




### ExpressVPN介绍

ExpressVPN默认采用军事级别的AES-256位加密方式，这是目前全球范围内最强的加密方式，美国政府和全球大部分银行都采用的是这种加密技术。此外，ExpressVPN支持多种VPN协议，包括OpenVPN、IKEv2、L2TP/IPaec、WireGuard、PPTP、SSTP、Lightway。其中OpenVPN是最强大的VPN协议，而IKEv2主要为移动端设备提供加密服务，这两种VPN协议都是目前使用最广泛，也是最标准、最安全VPN协议。




### 个人使用测试

个人两天测试，ExpressVPN并没有网上说的那么好，可能是我使用的姿势不对

实际测试，自己提供的客户端不够智能，无法选择性代理网站（没有类似V2Ray的PAC模式），网速也一点都不快，查资料还可以，看视频，youtube就不行了【我只试用了一两天，主要是只能全局代理，让我在公司访问公司内网，或者在家里使用，爱奇艺、淘宝、JD等因为全局代理，定位错误，都被导到国际站，让我苦不堪言，就只能退费了，账号给我另一个小伙伴尝试过，也反馈网速不太好】




---------------------------------------------------------------------------------------------------------------------

## Nordlynx

[NordVPN官网](https://nordvpn.com/zh/)  
[What is NordLynx?](https://support.nordvpn.com/General-info/1438624372/What-is-NordLynx.htm)



目前NordVPN推出的新协议是Nordlynx（基于WireGuard协议），并已在其客户端广泛部署。

知名VPN提供商 NordVPN 公司率先推出了基于 WireGuard VPN 协议服务 NordLynx 。建立在下一代VPN协议WireGuard®的基础上，NordLynx提供超快速的VPN连接。




---------------------------------------------------------------------------------------------------------------------



