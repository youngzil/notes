redis 和 memcached  
  
redis持久化  
rdb aof  
  
---------------------------------------------------------------------------------------------------------------------  
  
1、缓存学习.md
1、缓存热点Key、大Value
2、缓存一致性问题
3、redis和memcached的区别
4、分布式缓存和Redis Key设计技巧
5、缓存的作用和分类  

2、Redis和Memcached的区别  
  /Users/yangzl/git/quickstart-cache/quickstart-memcached/README.md  
  /Users/yangzl/git/quickstart-cache/quickstart-redis/doc/redis学习.md  
    
3、quickstart-caffeine框架

Caffeine：  
1、Caffeine 的三种缓存填充策略：手动、同步加载和异步加载。  
2、Caffeine 有三个值回收策略：基于大小，基于时间和基于引用。  
3、刷新：（不同于过期）可以将缓存配置为在指定时间段后自动刷新条目。  
4、统计：Caffeine 有记录缓存使用情况的统计方式：  


ConcurrentLinkedHashMap框架
/Users/yangzl/git/quickstart-cache/quickstart-concurrentlinkedhashmap/README.md
ConcurrentLinkedHashMap提供一个基于权重管理容量的Map，有以下特性
    基于LRU（Least recently used，最近最少使用）算法来替换Map中的元素
    再高负载情况下，和ConrrentHashMap具有相同的性能
    Can bound by the size of the values (e.g. Multimap cache) （这条没看懂）
    提供元素移除的通知事件

guava-cache学习
/Users/yangzl/git/quickstart-cache/quickstart-guava-cache/README.md


jcache学习
/Users/yangzl/git/quickstart-cache/quickstart-jcache/README.md


jetcache学习：缓存统一的接口，类似slf4j
/Users/yangzl/git/quickstart-cache/quickstart-jetcache/README.md

  

Redis学习
quickstart-redis  
Redis集群解决方案：  
Redis 的集群解决方案有社区的，也有官方的，社区的解决方案有 Codis 和Twemproxy,  
Codis是由我国的豌豆荚团队开源的，  
Twemproxy是Twitter团队的开源的；  
官方的集群解决方案就是 Redis Cluster，这是由 Redis 官方团队来实现的。  
  
  
ConcurrentLinkedHashMap提供一个基于权重管理容量的Map，有以下特性  
    基于LRU（Least recently used，最近最少使用）算法来替换Map中的元素  
    再高负载情况下，和ConrrentHashMap具有相同的性能  
    Can bound by the size of the values (e.g. Multimap cache) （这条没看懂）  
    提供元素移除的通知事件  
  
  
Java缓存规范JCache API（JSR107），它对Java对象缓存进行标准化，方便高效开发，让程序员摆脱实现缓存有效期、互斥、假脱机（spooling）和缓存一致性等负担。该规范提供了API、RI（参考实现）和TCK（技术兼容性套件）。  
  
Java Caching定义了5个核心接口，分别是CachingProvider, CacheManager, Cache, Entry 和 Expiry。  
CachingProvider定义了创建、配置、获取、管理和控制多个CacheManager。一个应用可以在运行期访问多个CachingProvider。  
CacheManager定义了创建、配置、获取、管理和控制多个唯一命名的Cache，这些Cache存在于CacheManager的上下文中。一个CacheManager仅被一个CachingProvider所拥有。  
Cache是一个类似Map的数据结构并临时存储以Key为索引的值。一个Cache仅被一个CacheManager所拥有。  
Entry是一个存储在Cache中的key-value对。  
每一个存储在Cache中的条目有一个定义的有效期，即Expiry Duration。一旦超过这个时间，条目为过期的状态。一旦过期，条目将不可访问、更新和删除。缓存有效期可以通过ExpiryPolicy设置。  
  
  
  
  
JetCache是​​一种Java缓存抽象，可为各种缓存解决方案提供一致的使用。它提供了比Spring Cache更强大的注释。JetCache中的注释支持本机TTL，两级缓存和分布式自动刷新，您也可以Cache手动操作实例代码。目前有四种工具：RedisCache，TairCache（在github上不开源）， CaffeineCache（在内存中），简单LinkedHashMapCache（在内存中）。  
  
  
  
Redis  
Redis默认端口6379  
  
Redis支持五种数据类型：string（字符串），hash（哈希），list（列表），set（集合）及zset(sorted set：有序集合)。  
  
Redis事务  
  
