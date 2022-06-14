- [Redis集群规范](#Redis集群规范)
- [Redis集群选举原理](#Redis集群选举原理)
- [集群选举原理分析](#集群选举原理分析)
- [Redis哨兵模式选举机制](#Redis哨兵模式选举机制)
- [Redis集群方案对比](#Redis集群方案对比)





---------------------------------------------------------------------------------------------------------------------

## Redis集群规范
[Redis集群规范](https://redis.io/topics/cluster-spec/)  
[Redis集群介绍](https://redis.io/topics/cluster-tutorial)


[Redis集群规范中文版](http://www.redis.cn/topics/cluster-spec.html)












---------------------------------------------------------------------------------------------------------------------
## Redis集群选举原理


在redis 3.0版本后，官方推出了redis cluster 分布式解决方案，当一个redis节点挂了可以快速地切换到另一个节点。当遇到单机内存、并发等瓶颈时，可以采用分布式方案要解决问题.

在cluster架构下，默认的，一般redis-master用于接收读写，而redis-slave则用于备份，当有请求是在向slave发起时，会直接重定向到对应key所在的master来处理。
但如果不介意读取的是redis-cluster中有可能过期的数据并且对写请求不感兴趣时，则亦可通过readonly命令，将slave设置成可读，然后通过slave获取相关的key，达到读写分离。



其过程如下：
1.slave发现自己的master变为FAIL
2.发起选举前，slave先给自己的epoch（即currentEpoch）增一，然后请求其它master给自己投票。slave是通过广播FAILOVER_AUTH_REQUEST包给集中的每一个masters。
3.slave发起投票后，会等待至少两倍NODE_TIMEOUT时长接收投票结果，不管NODE_TIMEOUT何值，也至少会等待2秒。
4.master接收投票后给slave响应FAILOVER_AUTH_ACK，并且在（NODE_TIMEOUT*2）时间内不会给同一master的其它slave投票。
5.如果slave收到FAILOVER_AUTH_ACK响应的epoch值小于自己的epoch，则会直接丢弃。一旦slave收到多数master的FAILOVER_AUTH_ACK，则声明自己赢得了选举。
6.如果slave在两倍的NODE_TIMEOUT时间内（至少2秒）未赢得选举，则放弃本次选举，然后在四倍NODE_TIMEOUT时间（至少4秒）后重新发起选举。



Redis集群选举原理：

redis集群是由一系列的主从节点群组成的分布式服务器群，它具有复制、高可用和分片特性。
Redis集群不需要 sentinel哨兵也能完成节点移除和故障转移的功能。
需要将每个节点设置成集群模式，这种集群模式没有中心节点，客户端通过CRC16算法对key进行hash得到一个值，来判断该key存储在哪个主从服务上面，因此就算是某一个主从整个宕机，redis集群也是部分可用的。
方便水平扩展，可以根据业务规模可以随时加减配置。据官方文档称可以线性扩展到上万个节点(但是官方推荐不超过1000个节点)。
redis集群的性能和高可用性均优于哨兵模式。


### 集群选举原理分析

选举流程：原理分析：
当slave发现自己的master变为FAIL状态时，便尝试进行Failover，以期成为新的master。由于挂掉的master可能会有多个slave，从而存在多个slave竞争成为master节点的过程， 其过程如下：
1.slave发现自己的master变为FAIL
2.将自己记录的集群currentEpoch加1，并广播FAILOVER_AUTH_REQUEST信息
3.其他节点收到该信息，只有master响应，判断请求者的合法性，并发送FAILOVER_AUTH_ACK，对每一个epoch只发送一次ack
4.尝试failover的slave收集FAILOVER_AUTH_ACK
5.超过半数后变成新Master
6.广播Pong通知其他集群节点。


从节点并不是在主节点一进入 FAIL 状态就马上尝试发起选举，而是有一定延迟，一定的延迟确保我们等待FAIL状态在集群中传播，slave如果立即尝试选举，其它masters或许尚未意识到FAIL状态，可能会拒绝投票

延迟计算公式：
DELAY = 500ms + random(0 ~ 500ms) + SLAVE_RANK * 1000ms
1
SLAVE_RANK表示此slave已经从master复制数据的总量的rank。Rank越小代表已复制的数据越新。这种方式下，持有最新数据的slave将会首先发起选举（理论上）。

补充之前的一个问题：

跳转重定位
当客户端向一个错误的节点发出了指令，该节点会发现指令的 key 所在的槽位并不归自己管理，这时它会向客户端发送一个特殊的跳转指令携带目标操作的节点地址，告诉客户端去连这个节点去获取数据。客户端收到指令后除了跳转到正确的节点上去操作，还会同步更新纠正本地的槽位映射表缓存，后续所有 key 将使用新的槽位映射表。


前面说到这种分片的集群模式的集群可以部分提供服务， 当 redis.conf的配置cluster-require-full-coverage为no时， 表示当一个小主从整体挂掉的时候集群也可以用，也是说 0-16383个槽位中，落在该主从对应的slots上面的key是用不了的，但是如果key落在其他的范围是仍然可用的。






Redis集群选举原理
https://www.cnblogs.com/nijunyang/p/12508098.html
https://www.cnblogs.com/sunBinary/p/12433500.html
https://blog.csdn.net/lzj3462144/article/details/71023725
https://www.jianshu.com/p/e6894713a6d5
https://stor.51cto.com/art/202004/614940.htm
https://baijiahao.baidu.com/s?id=1662783818493463629&wfr=spider&for=pc



---------------------------------------------------------------------------------------------------------------------

## Redis哨兵模式选举机制

哨兵模式中如果主从中master宕机了，是通过哨兵来选举出新的master，在这个选举切换主从的过程，整个redis服务是不可用的。
而且哨兵模式中只有一个主节点对外提供服务，因此没法支持更高的并发。
而且当个主节点的内存设置也不宜过大。否则会导致持久化文件过大，影响数据恢复或主从同步的效率。




[redis集群选举机制](https://blog.csdn.net/sz85850597/article/details/86751215)






---------------------------------------------------------------------------------------------------------------------
## Redis集群方案对比


Redis的主要集群方案可以分为：
1. 客户端分片
2. 基于代理的分片（Twemproxy, codis）
3. 路由查询（Redis Cluster-官方实现）



A fast, light-weight proxy for memcached and redis
[Twemproxy Github地址](https://github.com/twitter/twemproxy)



Redis的几种使用方式包括：
- Redis 单副本
- Redis 多副本(主从)
- Redis Sentinel(哨兵)
- Redis Cluster
- Redis 自研



参考  
[Redis集群最全方案对比【包括高可用等】](https://blog.csdn.net/fenglei0415/article/details/83757634)  
[Redis集群方案比较](https://my.oschina.net/xiaominmin/blog/1618740)


---------------------------------------------------------------------------------------------------------------------









