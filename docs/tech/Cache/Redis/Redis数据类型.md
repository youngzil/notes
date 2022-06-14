# Redis数据类型


- [Redis的数据类型的实现是什么数据结构](#Redis的数据类型的实现是什么数据结构)
- [Redis支持七种数据类型的数据结构](#Redis支持七种数据类型的数据结构)
- [跳跃表(SkipList)的原理](#跳跃表(SkipList)的原理)
- [其他的4种特殊的数据类型](#其他的4种特殊的数据类型)



---------------------------------------------------------------------------------------------------------------------
## Redis的数据类型的实现是什么数据结构

目前Redis6.0官网上明确提出来的数据类型是9种
Redis provides data structures such as strings, hashes, lists, sets, sorted sets with range queries, bitmaps, hyperloglogs, geospatial indexes, and streams.

1. strings, 
2. hashes,
3. lists,
4. sets, 
5. sorted sets with range queries, 
6. bitmaps, 
7. hyperloglogs, 
8. geospatial indexes, and 
9. streams


实际确认了下，是7种：
0. String(字符串)
1. List(列表)
2. Set(集合)
3. Sorted Set(有序集合)
4. Hash(哈希)
5. module（一个特殊的对象）
6. Streams(流信息)

证据：
1、源码：t_(type)开头的，有且仅有6个：t_hash.c、t_list.c、t_set.c、t_stream.c、t_string.c、t_zset.c
2、type key命令查看key的类型：bitmaps和hyperloglogs是String，geospatial是zset，streams是stream
3、但是在源码server.h文件中有如下定义
```c++
/* The actual Redis Object */
#define OBJ_STRING 0    /* String object. */
#define OBJ_LIST 1      /* List object. */
#define OBJ_SET 2       /* Set object. */
#define OBJ_ZSET 3      /* Sorted set object. */
#define OBJ_HASH 4      /* Hash object. */
/* The "module" object type is a special one that signals that the object
* is one directly managed by a Redis module. In this case the value points
* to a moduleValue struct, which contains the object value (which is only
* handled by the module itself) and the RedisModuleType struct which lists
* function pointers in order to serialize, deserialize, AOF-rewrite and
* free the object.
*
* Inside the RDB file, module types are encoded as OBJ_MODULE followed
* by a 64 bit module type ID, which has a 54 bits module-specific signature
* in order to dispatch the loading to the right module, plus a 10 bits
* encoding version. */
#define OBJ_MODULE 5    /* Module object. */
#define OBJ_STREAM 6    /* Stream object. */

```


参考  





## Redis支持七种数据类型的数据结构
- String：字符串。byte 数组， 可以包含任何数据
- Hash：哈希，字典，二维结构：数组+链表，第一维度:数组，第二维度:链表，哈希表作为字典的底层实现，哈希表使用链表来解决键冲突问题
- List：列表，链表（双向链表）的实现
- Set：集合，通过 hash table 实现的
- Sorted Set（zset）：有序集合，Hash+跳跃表，在set的基础上增加了一个标识属性，它可以在set添加或修改元素时指定，每次指定，set会自动按标识调整顺序
- module
- stream



一、字符串
Redis使用C语言编写，但是Redis的字符串并没有直接使用C语言传统的字符串，而是自己构建了一种名为简单动态字符串的抽象类型SDS，其本质是个 byte 数组,可以包含任何数据，是二进制安全的。

常用命令：get、set、incr、decr、mget等。



二、字典
Redis使用哈希表作为字典的底层实现，每个字典都有两个哈希表，一个平时使用，另一个仅在进行rehash时使用
哈希表使用链表来解决键冲突问题，被分配到同一个索引上的多个键值对会连接成一个单向链表
redis存入hash结构时, key, hkey, hvalue 均不能为null

常用命令：hget,hset,hgetall 等



三、列表
Redis构建了自己的链表的实现，其特性如下：
1、双端：链表节点提供有prev和next对象,获取某个节点的前置节点和下一个节点的速度为O(1).
2、无环：表头节点prev对象和表尾节点next对象都指向NULL,链表的访问都是以NULL访问为终点.
3、带有表头和表尾对象：通过list结构的head和tail，获取表头和表尾对象的速度为O(1).
4、带有长度计数器：获取链表长度的直接读取len字段值.速度为O(1).
5、多态：通过dup、free、match三个方法,实现链表的多态,保存不同类型的值

list 列表是简单的字符串列表，按照插入顺序排序。你可以添加一个元素到列表的头部（左边）或者尾部（右边）。

常用命令：lpush（添加左边元素）,rpush,lpop（移除左边第一个元素）,rpop,lrange（获取列表片段，LRANGE key start stop）等。



四、集合

sorted sets with range queries
带范围查询的排序集合zset

Redis 集合是 string 类型的无序集合。set 元素最大可以包含(2 的 32 次方)个元素。set 是通过 hash table 实现的，hash table 会随着添加或者删除自动的调整大小。调整 hash table 大小时候需要同步(获取写锁)会阻塞其他读写操作。

常用命令：sadd,spop,smembers,sunion 等。



五、有序集合
有序集合(sorted set) 在set的基础上增加了一个标识属性，它可以在set添加或修改元素时指定，每次指定，set会自动按标识调整顺序，set的每一个元素都会关联一个double类型的score。使用时往往我们把要排序的字段作为score存储，对象id则作为元素存储

常用命令：zadd,zrange,zrem,zcard等

实现方式：Redis sorted set的内部使用HashMap和跳跃表(SkipList)来保证数据的存储和有序，HashMap里放的是成员到score的映射，而跳跃表里存放的是所有的成员，排序依据是HashMap里存的score,使用跳跃表的结构可以获得比较高的查找效率，并且在实现上比较简单。





六、module

Redis在4.0版本推出了 module 的形式，可以将 module 作为插件额外实现Redis的一些功能。官网推荐了一个 [RedisBloom](https://github.com/RedisBloom/RedisBloom) 作为 Redis 布隆过滤器的 Module。




七、Streams(流信息)：stream（Redis5.0提供一种建模日志用的全新数据结构）

Stream 是 Redis 5.0 版本引入的一个新的数据类型，支持消费者组，借鉴 Kafka 设计的支持多播的可持久化消息队列(支持 group，不支持 partition)。

Stream是Redis 5.0引入的一种新数据类型,是一个新的强大的支持多播的可持久化的消息队列。

相比于现有的PUB/SUB、BLOCKED LIST，其虽然也可以在简单的场景下作为消息队列来使用，但是Redis Stream无疑要完善很多。Redis Stream提供了消息的持久化和主备复制功能、新的RadixTree数据结构来支持更高效的内存使用和消息读取、甚至是类似于Kafka的Consumer Group功能。

它以更抽象的方式对日志数据结构进行建模，但是日志的本质仍然完好无损：像日志文件一样，通常实现为仅在追加模式下打开的文件， Redis流主要是仅追加数据结构。至少从概念上讲，由于Redis是流式传输在内存中表示的抽象数据类型，因此它们实现了更强大的操作，以克服日志文件本身的限制。

尽管数据结构本身非常简单，但Redis流却成为最复杂的Redis类型的原因在于它实现了其他非强制性功能：一组阻止操作，使消费者可以等待生产者将新数据添加到流中，此外还有一个称为“ 消费群体”的概念。

消费者群体最初是由流行的称为Kafka（TM）的消息传递系统引入的。Redis用完全不同的术语重新实现了一个类似的想法，但是目标是相同的：允许一组客户合作使用同一消息流的不同部分。

Redis stream使用场景：消息队列，和kafka, RocketMq ,RabbitMq等各种消息中间件要按照当前环境的情况和要求合理使用。

```
使用示例
> XADD mystream * sensor-id 1234 temperature 19.8
1518951480106-0

##上面对XADD命令的调用使用自动生成的条目ID 
##将一个条目添加sensor-id: 1234, temperature: 19.8到key流中mystream，该条目ID是该命令返回的，具体来说是1518951480106-0。
##它以键名作为第一个参数mystream，第二个参数是标识流中每个条目的条目ID。


## 获取Stream中的项目数：
> XLEN mystream
(integer) 1
```

[Introduction to Redis Streams](https://redis.io/topics/streams-intro)  
[Redis Stream教程](https://www.runoob.com/redis/redis-stream.html)




## 跳跃表(SkipList)的原理

想想你老家在世界地图中的位置：亚洲-->中国->安徽省->安庆市->枞阳县->汤沟镇->田间村->xxxx号，也是这样一个类似的结构。

「跳跃列表」之所以「跳跃」，是因为内部的元素可能「身兼数职」，比如上图中间的这个元素，同时处于L0、L1和L2层，可以快速在不同层次之间进行「跳跃」。

定位插入点时，先在顶层进行定位，然后下潜到下一级定位，一直下潜到最底层找到合适的位置，将新元素插进去。你也许会问那新插入的元素如何才有机会「身兼数职」呢？

跳跃列表采取一个随机策略来决定新元素可以兼职到第几层，首先L0层肯定是100%了，L1层只有50%的概率，L2层只有25%的概率，L3层只有12.5%的概率，一直随机到最顶层L31层。绝大多数元素都过不了几层，只有极少数元素可以深入到顶层。列表中的元素越多，能够深入的层次就越深，能进入到顶层的概率就会越大。

跳跃表的性质；
1、由很多层结构组成；
2、每一层都是一个有序的链表，排列顺序为由高层到底层，都至少包含两个链表节点，分别是前面的head节点和后面的nil节点；
3、最底层的链表包含了所有的元素；
4、如果一个元素出现在某一层的链表中，那么在该层之下的链表也全都会出现（上一层的元素是当前层的元素的子集）；
5、链表中的每个节点都包含两个指针，一个指向同一层的下一个链表节点，另一个指向下一层的同一个链表节点；


跳跃表搜索的基本原理:
其基本原理就是从最高层的链表节点开始，如果比当前节点要大,比当前层的下一个节点要小，那么则往下找，也就是和当前层的下一层的节点的下一个节点进行比较，以此类推，一直找到最底层的最后一个节点，如果找到则返回，反之则返回空。



参考  
[Redis实战 | 5种Redis数据类型详解](https://zhuanlan.zhihu.com/p/97893834)  
[redis的5种数据类型和数据结构](https://blog.csdn.net/shengqianfeng/article/details/82684354)  
[Redis的五种数据结构](https://www.jianshu.com/p/2f4609e0ec6e)  
[Redis常用数据类型介绍、使用场景及其操作命令](https://www.cnblogs.com/lizhenghn/p/5322887.html)  
[Redis几种数据类型及应用场景](https://juejin.cn/post/6844903951502934030)  
[redis key和value数据类型](https://www.cnblogs.com/youxin/p/3833817.html)  
[Redis 数据类型介绍](http://www.redis.cn/topics/data-types-intro.html)
[Redis中的五种数据类型使用场景](https://www.jianshu.com/p/d645cebff386)
[原来Redis常用的五种数据类型底层结构是这样的](https://segmentfault.com/a/1190000020770894)


[Redis命令](https://www.runoob.com/redis/redis-strings.html)  
[五种数据类型常用命令](https://www.huaweicloud.com/articles/6c54a6c801d89f4f21cb85b4aa5e4a31.html)  



---------------------------------------------------------------------------------------------------------------------
## 其他的4种特殊的数据类型


String(字符串)、List(列表)、Set(集合)、Sorted Set(有序集合)、Hash(哈希)、HyperLogLog(基数)、Bitmap(位集合)、Geospatial(地理空间索引)、Streams(流信息)

还有说还包括BloomFilter(布隆过滤器)
因为 BloomFilter 是 Redis 的扩展模块，所以需要额外下载，你可以使用 Docker 进行拉取。安装步骤我不做详细解释，你可以到它的github上学习怎么安装





### 特殊的4种数据类型的底层数据结构
1. HyperLogLog(基数)：String
2. Bitmap(位集合)：String
3. BloomFilter(布隆过滤器)：String（直接封装自Bitmap）
4. Geospatial(地理空间索引)：Sorted Set

注： Bitmap 和 HyperLogLog是基于String类型，但是拓展了自己的语义
HyperLogLog 底层也是 String 实现，与其说 HyperLogLog 是一种单独的数据类型，倒不如说是对 String 数据类型做 API 封装的应用程序。

Redis中的四种特殊的数据结构 bitmap，hyperLogLog，bloomFilter，GeoHash 。这四种数据结构其实有点类似于算法层面了，比如 GeoHash 其实就是一个 zset，bitmap 就是 string，只是使用的方法不同导致了更多的功能。

所以与其说是新的特殊的5种单独的数据类型，倒不如说是对5种基础的数据类型做的API封装的应用程序，
或者说是5种基础的数据类型的实际应用





### HyperLogLog(基数)：String

HyperLogLogs（计算基数用的一种数据结构）

会存在误差的数据结构HyperLogLog(基数)

Redis HyperLogLogs(HLL)属于一种概率算法，(LC,LLC,HLL)三种越来越节省内存，降低误差率。

HyperLogLog优点，在输入元素的数量或者体积非常大时。计算基数所需的空间总是固定很小的。每个HyperLogLog的键只需要花费12KB内存，在标准误差0.81%的前提下，就可以计算接近2^64个不同的基数。

用bitmap存储1一亿个统计数据大概需要12M内存；而在HLL中，只需要不到1K内存就能做到。

HyperLogLog只会根据输入元素来计算基数，而不会存储元素本身，所以不能返回各个元素。

HyperLogLog 计数较小时，采用稀疏矩阵存储，空间占用很小，计数超过了阈值时转变成稠密矩阵，占用 12KB 的空间。数据量大时性价比明显优于 set 结构。
一个 pf 项占用内存空间 12KB。
HyperLogLog 不储存元素本身，不能像 set 那样返回输入的元素。

HLL的使用场景：常用来统计一个集合中不重复的元素个数，例如网站PV，搜索关键词数量，数据分析、网络监控及数据库优化等领域。

HLL比 bitmap更节省内存，但有一定误差( 标准误差 0.81%)


PFADD key element [element ...] 添加指定元素到 HyperLogLog 中。
PFCOUNT key [key ...] 返回给定 HyperLogLog 的基数估算值。
PFMERGE destkey sourcekey [sourcekey ...] 将多个 HyperLogLog 合并为一个 HyperLogLog


[巧用 Redis Hyperloglog，轻松统计 UV 数据](https://segmentfault.com/a/1190000020523110)  
[Redis HyperLogLog](https://zhuanlan.zhihu.com/p/58358264)  
[Redis HyperLogLog 用于记录独立总数](https://blog.csdn.net/Leon_cx/article/details/82454724)  
[玩转Redis-HyperLogLog统计微博日活月活](https://my.oschina.net/zxiaofan/blog/4406700)  
[初识Redis的数据类型HyperLogLog](https://cloud.tencent.com/developer/article/1647119)  
[HyperLogLog&布隆过滤器](https://acuario.xyz/posts/redis-deep-adventure-hyperloglog-and-bloom-filter/)  
[Redis 中 HyperLogLog 讲解](https://www.huaweicloud.com/articles/4318da1b4433ab32b21e385dde2247d6.html)  
[初识Redis的数据类型HyperLogLog](https://www.cnblogs.com/throwable/p/13138554.html)  
[Redis应用-HyperLogLog](https://juejin.cn/post/6844903863095427085)  
[HyperLogLogs(HLL)的使用](https://segmentfault.com/a/1190000023719642)  

[Redis HyperLogLog命令](https://www.runoob.com/redis/redis-hyperloglog.html)  

[走近源码：神奇的HyperLogLog](https://jackeyzhe.github.io/2019/02/26/%E8%B5%B0%E8%BF%91%E6%BA%90%E7%A0%81%EF%BC%9A%E7%A5%9E%E5%A5%87%E7%9A%84HyperLogLog/)  
[神奇的HyperLoglog解决统计问题](https://www.wmyskxz.com/2020/03/02/reids-4-shen-qi-de-hyperloglog-jie-jue-tong-ji-wen-ti/)  






### Bitmap(位集合)：String

[Bitmap介绍](Bitmap介绍.md)

BitMap位图

位图不是实际的数据类型，而是在String类型上定义的一组面向位的操作。

由于字符串是二进制安全的，最大长度是512MB,转换成位可以设置 2^32不同的位。

512MB = 2^9 * 2^3（byte） * 2^10（kb） * 2^10(mb) = 2^32（bit）

位图的最大优点之一，存储信息时可以节省大量空间。


基本命令使用
setbit key index 0/1 设置某位的值
getbit key index 获取某位的值
bitcount key start end 获取指定范围内为1的数量




### BloomFilter(布隆过滤器)：String（直接封装自Bitmap）

因为 BloomFilter 是 Redis 的扩展模块，所以需要额外下载，你可以使用 Docker 进行拉取。安装步骤我不做详细解释，你可以到它的github上学习怎么安装

Redis在4.0版本推出了 module 的形式，可以将 module 作为插件额外实现Redis的一些功能。官网推荐了一个 [RedisBloom](https://github.com/RedisBloom/RedisBloom) 作为 Redis 布隆过滤器的 Module。

Java 语言的话，RedisBloom项目里有实现 [JReBloom](https://github.com/RedisBloom/JRedisBloom)


安装完之后我们就可以愉快的使用啦。
    bf.add key element 添加元素到布隆过滤器
    bf.exists key element 判断元素是否在布隆过滤器
    bf.madd key element1 element2 ... 批量添加，添加多个元素到布隆过滤器，bf.add只能添加一个
    bf.mexists key element1 element2 ... 批量判断，判断多个元素是否在布隆过滤器


[Redis 高级主题之布隆过滤器(BloomFilter)](https://juejin.cn/post/6844903862072000526)  
[Redis 之布隆过滤器(BloomFilter)](https://www.huaweicloud.com/articles/72b42fac496bb2bfbfcd1d931d7506a1.html)  
[RedisBloom: Probabilistic Data Structures for Redis ](https://oss.redislabs.com/redisbloom/)  
[Redis Bloom Filters : Design for large scale uniqueness verification](https://icircuit.net/redis-bloom-filters-design-for-large-scale-uniqueness-verification/3050)  
 
[BloomFilter基于redis的实现](https://www.jianshu.com/p/cae51ad2486c)
[基于Redis的BloomFilter实现](https://segmentfault.com/a/1190000017370384)  
[A distributed bloom filter implementation based on redis](https://github.com/taganaka/redis-bloomfilter)





### Geospatial(地理空间索引)：Sorted Set

Redis Geospatial Indexes(地理空间索引)

GeoHash 常用来计算 附近的人，附近的商店。

在Redis最新的3.2版本中加入了地理空间(geospatial)以及索引半径查询的功能，这在需要地理位置的应用上或许可以一展身手

将制定的地理空间位置(经度、纬度、名称)添加到指定的key中。这些数据将会存储到Sorted set中。目的是为了方便GEORADIUS或者GEORADIUSBYMEMBER命令对数据进行半径查询等操作。

sorted set使用一种称为Geohash的技术进行填充。经度和纬度的位是交错的，以形成一个独特的52位整数. 我们知道，一个sorted set 的double score可以代表一个52位的整数，而不会失去精度。

这种格式允许半径查询检查的1 + 8个领域需要覆盖整个半径，并丢弃元素以外的半径。通过计算该区域的范围，通过计算所涵盖的范围，从不太重要的部分的排序集的得分，并计算得分范围为每个区域的sorted set中的查询。

Geospatial indexes使用场景：这里假设地球是一个球体，因为使用的距离公式是Haversine公式。这个公式仅适用于地球，而不是一个完美的球体。当在社交网站和其他大多数需要查询半径的应用中使用时，这些偏差都不算问题。但是，在最坏的情况下的偏差可能是0.5%，所以一些地理位置很关键的应用还是需要谨慎考虑。

基本命令和使用实战
    geoadd key longitude latitude element(后面可配置多个三元组) 添加元素
    geodist key element1 element2 unit 计算两个元素的距离
    geopos key element [element] 获取元素的位置
    geohash key element 获取元素hash
    georadiusbymember key element distanceValue unit count countValue ASC/DESC [withdist] [withhash] [withcoord] 获取元素附近的元素 可附加后面选项[距离][hash][坐标]
    georadius key longitude latitude distanceValue unit count countValue ASC/DESC [withdist] [withhash] [withcoord] 和上面一样只是元素改成了指定坐标值


官方示例
```
## 增加意大利西西里岛的两个城市坐标(Palermo和 卡塔尼亚)
redis> GEOADD Sicily 13.361389 38.115556 "Palermo" 15.087269 37.502669 "Catania"
(integer) 2

## 返回两个给定位置之间的距离。(默认单位米)
redis> GEODIST Sicily Palermo Catania
"166274.1516"

## 以给定的经纬度为中心，返回键包含的位置元素当中， 与中心的距离不超过给定最大距离的所有位置元素。
## 100m
redis> GEORADIUS Sicily 15 37 100 km
1) "Catania"

## 200m
redis> GEORADIUS Sicily 15 37 200 km
1) "Palermo"
2) "Catania"

```

[Redis地理空间(geospatial)介绍和简单使用](https://blog.csdn.net/zhang197093/article/details/72979038)  
[]()



参考  
[Redis5.0支持的九种数据类型及使用场景整理（Redis学习笔记）](https://www.deathearth.com/1341.html)  
[Redis不是只有5种基本数据类型？](https://developer.51cto.com/art/201911/605731.htm)  
[]()  
[]()  



---------------------------------------------------------------------------------------------------------------------






