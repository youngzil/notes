redis 和 memcached

redis持久化
rdb aof

---------------------------------------------------------------------------------------------------------------------

1、
/Users/yangzl/git/quickstart-cache/quickstart-memcached/README.md
/Users/yangzl/git/quickstart-cache/quickstart-redis/doc/redis学习.md

2、Redis和Memcached的区别

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









