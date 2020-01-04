[缓存项目](https://github.com/youngzil/quickstart-cache)  
  
1、[Redis学习](#Redis学习)  
  
2、[Memcached学习](#Memcached学习)  
  
3、[缓存学习](#缓存学习)  
  
4、[其他缓存框架](#其他缓存框架)  
  
  
5、  
  
---------------------------------------------------------------------------------------------------------------------  
## Redis学习  
  
Redis  
Redis默认端口6379  
安装启动：./redis-server redis.conf  

Redis部署模式：  
1、单节点模式  
2、单节点主从：单节点带有从节点模式（一主一从，一主多从， 树型主从结构（从节点还有子从节点））  
3、主从带Sentinel哨兵模式  
4、集群模式：Redis Cluster  

Redis集群模式搭建、扩缩容：手动 和 ruby脚本  
主从带Sentinel哨兵模式:Sentinel的工作方式  
Redis集群解决方案
Redis的最常被问到知识点总结.md  
  
Redis主从复制机制
Redis事务  
  
Redis Bitmaps：批量字节操作主要有三个命令：BITOP，BITCOUNT，BITPOS  
批量字节操作Bitmap：setbit、getbit、bitcount  

Redis支持五种数据类型：string（字符串），hash（哈希），list（列表），set（集合）及zset(sorted set：有序集合)。  
Redis的五种数据类型的实现是什么数据结构  

Redis命令：Key（键）、String（字符串）、Hash（哈希表）、List（列表）、Set（集合）、SortedSet（有序集合）、Pub/Sub（发布/订阅）、Transaction（事务）  
  
Redis中支持RDB和AOF这两种持久化机制  
redis提供6种数据淘汰策略  
缓存算法（页面置换算法）-FIFO、LFU、LRU
缓存淘汰算法之LRU 
Redis服务端处理流程：计算槽、槽节点查找、处理/ASK/MOVED  
  
Redis如何解决key冲突：使用redis的不同db（集群模式部署不行），key带上业务含义  
如何解决Redis的并发竞争key问题：Redis事务、分布式锁  


Redis和Memcached区别：支持数据类型、持久化、数据备份恢复、路由规则、网络IO模型  

  
---------------------------------------------------------------------------------------------------------------------  
## Memcached学习  
  
Memcached ：  
增删改查命令：add/set、replace、get、delete  
遍历memcached：stats  
Memcached 所有命令都是原子性的  
   
memcached：  
命令：  
连接：telnet  
set、add、replace、get、delete  
   
---------------------------------------------------------------------------------------------------------------------  
  
## [缓存学习](https://github.com/youngzil/quickstart-cache/tree/master/docs)  
  
1、缓存热点Key、大Value
2、缓存一致性问题
3、Redis和Memcached的区别
4、分布式缓存和Redis Key设计技巧
5、缓存的作用和分类
6、缓存算法（页面置换算法）-FIFO、LFU、LRU
缓存淘汰算法之LRU 
7、
8、

---------------------------------------------------------------------------------------------------------------------  
## 其他缓存框架   
   
quickstart-caffeine框架  
Caffeine：  
1、Caffeine 的三种缓存填充策略：手动、同步加载和异步加载。  
2、Caffeine 有三个值回收策略：基于大小，基于时间和基于引用。  
3、刷新：（不同于过期）可以将缓存配置为在指定时间段后自动刷新条目。  
4、统计：Caffeine 有记录缓存使用情况的统计方式：  
  
ConcurrentLinkedHashMap框架  
ConcurrentLinkedHashMap提供一个基于权重管理容量的Map，有以下特性  
1、基于LRU（Least recently used，最近最少使用）算法来替换Map中的元素  
2、再高负载情况下，和ConrrentHashMap具有相同的性能  
3、Can bound by the size of the values (e.g. Multimap cache) （这条没看懂）  
4、提供元素移除的通知事件  
  
guava-cache学习  
/Users/yangzl/git/quickstart-cache/quickstart-guava-cache/README.md  
  
  
jcache学习  
/Users/yangzl/git/quickstart-cache/quickstart-jcache/README.md  
  
  
jetcache学习：缓存统一的接口，类似slf4j  
/Users/yangzl/git/quickstart-cache/quickstart-jetcache/README.md  
  
ehcache  
  
hazelcast  
  
tair  
  
  
---------------------------------------------------------------------------------------------------------------------  
  
  
