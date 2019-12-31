1、remoting：netty、mina、grizzy、xsocket  
rpc：dubbo、grpc、  

RPC框架：dubbo、grpc、finagle、single-jdk实现、thrift、jupiter、tars、  
远程调用：grizzly、hessian、mina、netty、t-io  
网关：kong、litte-proxy、nginx、tengine  


远程通讯调用框架  
/Users/yangzl/git/quickstart-remoting/docs
quickstart-netty
quickstart-mina
quickstart-hessian
quickstart-t-io
quickstart-xsocket  
quickstart-grizzly
/Users/yangzl/git/quickstart-rpc/docs  
  
  
  Netty学习
  netty概念和常用类：group、channel、handler、option  
  netty执行流程：拆包、解码、封装对象  
  Server端Boss线程和worker线程比较：boss设置为1，监听端口的  
  netty两种线程模型和JDK线程池模型比较  
  Netty的高性能及NIO的epoll空轮询bug：判定和解决：重建selector  
  TCP粘包/拆包与Netty解决方案：4种：分隔符，回车换行分隔符，定长报文，消息头和消息体  
  netty的网络创建在哪里  
  java nio的selector  和linux的epoll select  
    
  Java异步NIO框架Netty实现高性能高并发：  
  netty高性能  
  传输：异步非阻塞通信、零拷贝（直接内存和transferTo）、灵活的TCP参数配置能力（option参数的设置）  
  协议：多种序列化协议，Protobuf的支持、Thrift的  
  线程：高效的Reactor线程模型、线程池、无锁化的串行设计理念：Netty的NioEventLoop是单线程的  
  内存：内存池化，各种不同大小对象管理：三种大小对象类型  
    
    
  Netty实现原理  
  netty的相关所有，使用的协议  
  hession用来干嘛的：Hessian本身即是基于Http的RPC实现  
  Java序列化和Hessian序列化的区别  
  netty的相关，管道是什么设计模式：责任链模式 或者 管道设计模式  
    
    
  Netty零拷贝  
  Netty内存管理：堆外内存池  
    
  使用Handler的注意事项  
  
    
  
看过nio的源码吗？  
bytebuffer的使用，写读容量参数  
  
  
  
netty的Channel的ID值  
可以通过调用 Channel.id() 获取Channel的ID值。  
 全局唯一的channel ID  
每个 Channel 都会有一个全局唯一的ID，生成规则如下：  
MAC 地址(EUI-48 or EUI-64)，最好是全局唯一的  
当前进程ID  
System#currentTimeMillis()  
System#nanoTime()  
32-bit的随机integer  
序列化递增的32-bit integer.  


netty框架的了解？  
boss线程，work线程数  
主要接口有哪些？  
源码使用流程？  
  
  
  
---------------------------------------------------------------------------------------------------------------------  
如何实现负载均衡,有哪些算法可以实现?  
http://blog.csdn.net/zgwangbo/article/details/51533657  
https://www.cnblogs.com/szlbm/p/5588555.html  
http://blog.csdn.net/mengdonghui123456/article/details/53981976  
http://blog.csdn.net/zhoudaxia/article/details/23672319  
均衡算法主要解决将请求如何发送给后端服务。经常会用到以下四种算法：随机法（Random）、轮询法（Round Robin）、一致哈希（consistent-hash）和主备（master-slave）。、加权随机（Weight Random）法、、加权轮询（Weight Round Robin）法、源地址哈希（Hash）法、最小连接数（Least Connections）法、  
---------------------------------------------------------------------------------------------------------------------  
对于RPC应用高性能的三个主题永远是IO模型、数据协议、线程模型。  
  
netty介绍  
http://blog.csdn.net/haoyuyang/article/details/53243785  
http://ifeve.com/netty5-user-guide/  
  
Netty IO模型  
netty是一个流行的NIO的框架  
JDK1.4提供了对非阻塞IO（NIO）的支持，JDK1.6版本使用epoll替代了传统的select/poll，极大的提升了NIO通信的性能  
  
在*nix中将IO模型分为5类。  
Blocking I/O  
Nonblocking I/O  
I/O Multiplexing (select and poll)  
Signal Driven I/O (SIGIO)  
Asynchronous I/O (the POSIX aio_functions)  
  
TCP粘包、拆包问题  
解决方案：  
①消息定长，例如每个报文的大小固定为200个字节，如果不够，空位补空格。  
②在包尾部增加特殊字符进行分割，例如加回车等。  
③将消息分为消息头和消息体，在消息头中包含表示消息总长度的字段，然后进行业务逻辑的处理。  
  
Netty中解决TCP粘包/拆包的方法：  
①分隔符类：DelimiterBasedFrameDecoder（自定义分隔符）  
②定长：FixedLengthFrameDecoder  
  
Netty高性能之Reactor线程模型  
Reactor模式是事件驱动的，有一个或多个并发输入源，有一个Service Handler，有多个Request Handlers；这个Service Handler会同步的将输入的请求（Event）多路复用的分发给相应的Request Handler  
  
Netty是一个高性能的NIO通信框架，提供异步的、事件驱动的网络编程模型。使用Netty可以方便用户开发各种常用协议的网络程序。例如：TCP、UDP、HTTP等等。  
  
netty的线程模型  
http://blog.csdn.net/u010853261/article/details/62043709  
http://blog.csdn.net/zxhoo/article/details/17634683  
http://blog.csdn.net/zxh87/article/details/73467873  
http://blog.csdn.net/u012495483/article/details/74747601  
1 Reactor单线程模型  
2 Reactor多线程模型  
3 Reactor主从多线程模型  
  
Netty 的服务器端的 acceptor 阶段, 没有使用到多线程, 因此上面的 主从多线程模型 在 Netty 的服务器端是不存在的.  
  
NioEventLoopGroup实际上就是个线程池  
NioEventLoopGroup在后台启动了n个NioEventLoop来处理Channel事件  
每一个NioEventLoop负责处理m个Channel  
NioEventLoopGroup从NioEventLoop数组里挨个取出NioEventLoop来处理Channel  
  
BossEventLoopGroup通常是一个单线程的EventLoop，EventLoop维护着一个注册了ServerSocketChannel的Selector实例，BossEventLoop不断轮询Selector将连接事件分离出来，通常是OP_ACCEPT事件，然后将accept得到的SocketChannel交给WorkEventLoopGroup，WorkerEventLoopGroup会由next选择其中一个EventLoopGroup来将这个SocketChannel注册到其维护的Selector并对其后续的IO事件进行持续的处理。在Reactor模式中BossEventLoopGroup主要是对多线程的扩展，而每个EventLoop的实现涵盖IO事件的分离，和分发(Dispatcher)。  
  
Rocketmq的BossEventLoopGroup是单线程的，WorkEventLoopGroup是serverSelectorThreads个线程，DefaultEventExecutorGroup是serverWorkerThreads个线程  
  
  
1、  


  
2、  
  
  
3、  
  
  
4、  
  
  
5、  
  
  
6、  
  
  
7、  
  
  
8、  
  
  
9、  
  
  
10、  
  
  
11、  
  
  
12、  
  
  
13、  
  
  
14、  
  
  
15、  
  
  
16、  
  
  
17、  
  
  
18、  
  
  
19、  
  
  
20、  
  
  
21、  
  
  
22、  
  
  
23、  
  
  
24、  
  
  
25、  
  
  
  
  
  
  
  
  
  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
---------------------------------------------------------------------------------------------------------------------  
  
  
  
  
  
  
