# Redis数据文件解析和内存分析


## Redis AOF文件格式解析

[REdis AOF文件结构分析](https://blog.csdn.net/Aquester/article/details/88550655)  
[解析Redis持久化的AOF文件](https://www.alibabacloud.com/help/zh/doc-detail/99345.htm)  
[如何解析Redis AOF文件？](https://cloud.tencent.com/developer/ask/210196)  


[EOL or End of Line or newline ascii character](https://www.loginradius.com/blog/async/eol-end-of-line-or-newline-characters/)  
Learn what are EOL (End of Line) or LF (Line Feed) or NL (New Line) ascii characters (\n\r) and why there are two (\n\r) newline characters.





## Redis RDB文件格式解析

[Redis持久化文件RDB的格式解析](https://cloud.tencent.com/developer/article/1179710)  
[Redis RDB 文件格式](https://github.com/wen866595/open-doc/blob/master/redis-doc/Redis-RDB-Dump-File-Format-cn.md)  
[Redis RDB文件格式全解析](https://blog.csdn.net/moakun/article/details/105341825)  


[RDB 文件结构说明](https://redisbook.readthedocs.io/en/latest/internal/rdb.html)  
[Redis持久化之RDB文件格式](https://blog.csdn.net/Xiejingfa/article/details/51553370)  


---------------------------------------------------------------------------------------------------------------------

## Redis内存分析方法

一般会采用 bgsave 生成 dump.rdb 文件，再结合 redis-rdb-tools 和 sqlite 来进行静态分析。

BGSAVE：在后台异步(Asynchronously)保存当前数据库的数据到磁盘。

BGSAVE 命令执行之后立即返回 OK ，然后 Redis fork 出一个新子进程，原来的 Redis 进程(父进程)继续处理客户端请求，而子进程则负责将数据保存到磁盘，然后退出。

生成内存快照:redis-rdb-tools 是一个 python 的解析 rdb 文件的工具，在分析内存的时候，主要用它生成内存快照。


[Redis持久化的几种方式——RDB深入解析](https://blog.csdn.net/sufu1065/article/details/106760875)  
[java-redis-rdb](https://github.com/ganghuawang/java-redis-rdb)  
[redis-rdb-tools](https://github.com/sripathikrishnan/redis-rdb-tools)  
[Redis内存分析方法](https://www.cnblogs.com/aresxin/p/9014617.html)  
[Redis内存分析](https://blog.csdn.net/weixin_41172473/article/details/82259889)  
[分析redis key大小的几种方法](https://cloud.tencent.com/developer/article/1757281?from=information.detail.redis%E5%86%85%E5%AD%98%E5%88%86%E6%9E%90%E6%96%B9%E6%B3%95)  
[redis快照文件dump.rdb解析工具--redis-rdb-tools](https://www.qedev.com/bigdata/197568.html)

redis源码剖析（十三）—— dump.rdb文件分析
https://blog.csdn.net/csdn_kou/article/details/103400068

Redis 内存分析神器
https://zhuanlan.zhihu.com/p/99957693

Redis RDB 分析工具 rdbtools 说明
https://www.cnblogs.com/zhoujinyi/p/13276697.html


---------------------------------------------------------------------------------------------------------------------
## Redis RDB文件格式解析Java实现

Redis replication tool. support sync, psync, psync2. can parse rdb, aof, mixed rdb and aof files. support redis-6.2



[redis-replicator GitHub](https://github.com/leonchen83/redis-replicator)  
[命令行工具redis-rdb-cli Github](https://github.com/leonchen83/redis-rdb-cli)  


[java-rdb-parser](https://github.com/jwhitbeck/java-rdb-parser)  
[RCT (Redis Computed Tomography) include parse redis rdb , slowlog analyze and clientlist analyze](https://github.com/xaecbd/RCT)  
[java-redis-rdb](https://github.com/ganghuawang/java-redis-rdb)  



