- [分布式ID的生成方案](#分布式ID的生成方案)

# 分布式ID生成服务

---------------------------------------------------------------------------------------------------------------------

## 分布式ID的生成方案

分布式ID的生成方案：分段
1. 数据库自增长序列或字段：第一种方案仍然还是基于数据库的自增ID，需要单独使用一个数据库实例，在这个实例中新建一个单独的表
2. 号段模式：我们可以使用号段的方式来获取自增ID，号段可以理解成批量获取，比如DistributIdService从数据库获取ID时，如果能批量获取多个ID并缓存在本地的话，那样将大大提供业务应用获取ID的效率。
3. Redis生成ID：可以用Redis的原子操作 INCR和INCRBY来实现，可以利用Redis中的incr命令来实现原子性的自增与返回
4. UUID
5. Twitter的snowflake雪花算法：snowflake是twitter开源的分布式ID生成算法，是一种算法，所以它和上面的三种生成分布式ID机制不太一样，它不依赖数据库。核心思想是：分布式ID固定是一个long型的数字，一个long型占8个字节，也就是64个bit，原始snowflake算法中对于bit的分配如下图
6. 其他框架  
    [百度（uid-generator）](https://github.com/baidu/uid-generator/blob/master/README.zh_cn.md) ：uid-generator使用的就是snowflake，只是在生产机器id，也叫做workId时有所不同。  
    [美团（Leaf）](https://github.com/Meituan-Dianping/Leaf) ：美团的Leaf也是一个分布式ID生成框架。它非常全面，即支持号段模式，也支持snowflake模式。  
    [滴滴Tinyid](https://github.com/didi/tinyid/wiki)  


分布式ID：
1、UUID
2、使用每个应用分一段序列号，请求的时候一次请求一段放在本地待使用，Zookeeper记录最大的Id
3、主要思路采用了MySQL自增长ID的机制(auto_increment + replace into)，以MySQL举例，利用给字段设置 auto_increment_increment 和 auto_increment_offset 来保证ID自增，每次业务使用下列SQL读写MySQL得到ID号。
4、CenterCode+AppCode+使用Redis的原子操作 INCR和INCRBY，
5、类snowflake方案：这种方案生成一个64bit的数字，64bit被划分成多个段，分别表示时间戳、机器编码、序号。 
6、TDDL序列生成方式：按应用进行每次一个步长的增长，步长变动可以使用Zookeeper来通知



参考  
[大型互联网公司分布式ID方案总结](https://juejin.im/post/6844903935296176141)




---------------------------------------------------------------------------------------------------------------------
https://www.jianshu.com/p/9d7ebe37215e
https://tech.meituan.com/2017/04/21/mt-leaf.html
https://www.cnblogs.com/haoxinyue/p/5208136.html
https://github.com/beyondfengyu/SnowFlake


https://mp.weixin.qq.com/s?__biz=MzAxNjM2MTk0Ng==&mid=2247489245&idx=3&sn=0205f0fd8c9aa03fc8d84b4f3a176b57&scene=21#wechat_redirect


分布式主键

1. 数据库自增长序列或字段
2. UUID
3. Redis生成ID：可以用Redis的原子操作 INCR和INCRBY来实现。
4. Twitter的snowflake算法：snowflake是Twitter开源的分布式ID生成算法，结果是一个long型的ID。其核心思想是：使用41bit作为毫秒数，10bit作为机器的ID（5个bit是数据中心，5个bit的机器ID），12bit作为毫秒内的流水号（意味着每个节点在每毫秒可以产生 4096 个 ID），最后还有一个符号位，永远是0。具体实现的代码可以参看https://github.com/twitter/snowflake。



www.toutiao.com/i6682672464708764174  
分布式ID的生成方案

唯一ID的特性：
1、整个系统ID唯一
2、ID是数字类型，而且是趋势递增的
3、ID简短，查询效率快


1、UUID
2、MySQL主键自增
3、雪花snowflake算法
4、Redis生成方案



分布式ID的生成方案：分段
1. 数据库自增长序列或字段
2. Redis生成ID：可以用Redis的原子操作 INCR和INCRBY来实现。
3. UUID
4. Twitter的snowflake雪花算法
5、其他框架
美团 Leaf
滴滴 Tinyid
百度 UidGenerator


1、UUID

优点：
代码实现简单。
本机生成，没有性能问题
因为是全球唯一的ID，所以迁移数据容易

缺点：
每次生成的ID是无序的，无法保证趋势递增
UUID的字符串存储，查询效率慢
存储空间大
ID本事无业务含义，不可读

应用场景：
类似生成token令牌的场景
不适用一些要求有趋势递增的ID场景


2、MySQL主键自增：这个方案就是利用了MySQL的主键自增auto_increment，默认每次ID加1。

优点：
数字化，id递增
查询效率高
具有一定的业务可读

缺点：
存在单点问题，如果mysql挂了，就没法生成iD了
数据库压力大，高并发抗不住


3、MySQL多实例主键自增：这个方案就是解决mysql的单点问题，在auto_increment基本上面，设置step步长
每台的初始值分别为1,2,3...N，步长为N（这个案例步长为4）
可以自行定义max_id的起点，和step步长，保存在在数据库中，每次业务请求都去请求一段数据【max_id + 1，max_id+step】区间的ID保存在JVM本地缓存中
多个节点请求同一个业务的ID，可以使用事务的方式，把查询和更新max_id放在一个事务中
步长是可以随时修改的
因为会有一个线程，会观察什么时候去自动获取。两个buffer之间自行切换使用。就解决了突发阻塞的问题。


优点：
解决了单点问题

缺点：
一旦把步长定好后，就无法扩容；
而且单个数据库的压力大，数据库自身性能无法满足高并发

应用场景：
数据不需要扩容的场景



4、雪花snowflake算法
这个算法网上介绍了很多，老顾这里就不详细介绍。雪花算法生成64位的二进制正整数，然后转换成10进制的数。64位二进制数由如下部分组成：
1位标识符：始终是0
41位时间戳：41位时间截不是存储当前时间的时间截，而是存储时间截的差值（当前时间截 - 开始时间截 )得到的值，这里的的开始时间截，一般是我们的id生成器开始使用的时间，由我们程序来指定的
10位机器标识码：可以部署在1024个节点，如果机器分机房（IDC）部署，这10位可以由 5位机房ID + 5位机器ID 组成
12位序列：毫秒内的计数，12位的计数顺序号支持每个节点每毫秒(同一机器，同一时间截)产生4096个ID序号

优点：
此方案每秒能够产生409.6万个ID，性能快
时间戳在高位，自增序列在低位，整个ID是趋势递增的，按照时间有序递增
灵活度高，可以根据业务需求，调整bit位的划分，满足不同的需求

缺点：
依赖机器的时钟，如果服务器时钟回拨，会导致重复ID生成
在分布式场景中，服务器时钟回拨会经常遇到，一般存在10ms之间的回拨；小伙伴们就说这点10ms，很短可以不考虑吧。但此算法就是建立在毫秒级别的生成方案，一旦回拨，就很有可能存在重复ID。


5、Redis生成方案
利用redis的incr原子性操作自增，一般算法为：
年份 + 当天距当年第多少天 + 天数 + 小时 + redis自增

优点：
有序递增，可读性强

缺点：
占用带宽，每次要向redis进行请求
每次都要去Redis去请求，有网络请求耗时，并发强依赖了Redis。这个设计是有风险的，一旦Redis挂了，整个系统不可用。                       
考虑到ID安全性的问题，如：Redis方案中，用户是可以预测下一个ID号是多少，因为算法是递增的。

---------------------------------------------------------------------------------------------------------------------
Leaf——美团点评分布式ID生成系统  
美团 Leaf：  
https://github.com/Meituan-Dianping/Leaf  
https://github.com/zhuzhong/idleaf  
https://tech.meituan.com/2019/03/07/open-source-project-leaf.html  
https://tech.meituan.com/2017/04/21/mt-leaf.html  
  
滴滴 Tinyid  
https://github.com/didi/tinyid  
  
百度 UidGenerator  
https://github.com/baidu/uid-generator  
  
  
分布式ID的实现方式：  
https://www.iteye.com/blog/uule-2420466  
https://mp.weixin.qq.com/s?__biz=MzAxNjM2MTk0Ng==&mid=2247489245&idx=3&sn=0205f0fd8c9aa03fc8d84b4f3a176b57&scene=21#wechat_redirect  
  
  
  

Twitter的snowflake雪花算法
最新的
https://twitter.github.io/twitter-server/
https://github.com/twitter/twitter-server

老的2010版本，已经淘汰了Snowflake的初始版本，已经迁移到twitter-server项目了
https://github.com/twitter-archive/snowflake/releases

参考  
https://www.kutu66.com/GitHub/article_103050  
https://github.com/zhongxunking/idcenter  
https://cloud.tencent.com/developer/article/1533454  