Redis命令：Key（键）、String（字符串）、Hash（哈希表）、List（列表）、Set（集合）、SortedSet（有序集合）、Pub/Sub（发布/订阅）、Transaction（事务）  
  
Redis Bitmaps：批量字节操作主要有三个命令：BITOP，BITCOUNT，BITPOS  
  
部署模式：  
1、单节点模式  
2、单节点带有从节点模式（一主一从，一主多从， 树型主从结构（从节点还有子从节点））  
3、主从带Sentinel哨兵模式  
4、集群模式：Redis Cluster  
  
批量字节操作Bitmap  
Redis部署模式：单节点，单节点主从、主从带Sentinel哨兵模式、集群模式  
Redis集群模式搭建、扩缩容：手动 和 ruby脚本  
主从带Sentinel哨兵模式:Sentinel的工作方式  
Redis支持五种数据类型：string（字符串），hash（哈希），list（列表），set（集合）及zset(sorted set：有序集合)。  
Redis命令：Key（键）、String（字符串）、Hash（哈希表）、List（列表）、Set（集合）、SortedSet（有序集合）、Pub/Sub（发布/订阅）、Transaction（事务）  
  
Redis中支持RDB和AOF这两种持久化机制  
redis提供6种数据淘汰策略  
Redis服务端处理流程：计算槽、槽节点查找、处理/ASK/MOVED  
  
Redis和Memcached区别：支持数据类型、持久化、数据备份恢复、路由规则、网络IO模型  
  
Redis如何解决key冲突：使用redis的不同db（集群模式部署不行），key带上业务含义  
如何解决Redis的并发竞争key问题：Redis事务、分布式锁  
  
Redis集群解决方案：  
Redis 的集群解决方案有社区的，也有官方的，社区的解决方案有 Codis 和Twemproxy,  
Codis是由我国的豌豆荚团队开源的，  
Twemproxy是Twitter团队的开源的；  
官方的集群解决方案就是 Redis Cluster，这是由 Redis 官方团队来实现的。  
  
  
  
  
  
  
Memcached ：  
增删改查命令：add/set、replace、get、delete  
遍历memcached：stats  
Memcached 所有命令都是原子性的  
  
  
  
  
  
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
  
  
  
  
  
  
  
  
缓存：Redis、memcached、ehcache、hazelcast、tair  
  
  
  
---------------------------------------------------------------------------------------------------------------------  
缓存：  
memcached、Redis  
  
memcached：  
命令：  
连接：telnet  
set、add、replace、get、delete  
  
Redis：  
安装：./redis-server redis.conf  
Bitmap：setbit、getbit、bitcount  
Redis支持五种数据类型：string（字符串），hash（哈希），list（列表），set（集合）及zset(sorted set：有序集合)。  
命令：  
  
  
  
  
  
  
  
---------------------------------------------------------------------------------------------------------------------  
  
Redis和Memcached的区别  
https://blog.csdn.net/u013256816/article/details/51146314  
1、数据结构  
2、数据存储及持久化  
Redis虽然是基于内存的存储系统，但是它本身是支持内存数据的持久化的，而且提供两种主要的持久化策略：RDB快照和AOF日志。而memcached是不支持数据持久化操作的。  
3、内存管理机制不同  
在Redis中，并不是所有的数据都一直存储在内存中的。这是和Memcached相比一个最大的区别。当物理内存用完时，Redis可以将一些很久没用到的value交换到磁盘。Redis只会缓存所有的key的信息，  
4、集群管理和路由、  
Memcached本身并不支持分布式，因此只能在客户端通过像一致性哈希这样的分布式算法来实现Memcached的分布式存储。  
  
Redis Cluster 集群一致性原理及slot迁移测试  
https://blog.csdn.net/u011535541/article/details/78834565  
移slot如何保证slot归属的一致性.  
从node A迁移一个槽位到node B的流程是:  
(1) node A调用cluster setslot migrating设置migrating flag, node B调用cluster setslot importing设置importing flag  
(2) 调用migrate指令迁移所有该slot的数据到node B  
(3) 对两个节点使用cluster setslot node来消除importing和migrating flag, 并且设置槽位  
  
  
  
  
  
  
  
  
---------------------------------------------------------------------------------------------------------------------  
  
  
  
  
  
  
  
  
---------------------------------------------------------------------------------------------------------------------  
  
  
  
  
  
  
  
  
---------------------------------------------------------------------------------------------------------------------  
  
  
  
  
  
  
  
  
---------------------------------------------------------------------------------------------------------------------  
  
  
  
  
  
  
  
  
  
