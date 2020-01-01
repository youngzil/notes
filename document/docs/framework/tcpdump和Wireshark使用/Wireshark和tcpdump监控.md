1、tcpdump命令和使用
2、tcpdump原理分析
3、tcpdump和Wireshark网站




---------------------------------------------------------------------------------------------------------------------

基础依赖软件
yum -y install flex  
yum -y install bison  
yum -y install gcc  



cd /var/install/  
wget http://www.tcpdump.org/release/libpcap-1.5.3.tar.gz  
wget http://www.tcpdump.org/release/tcpdump-4.5.1.tar.gz  

tar -zxvf libpcap-1.5.3.tar.gz  
cd libpcap-1.5.3  
./configure  
make && make install
  
cd ..  
tar -zxvf tcpdump-4.5.1.tar.gz  
cd tcpdump-4.5.1  
./configure  
make && make install 

————————————————
版权声明：本文为CSDN博主「TomZXY」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/small____fish/article/details/51360991

---------------------------------------------------------------------------------------------------------------------
tcpdump命令和使用


tcpdump是用来抓取数据非常方便，Wireshark则是用于分析抓取到的数据比较方便。


开启混杂模式的命令是：ifconfig en0 promisc, en0是你要打开混杂模式的网卡。


1、直接启动tcpdump，将抓取所有经过第一个网络接口上的数据包，一般是eth0
tcpdump

2、抓取所有经过指定网络接口上的数据包
tcpdump -i en0

3、抓取所有经过 en0，目的或源地址是 10.37.63.255 的网络数据：
tcpdump -i en0 host 10.37.63.255

tcpdump  -i lo host 10.21.20.107 and tcp port 31100 -w ../test/test2.pcap 
netstat -anp | grep 52729



4、抓取主机10.37.63.255和主机10.37.63.61或10.37.63.95的通信：
tcpdump host 10.37.63.255 and (10.37.63.61 or 10.37.63.95)

5、抓取主机192.168.13.210除了和主机10.37.63.61之外所有主机通信的数据包：
tcpdump -n host 10.37.63.255 and !10.37.63.61

6、抓取主机10.37.63.255除了和主机10.37.63.61之外所有主机通信的ip包
tcpdump ip -n host 10.37.63.255 and !10.37.63.61

7、抓取主机10.37.63.3发送的所有数据：
tcpdump -i en0 src host 10.37.63.3

8、抓取主机10.37.63.3接收的所有数据：
tcpdump -i en0 dst host 10.37.63.3



参考
https://www.jianshu.com/p/8d9accf1d2f1
https://www.cnblogs.com/pyng/p/9698723.html


---------------------------------------------------------------------------------------------------------------------
tcpdump原理分析


1 起因

前段时间，一直在调线上的一个问题：线上应用接受POST请求，请求body中的参数获取不全，存在丢失的状况。这个问题是偶发性的，大概发生的几率为5%-10%左右，这个概率已经相当高了。在排查问题的过程中使用到了tcpdump和Wireshark进行抓包分析。感觉这两个工具搭配起来干活，非常完美。所有的网络传输在这两个工具搭配下，都无处遁形。

为了更好、更顺手地能够用好这两个工具，特整理本篇文章，希望也能给大家带来收获。为大家之后排查问题，添一利器。


2 tcpdump与Wireshark介绍

在网络问题的调试中，tcpdump应该说是一个必不可少的工具，和大部分linux下优秀工具一样，它的特点就是简单而强大。它是基于Unix系统的命令行式的数据包嗅探工具，可以抓取流动在网卡上的数据包。

默认情况下，tcpdump不会抓取本机内部通讯的报文。根据网络协议栈的规定，对于报文，即使是目的地是本机，也需要经过本机的网络协议层，所以本机通讯肯定是通过API进入了内核，并且完成了路由选择。【比如本机的TCP通信，也必须要socket通信的基本要素：src ip port dst ip port】

如果要使用tcpdump抓取其他主机MAC地址的数据包，必须开启网卡混杂模式，所谓混杂模式，用最简单的语言就是让网卡抓取任何经过它的数据包，不管这个数据包是不是发给它或者是它发出的。一般而言，Unix不会让普通用户设置混杂模式，因为这样可以看到别人的信息，比如telnet的用户名和密码，这样会引起一些安全上的问题，所以只有root用户可以开启混杂模式，开启混杂模式的命令是：ifconfig en0 promisc, en0是你要打开混杂模式的网卡。

Linux抓包原理：

Linux抓包是通过注册一种虚拟的底层网络协议来完成对网络报文(准确的说是网络设备)消息的处理权。当网卡接收到一个网络报文之后，它会遍历系统中所有已经注册的网络协议，例如以太网协议、x25协议处理模块来尝试进行报文的解析处理，这一点和一些文件系统的挂载相似，就是让系统中所有的已经注册的文件系统来进行尝试挂载，如果哪一个认为自己可以处理，那么就完成挂载。

当抓包模块把自己伪装成一个网络协议的时候，系统在收到报文的时候就会给这个伪协议一次机会，让它来对网卡收到的报文进行一次处理，此时该模块就会趁机对报文进行窥探，也就是把这个报文完完整整的复制一份，假装是自己接收到的报文，汇报给抓包模块。

Wireshark是一个网络协议检测工具，支持Windows平台、Unix平台、Mac平台，一般只在图形界面平台下使用Wireshark，如果是Linux的话，直接使用tcpdump了，因为一般而言Linux都自带的tcpdump，或者用tcpdump抓包以后用Wireshark打开分析。

在Mac平台下，Wireshark通过WinPcap进行抓包，封装的很好，使用起来很方便，可以很容易的制定抓包过滤器或者显示过滤器，具体简单使用下面会介绍。Wireshark是一个免费的工具，只要google一下就能很容易找到下载的地方。

所以，tcpdump是用来抓取数据非常方便，Wireshark则是用于分析抓取到的数据比较方便。


作者：meng_philip123
链接：https://www.jianshu.com/p/8d9accf1d2f1
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。


---------------------------------------------------------------------------------------------------------------------
tcpdump和Wireshark网站

tcpdump
https://www.tcpdump.org/


Wireshark监控
https://www.wireshark.org/download.html
https://github.com/wireshark/wireshark


tcpdump：
保存到target.cap文件，可以使用Wireshark打开文件
tcpdump -i en4 port 8101 -U -w ./target.cap
tcpdump tcp port 8101 -n -X -s 0


wireshark：
http  and  tcp.port == 8101



tcpdump使用
https://www.cnblogs.com/ggjucheng/archive/2012/01/14/2322659.html


wireshark 实用过滤表达式
https://blog.csdn.net/aflyeaglenku/article/details/50884296
https://blog.csdn.net/panda62/article/details/80279732


---------------------------------------------------------------------------------------------------------------------




