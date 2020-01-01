NAT(Network Address Translators)，网络地址转换：网络地址转换是在IP地址日益缺乏的情况下产生的，它的主要目的就是为了能够地址重用。
NAT分为两大类，基本的NAT和NAPT(Network  Address/Port Translator)。
最开始NAT是运行在路由器上的一个功能模块。


一种是NAT再次创建一个Session，并且再次为这个Session分配一个端口号（比如：62001）。另外一种是NAT再次创建一个Session，但是不会新分配一个端口号，而是用原来分配的端口号62000。前一种NAT叫做Symmetric NAT，后一种叫做Cone NAT。

ClientA（内网10.0.0.1:1234）----》NATA（内网IP，公网IP）----》Server

UDP用打洞技术穿透NAT的原理与实现：

那么我们如果想从外部发送一个数据报给内网的计算机有什么办法呢？首先，我们必须在内网的NAT上打上一个“洞”（也就是前面我们说的在NAT上建立一个Session），这个洞不能由外部来打，只能由内网内的主机来打。而且这个洞是有方向的，比如从内部某台主机（比如：192.168.0.10）向外部的某个IP(比如：219.237.60.1)发送一个UDP包，那么就在这个内网的NAT设备上打了一个方向为219.237.60.1的“洞”，（这就是称为UDP Hole Punching的技术）以后219.237.60.1就可以通过这个洞与内网的192.168.0.10联系了。（但是其他的IP不能利用这个洞）。

ClientA  NAT-A  Server  NAT-B ClientB
总结一下这个过程：如果Client A想向Client B发送信息，那么Client A发送命令给Server S，请求Server S命令Client B向Client A方向打洞。
在NAT B上打一个方向为202.187.45.3（即Client A的外网地址）的洞，那么Client A发送到187.34.1.56:40000的信息,Client B就能收到了。



vpn工具禁用UDP加速功能，由于vpn工具使用了UDP穿孔技术，会导致NAT-遍历，影响性能，因此，此功能必须选中，否则无法正常拨号。




P2P技术：
HTTP隧道是拿来穿防火墙的，跟穿透NAT是完全不同的概念
我要的是两个不同局域网之内的用户不通过服务器而交换数据（P2P），HTTP隧道，不可能达到此目的。
能否通过IP伪装来实现这一点？




NAT Loopback（NAT回环）





HTTP：
在用户代理和源服务器中间可能存在多个中间层，比如代理，网关，或者隧道（tunnels）。


HTTP中继的概念（原封不动的将HTTP消息和响应在Client 和 Web Server之间传输）；



HTTP隧道技术
https://blog.csdn.net/nicehunt/article/details/44218775
https://blog.csdn.net/yangdelong/article/details/1584349
https://blog.csdn.net/u011995362/article/details/53729512

应用场景：
防火墙(只开放80)内的机器A
防火墙外部的机器B  (http隧道服务器)
防火墙外部的机器C 
如果A要通过某种非http协议访问C 应该不能访问

http隧道流程是
A上的软件需要用到非http协议访问外部机器时候 把本来的数据(包括数据、最终IP地址、原始协议等)打包放在一个http包中然后发给B, 这时候防火墙是可以通过的 .B上接收到数据包之后 分解数据形成原始的数据包 按照原协议发送给最终的IP,返回数据之后 打包成http 发送给A。A解释这个http包并且处理.

利用HTTP协议的缺陷来实现对防火墙的渗透，或者说现有的一些HTTP隧道技术的实现，是基于防火墙在对HTTP协议的报文进行识别与过滤时，往往只对其诸如POST、GET等命令的头进行识别，而放行其后的所有报文。

简单的说，HTTP隧道技术就是把所有要传送的数据全部封装到HTTP协议里进行传送，HTTP隧道技术几乎支持了所有的上网方式，如：拨号上网、ADSL、Cable Modem、NAT透明代理、HTTP的GET型和CONNECT型代理、SOCKS4代理、SOCKS5代理等。

   另外HTTP隧道技术也用于木马的制作，如把HTTP数据包里Agent段设为IE，对外端口为80，然后把自己的小马注入IE进程，哪个防火墙能分辨出它是木马在发送数据？

HTTP隧道工具HTTPTunnel

在很多服务器上，防火墙会限制主机的出站流量，只允许80之类的端口。如果要使用其他端口，只能通过HTTP隧道方式实现。Kali Linux提供一款HTTP隧道工具HTTPTunnel。该工具可以将其他端口的数据以HTTP协议的方式进行发送和接受。该工具包括服务器端和客户端两部分。

渗透测试人员在公共网络运行服务端，监听80端口，接受和转发数据。然后，在被限制的主机上运行客户端，监听本地特定的应用端口（如12355），并以HTTP协议方式转发到服务器端的80端口。在被限制的主机上，直接执行其他程序，连接本地的12355端口，就可以规避防火墙的拦截了。












参考
https://blog.csdn.net/liujiayu2/article/details/46537313


