#Redis线程模型


- [Redis为什么这么快](#Redis为什么这么快)
- [Redis6.0多线程](#Redis6.0多线程)



Redis 确实是单线程模型，指的是执行 Redis 命令的核心模块是单线程的，而不是整个 Redis 实例就一个线程，Redis 其他模块还有各自模块的线程的。

Redis基于Reactor模式开发了网络事件处理器，这个处理器被称为文件事件处理器。它的组成结构为4部分：多个套接字、IO多路复用程序、文件事件分派器、事件处理器。
因为文件事件分派器队列的消费是单线程的，所以Redis才叫单线程模型。



一般来说 Redis 的瓶颈并不在 CPU，而在内存和网络。如果要使用 CPU 多核，可以搭建多个 Redis 实例来解决。




Redis 作者从设计之初，进行了多方面的考虑。最终选择使用单线程模型来处理命令。之所以选择单线程模型，主要有如下几个重要原因：
- 使用单线程模型也能并发的处理客户端的请求（多路复用 I/O）【主要原因】
- Redis 操作基于内存，绝大多数操作的性能瓶颈不在 CPU
- 单线程模型，避免了线程间切换带来的性能开销
- 使用单线程模型，可维护性更高，开发，调试和维护的成本更低




## Redis为什么这么快
1、完全基于内存，绝大部分请求是纯粹的内存操作，非常快速。数据存在内存中，类似于HashMap，HashMap的优势就是查找和操作的时间复杂度都是O(1)；

2、数据结构简单，对数据操作也简单，Redis中的数据结构是专门进行设计的；

3、采用单线程，避免了不必要的上下文切换和竞争条件，也不存在多进程或者多线程导致的切换而消耗 CPU，不用去考虑各种锁的问题，不存在加锁释放锁操作，没有因为可能出现死锁而导致的性能消耗；

4、使用多路I/O复用模型，非阻塞IO；

5、使用底层模型不同，它们之间底层实现方式以及与客户端之间通信的应用协议不一样，Redis直接自己构建了VM 机制 ，因为一般的系统调用系统函数的话，会浪费一定的时间去移动和请求；



 1）绝大部分请求是纯粹的内存操作（非常快速）
 2）采用单线程,避免了不必要的上下文切 换和竞争条件 
 3）非阻塞 IO 优点：1.速度快，因为数据存在内存中，类似于 HashMap，HashMap 的优势就是查找和操作的时间 复杂度都是 O(1)




其实，Redis 4.0 开始就有多线程的概念了，比如 Redis 通过多线程方式在后台删除对象、以及通过 Redis 模块实现的阻塞命令等。

在 Redis 4.0 之后的版本，情况就有了一些变动，新版的 Redis 服务在执行一些命令时就会使用『主处理线程』之外的其他线程，例如 UNLINK、FLUSHALL ASYNC、FLUSHDB ASYNC 等非阻塞的删除操作。



## Redis6.0多线程
Redis6.0 引入的多线程部分，实际上只是用来处理网络数据的读写和协议解析，执行命令仍然是单一工作线程。
目前最新的 6.0 版本中，IO 多线程处理模式默认是不开启的，需要去配置文件中开启并配置线程数

多线程版本 Redis 6.0，单线程版本是 Redis 5.0.5。多线程版本需要新增以下配置:
io-threads 4 # 开启 4 个 IO 线程
io-threads-do-reads yes # 请求解析也是用 IO 线程




[理解Redis的线程IO模型](https://blog.csdn.net/alex_xfboy/article/details/84943148)  



https://www.cnblogs.com/javastack/p/12848446.html  
https://my.oschina.net/doocs/blog/4486815  
https://draveness.me/whys-the-design-redis-single-thread/  
https://blog.csdn.net/tanswer_/article/details/70196139  
https://www.jianshu.com/p/ccae497c0ebb  
https://cloud.tencent.com/developer/article/1488118  
https://blog.nowcoder.net/n/f7333103347a44b6a85c4a8ed0816e94  
https://developer.aliyun.com/article/702124  
https://blog.csdn.net/qq_16681169/article/details/100905697  
https://blog.csdn.net/xlgen157387/article/details/79470556  
