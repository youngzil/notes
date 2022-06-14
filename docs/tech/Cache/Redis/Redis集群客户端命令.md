# Redis集群客户端命令


- [Key（键）](#Key（键）)  
- [String（字符串）](#String（字符串）)  
- [Hash（哈希表）](#Hash（哈希表）)  
- [List（列表）](#List（列表）)  
- [Set（集合）](#Set（集合）)  
- [SortedSet（有序集合）](#SortedSet（有序集合）)  
- [Pub/Sub（发布/订阅）](#Pub/Sub（发布/订阅）)  
- [Transaction（事务）](#Transaction（事务）)  




- [1、Redis键(key)命令](#1、Redis键(key)命令)  
- [2、Redis字符串(String)命令](#2、Redis字符串(String)命令)  
- [3、Redis哈希(Hash)命令](#3、Redis哈希(Hash)命令)
- [4、Redis列表(List)命令](#4、Redis列表(List)命令)
- [5、Redis集合(Set)命令](#5、Redis集合(Set)命令)
- [6、Redis有序集合(sorted set)命令](#6、Redis有序集合(sorted set)命令)
- [7、Redis发布订阅命令](#7、Redis发布订阅命令)
- [8、Redis事务命令](#8、Redis事务命令)
- [9、Redis脚本命令](#9、Redis脚本命令)
- [10、Redis连接命令](#10、Redis连接命令)
- [11、Redis服务器命令](#11、Redis服务器命令)
- [12、Redis地理位置(geo)命令](#12、Redis地理位置(geo)命令)
- [13、Redis HyperLogLog命令](#13、Redis-HyperLogLog命令)




---------------------------------------------------------------------------------------------------------------------

Key（键）、String（字符串）、Hash（哈希表）、List（列表）、Set（集合）、SortedSet（有序集合）、Pub/Sub（发布/订阅）、Transaction（事务）


## Key（键）
DEL、EXISTS、Expire、Keys、TTL（Pttl毫秒）、Rename、Renamenx


## String（字符串）
SET、Get、Del、Setex、Setnx、Incr、Decr、Decrby、Append


## Hash（哈希表）
Hdel、Hget、Hgetall、Hset、Hsetnx、Hlen


##List（列表）
Lset、Lrem、Lindex、Lpop、Lpush、Rpop、Rpush、、Blpop、Brpop


## Set（集合）
Sadd、Srem、Sscan、Spop、Smove


## SortedSet（有序集合）
Zadd、Zrem、Zscan、、



## Pub/Sub（发布/订阅）
Publish、Subscribe、Unsubscribe


## Transaction（事务）
Multi、Exec、Discard、


---------------------------------------------------------------------------------------------------------------------

三、集群客户端命令（redis-cli -c -p port）


Key（键）、String（字符串）、Hash（哈希表）、List（列表）、Set（集合）、SortedSet（有序集合）、Pub/Sub（发布/订阅）、Transaction（事务）

http://doc.redisfans.com/
http://www.redis.net.cn/order/


## Redis连接相关的一些基本命令

下表列出了与Redis连接相关的一些基本命令。
序号	命令	说明
1	AUTH password	使用给定的密码验证服务器
2	ECHO message	打印给定的字符串信息
3	PING	检查服务器是否正在运行
4	QUIT	关闭当前连接
5	SELECT index	更改当前连接的所选数据库




## Redis集群相关的命令

```
集群
cluster info ：打印集群的信息
cluster nodes ：列出集群当前已知的所有节点（ node），以及这些节点的相关信息。
节点
cluster meet <ip> <port> ：将 ip 和 port 所指定的节点添加到集群当中，让它成为集群的一份子。
cluster forget <node_id> ：从集群中移除 node_id 指定的节点。
cluster replicate <node_id> ：将当前节点设置为 node_id 指定的节点的从节点。
cluster saveconfig ：将节点的配置文件保存到硬盘里面。
槽(slot)
cluster addslots <slot> [slot ...] ：将一个或多个槽（ slot）指派（ assign）给当前节点。
cluster delslots <slot> [slot ...] ：移除一个或多个槽对当前节点的指派。
cluster flushslots ：移除指派给当前节点的所有槽，让当前节点变成一个没有指派任何槽的节点。
cluster setslot <slot> node <node_id> ：将槽 slot 指派给 node_id 指定的节点，如果槽已经指派给
另一个节点，那么先让另一个节点删除该槽>，然后再进行指派。
cluster setslot <slot> migrating <node_id> ：将本节点的槽 slot 迁移到 node_id 指定的节点中。
cluster setslot <slot> importing <node_id> ：从 node_id 指定的节点中导入槽 slot 到本节点。
cluster setslot <slot> stable ：取消对槽 slot 的导入（ import）或者迁移（ migrate）。
键
cluster keyslot <key> ：计算键 key 应该被放置在哪个槽上。
cluster countkeysinslot <slot> ：返回槽 slot 目前包含的键值对数量。
cluster getkeysinslot <slot> <count> ：返回 count 个 slot 槽中的键  
```




## 1、Redis键(key)命令,与键相关的一些基本命令

```
命令	描述
Redis DEL 命令	该命令用于在 key 存在是删除 key。
Redis Dump 命令	序列化给定 key ，并返回被序列化的值。
Redis EXISTS 命令	检查给定 key 是否存在。
Redis Expire 命令	seconds 为给定 key 设置过期时间。
Redis Expireat 命令	EXPIREAT 的作用和 EXPIRE 类似，都用于为 key 设置过期时间。 不同在于 EXPIREAT 命令接受的时间参数是 UNIX 时间戳(unix timestamp)。
Redis PEXPIREAT 命令	设置 key 的过期时间亿以毫秒计。
Redis PEXPIREAT 命令	设置 key 过期时间的时间戳(unix timestamp) 以毫秒计
Redis Keys 命令	查找所有符合给定模式( pattern)的 key 。
Redis Move 命令	将当前数据库的 key 移动到给定的数据库 db 当中。
Redis PERSIST 命令	移除 key 的过期时间，key 将持久保持。
Redis Pttl 命令	以毫秒为单位返回 key 的剩余的过期时间。
Redis TTL 命令	以秒为单位，返回给定 key 的剩余生存时间(TTL, time to live)。
Redis RANDOMKEY 命令	从当前数据库中随机返回一个 key 。
Redis Rename 命令	修改 key 的名称
Redis Renamenx 命令	仅当 newkey 不存在时，将 key 改名为 newkey 。
Redis Type 命令	返回 key 所储存的值的类型。
```
```
下表列出了与键相关的一些基本命令。
编号	命令	描述
1	DEL key	此命令删除一个指定键(如果存在)。
2	DUMP key	此命令返回存储在指定键的值的序列化版本。
3	EXISTS key	此命令检查键是否存在。
4	EXPIRE key seconds	设置键在指定时间秒数之后到期/过期。
5	EXPIREAT key timestamp	设置在指定时间戳之后键到期/过期。这里的时间是Unix时间戳格式。
6	PEXPIRE key milliseconds	设置键的到期时间(以毫秒为单位)。
7	PEXPIREAT key milliseconds-timestamp	以Unix时间戳形式来设置键的到期时间(以毫秒为单位)。
8	KEYS pattern	查找与指定模式匹配的所有键。
9	MOVE key db	将键移动到另一个数据库。
10	PERSIST key	删除指定键的过期时间，得永生。
11	PTTL key	获取键的剩余到期时间。
12	RANDOMKEY	从Redis返回一个随机的键。
13	RENAME key newkey	更改键的名称。
14	PTTL key	获取键到期的剩余时间(以毫秒为单位)。
15	RENAMENX key newkey	如果新键不存在，重命名键。
16	TYPE key	返回存储在键中的值的数据类型。

```


## 2、Redis字符串(String)命令,用于在Redis中管理字符串String的基本命令
```
命令	描述
Redis SET 命令	设置指定 key 的值
Redis Get 命令	获取指定 key 的值。
Redis Getrange 命令	返回 key 中字符串值的子字符
Redis Getset 命令	将给定 key 的值设为 value ，并返回 key 的旧值(old value)。
Redis Getbit 命令	对 key 所储存的字符串值，获取指定偏移量上的位(bit)。
Redis Mget 命令	获取所有(一个或多个)给定 key 的值。
Redis Setbit 命令	对 key 所储存的字符串值，设置或清除指定偏移量上的位(bit)。
Redis Setex 命令	将值 value 关联到 key ，并将 key 的过期时间设为 seconds (以秒为单位)。
Redis Setnx 命令	只有在 key 不存在时设置 key 的值。
Redis Setrange 命令	用 value 参数覆写给定 key 所储存的字符串值，从偏移量 offset 开始。
Redis Strlen 命令	返回 key 所储存的字符串值的长度。
Redis Mset 命令	同时设置一个或多个 key-value 对。
Redis Msetnx 命令	同时设置一个或多个 key-value 对，当且仅当所有给定 key 都不存在。
Redis Psetex 命令	这个命令和 SETEX 命令相似，但它以毫秒为单位设置 key 的生存时间，而不是像 SETEX 命令那样，以秒为单位。
Redis Incr 命令	将 key 中储存的数字值增一。
Redis Incrby 命令	将 key 所储存的值加上给定的增量值（increment） 。
Redis Incrbyfloat 命令	将 key 所储存的值加上给定的浮点增量值（increment） 。
Redis Decr 命令	将 key 中储存的数字值减一。
Redis Decrby 命令	key 所储存的值减去给定的减量值（decrement） 。
Redis Append 命令	如果 key 已经存在并且是一个字符串， APPEND 命令将 value 追加到 key 原来的值的末尾。
```
```
下表列出了一些用于在Redis中管理字符串String的基本命令。
编号	命令	描述说明
1	SET key value	此命令设置指定键的值。
2	GET key	获取指定键的值。
3	GETRANGE key start end	获取存储在键上的字符串的子字符串。
4	GETSET key value	设置键的字符串值并返回其旧值。
5	GETBIT key offset	返回在键处存储的字符串值中偏移处的位值。
6	MGET key1 [key2..]	获取所有给定键的值
7	SETBIT key offset value	存储在键上的字符串值中设置或清除偏移处的位
8	SETEX key seconds value	使用键和到期时间来设置值
9	SETNX key value	设置键的值，仅当键不存在时
10	SETRANGE key offset value	在指定偏移处开始的键处覆盖字符串的一部分
11	STRLEN key	获取存储在键中的值的长度
12	MSET key value [key value …]	为多个键分别设置它们的值
13	MSETNX key value [key value …]	为多个键分别设置它们的值，仅当键不存在时
14	PSETEX key milliseconds value	设置键的值和到期时间(以毫秒为单位)
15	INCR key	将键的整数值增加1
16	INCRBY key increment	将键的整数值按给定的数值增加
17	INCRBYFLOAT key increment	将键的浮点值按给定的数值增加
18	DECR key	将键的整数值减1
19	DECRBY key decrement	按给定数值减少键的整数值
20	APPEND key value	将指定值附加到键
```



## 3、Redis哈希(Hash)命令,与哈希/散列Hash相关的一些基本命令
```
命令	描述
Redis Hdel 命令	删除一个或多个哈希表字段
Redis Hexists 命令	查看哈希表 key 中，指定的字段是否存在。
Redis Hget 命令	获取存储在哈希表中指定字段的值/td>
Redis Hgetall 命令	获取在哈希表中指定 key 的所有字段和值
Redis Hincrby 命令	为哈希表 key 中的指定字段的整数值加上增量 increment 。
Redis Hincrbyfloat 命令	为哈希表 key 中的指定字段的浮点数值加上增量 increment 。
Redis Hkeys 命令	获取所有哈希表中的字段
Redis Hlen 命令	获取哈希表中字段的数量
Redis Hmget 命令	获取所有给定字段的值
Redis Hmset 命令	同时将多个 field-value (域-值)对设置到哈希表 key 中。
Redis Hset 命令	将哈希表 key 中的字段 field 的值设为 value 。
Redis Hsetnx 命令	只有在字段 field 不存在时，设置哈希表字段的值。
Redis Hvals 命令	获取哈希表中所有值
```
```
下表列出了与哈希/散列Hash相关的一些基本命令。
序号	命令	说明
1	HDEL key field2 [field2]	删除一个或多个哈希字段。
2	HEXISTS key field	判断是否存在散列字段。
3	HGET key field	获取存储在指定键的哈希字段的值。
4	HGETALL key	获取存储在指定键的哈希中的所有字段和值
5	HINCRBY key field increment	将哈希字段的整数值按给定数字增加
6	HINCRBYFLOAT key field increment	将哈希字段的浮点值按给定数值增加
7	HKEYS key	获取哈希中的所有字段
8	HLEN key	获取散列中的字段数量
9	HMGET key field1 [field2]	获取所有给定哈希字段的值
10	HMSET key field1 value1 [field2 value2 ]	为多个哈希字段分别设置它们的值
11	HSET key field value	设置散列字段的字符串值
12	HSETNX key field value	仅当字段不存在时，才设置散列字段的值
13	HVALS key	获取哈希中的所有值

```

## 4、Redis列表(List)命令,与列表List相关的一些基本命令
```
命令	描述
Redis Blpop 命令	移出并获取列表的第一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。
Redis Brpop 命令	移出并获取列表的最后一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。
Redis Brpoplpush 命令	从列表中弹出一个值，将弹出的元素插入到另外一个列表中并返回它； 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。
Redis Lindex 命令	通过索引获取列表中的元素
Redis Linsert 命令	在列表的元素前或者后插入元素
Redis Llen 命令	获取列表长度
Redis Lpop 命令	移出并获取列表的第一个元素
Redis Lpush 命令	将一个或多个值插入到列表头部
Redis Lpushx 命令	将一个或多个值插入到已存在的列表头部
Redis Lrange 命令	获取列表指定范围内的元素
Redis Lrem 命令	移除列表元素
Redis Lset 命令	通过索引设置列表元素的值
Redis Ltrim 命令	对一个列表进行修剪(trim)，就是说，让列表只保留指定区间内的元素，不在指定区间之内的元素都将被删除。
Redis Rpop 命令	移除并获取列表最后一个元素
Redis Rpoplpush 命令	移除列表的最后一个元素，并将该元素添加到另一个列表并返回
Redis Rpush 命令	在列表中添加一个或多个值
Redis Rpushx 命令	为已存在的列表添加值
```
```
下表列出了与列表List相关的一些基本命令。
序号	命令	说明
1	BLPOP key1 [key2 ] timeout	删除并获取列表中的第一个元素，或阻塞，直到有一个元素可用
2	BRPOP key1 [key2 ] timeout	删除并获取列表中的最后一个元素，或阻塞，直到有一个元素可用
3	BRPOPLPUSH source destination timeout	从列表中弹出值，将其推送到另一个列表并返回它; 或阻塞，直到一个可用
4	LINDEX key index	通过其索引从列表获取元素
5	LINSERT key BEFORE/AFTER pivot value	在列表中的另一个元素之前或之后插入元素
6	LLEN key	获取列表的长度
7	LPOP key	删除并获取列表中的第一个元素
8	LPUSH key value1 [value2]	将一个或多个值添加到列表
9	LPUSHX key value	仅当列表存在时，才向列表添加值
10	LRANGE key start stop	从列表中获取一系列元素
11	LREM key count value	从列表中删除元素
12	LSET key index value	通过索引在列表中设置元素的值
13	LTRIM key start stop	修剪列表的指定范围
14	RPOP key	删除并获取列表中的最后一个元素
15	RPOPLPUSH source destination	删除列表中的最后一个元素，将其附加到另一个列表并返回
16	RPUSH key value1 [value2]	将一个或多个值附加到列表
17	RPUSHX key value	仅当列表存在时才将值附加到列表
```



## 5、Redis集合(Set)命令,与集合Set相关的一些基本命令
```
命令	描述
Redis Sadd 命令	向集合添加一个或多个成员
Redis Scard 命令	获取集合的成员数
Redis Sdiff 命令	返回给定所有集合的差集
Redis Sdiffstore 命令	返回给定所有集合的差集并存储在 destination 中
Redis Sinter 命令	返回给定所有集合的交集
Redis Sinterstore 命令	返回给定所有集合的交集并存储在 destination 中
Redis Sismember 命令	判断 member 元素是否是集合 key 的成员
Redis Smembers 命令	返回集合中的所有成员
Redis Smove 命令	将 member 元素从 source 集合移动到 destination 集合
Redis Spop 命令	移除并返回集合中的一个随机元素
Redis Srandmember 命令	返回集合中一个或多个随机数
Redis Srem 命令	移除集合中一个或多个成员
Redis Sunion 命令	返回所有给定集合的并集
Redis Sunionstore 命令	所有给定集合的并集存储在 destination 集合中
Redis Sscan 命令	迭代集合中的元素
```
```

下表列出了与集合Set相关的一些基本命令。
序号	命令	说明
1	SADD key member1 [member2]	将一个或多个成员添加到集合
2	SCARD key	获取集合中的成员数
3	SDIFF key1 [key2]	减去多个集合
4	SDIFFSTORE destination key1 [key2]	减去多个集并将结果集存储在键中
5	SINTER key1 [key2]	相交多个集合
6	SINTERSTORE destination key1 [key2]	交叉多个集合并将结果集存储在键中
7	SISMEMBER key member	判断确定给定值是否是集合的成员
8	SMOVE source destination member	将成员从一个集合移动到另一个集合
9	SPOP key	从集合中删除并返回随机成员
10	SRANDMEMBER key [count]	从集合中获取一个或多个随机成员
11	SREM key member1 [member2]	从集合中删除一个或多个成员
12	SUNION key1 [key2]	添加多个集合
13	SUNIONSTORE destination key1 [key2]	添加多个集并将结果集存储在键中
14	SSCAN key cursor []MATCH pattern [COUNT count]	递增地迭代集合中的元素
```



## 6、Redis有序集合(sorted set)命令
```
命令	描述
Redis Zadd 命令	向有序集合添加一个或多个成员，或者更新已存在成员的分数
Redis Zcard 命令	获取有序集合的成员数
Redis Zcount 命令	计算在有序集合中指定区间分数的成员数
Redis Zincrby 命令	有序集合中对指定成员的分数加上增量 increment
Redis Zinterstore 命令	计算给定的一个或多个有序集的交集并将结果集存储在新的有序集合 key 中
Redis Zlexcount 命令	在有序集合中计算指定字典区间内成员数量
Redis Zrange 命令	通过索引区间返回有序集合成指定区间内的成员
Redis Zrangebylex 命令	通过字典区间返回有序集合的成员
Redis Zrangebyscore 命令	通过分数返回有序集合指定区间内的成员
Redis Zrank 命令	返回有序集合中指定成员的索引
Redis Zrem 命令	移除有序集合中的一个或多个成员
Redis Zremrangebylex 命令	移除有序集合中给定的字典区间的所有成员
Redis Zremrangebyrank 命令	移除有序集合中给定的排名区间的所有成员
Redis Zremrangebyscore 命令	移除有序集合中给定的分数区间的所有成员
Redis Zrevrange 命令	返回有序集中指定区间内的成员，通过索引，分数从高到底
Redis Zrevrangebyscore 命令	返回有序集中指定分数区间内的成员，分数从高到低排序
Redis Zrevrank 命令	返回有序集合中指定成员的排名，有序集成员按分数值递减(从大到小)排序
Redis Zscore 命令	返回有序集中，成员的分数值
Redis Zunionstore 命令	计算给定的一个或多个有序集的并集，并存储在新的 key 中
Redis Zscan 命令	迭代有序集合中的元素（包括元素成员和元素分值）
```




## 7、Redis发布订阅命令
```
命令	描述
Redis Pubsub 命令	查看订阅与发布系统状态。
Redis Publish 命令	将信息发送到指定的频道。

Redis Subscribe 命令	订阅给定的一个或多个频道的信息。
Redis Unsubscribe 命令	指退订给定的频道。

Redis Psubscribe 命令	订阅一个或多个符合给定模式的频道。
Redis Punsubscribe 命令	退订所有给定模式的频道。

```


## 8、Redis事务命令
```
命令	描述
Redis Multi 命令	标记一个事务块的开始。
Redis Exec 命令	执行所有事务块内的命令。
Redis Discard 命令	取消事务，放弃执行事务块内的所有命令。
Redis Watch 命令	监视一个(或多个) key ，如果在事务执行之前这个(或这些) key 被其他命令所改动，那么事务将被打断。
Redis Unwatch 命令	取消 WATCH 命令对所有 key 的监视。
```




## 9、Redis脚本命令
```
命令	描述
Redis Eval 命令	执行 Lua 脚本。
Redis Evalsha 命令	执行 Lua 脚本。
Redis Script Exists 命令	查看指定的脚本是否已经被保存在缓存当中。
Redis Script Flush 命令	从脚本缓存中移除所有脚本。
Redis Script kill 命令	杀死当前正在运行的 Lua 脚本。
Redis Script Load 命令	将脚本 script 添加到脚本缓存中，但并不立即执行这个脚本。
```




## 10、Redis连接命令
```
命令	描述
Redis Auth 命令	验证密码是否正确
Redis Echo 命令	打印字符串
Redis Ping 命令	查看服务是否运行
Redis Quit 命令	关闭当前连接
Redis Select 命令	切换到指定的数据库
```



## 11、Redis服务器命令，Redis服务器相关的一些基本命令
```
命令	描述
Redis Bgrewriteaof 命令	异步执行一个 AOF（AppendOnly File） 文件重写操作
Redis Bgsave 命令	在后台异步保存当前数据库的数据到磁盘
Redis Client Kill 命令	关闭客户端连接
Redis Client List 命令	获取连接到服务器的客户端连接列表
Redis Client Getname 命令	获取连接的名称
Redis Client Pause 命令	在指定时间内终止运行来自客户端的命令
Redis Client Setname 命令	设置当前连接的名称
Redis Cluster Slots 命令	获取集群节点的映射数组
Redis Command 命令	获取 Redis 命令详情数组
Redis Command Count 命令	获取 Redis 命令总数
Redis Command Getkeys 命令	获取给定命令的所有键
Redis Time 命令	返回当前服务器时间
Redis Command Info 命令	获取指定 Redis 命令描述的数组
Redis Config Get 命令	获取指定配置参数的值
Redis Config rewrite 命令	对启动 Redis 服务器时所指定的 redis.conf 配置文件进行改写
Redis Config Set 命令	修改 redis 配置参数，无需重启
Redis Config Resetstat 命令	重置 INFO 命令中的某些统计数据
Redis Dbsize 命令	返回当前数据库的 key 的数量
Redis Debug Object 命令	获取 key 的调试信息
Redis Debug Segfault 命令	让 Redis 服务崩溃
Redis Flushall 命令	删除所有数据库的所有key
Redis Flushdb 命令	删除当前数据库的所有key
Redis Info 命令	获取 Redis 服务器的各种信息和统计数值
Redis Lastsave 命令	返回最近一次 Redis 成功将数据保存到磁盘上的时间，以 UNIX 时间戳格式表示
Redis Monitor 命令	实时打印出 Redis 服务器接收到的命令，调试用
Redis Role 命令	返回主从实例所属的角色
Redis Save 命令	异步保存数据到硬盘
Redis Shutdown 命令	异步保存数据到硬盘，并关闭服务器
Redis Slaveof 命令	将当前服务器转变为指定服务器的从属服务器(slave server)
Redis Showlog 命令	管理 redis 的慢日志
Redis Sync 命令	用于复制功能(replication)的内部命令

```

```
下表列出了与Redis服务器相关的一些基本命令。
序号	命令	说明
1	BGREWRITEAOF	异步重写仅追加的文件
2	BGSAVE	将数据集异步保存到磁盘
3	CLIENT KILL [ip:port] [ID client-id]	杀死或断开指定的客户端的连接
4	CLIENT LIST	获取到服务器的客户端连接列表
5	CLIENT GETNAME	获取当前连接的名称
6	CLIENT PAUSE timeout	在指定时间内停止处理来自客户端的命令
7	CLIENT SETNAME connection-name	设置当前连接名称
8	CLUSTER SLOTS	获取群集插槽到节点映射的数组
9	COMMAND	获取Redis命令详细信息的数组
10	COMMAND COUNT	获取Redis命令的总数
11	COMMAND GETKEYS	提取键给出一个完整的Redis的命令
12	BGSAVE	将数据集异步保存到磁盘
13	COMMAND INFO command-name [command-name …]	获取特定Redis命令详细信息的数组
14	CONFIG GET parameter	获取配置参数的值
15	CONFIG REWRITE	使用内存中配置来重写配置文件
16	CONFIG SET parameter value	将配置参数设置为给定值
17	CONFIG RESETSTAT	重置由INFO返回的统计信息
18	DBSIZE	返回所选数据库中的键数量
19	DEBUG OBJECT key	获取有关键的调试信息
20	DEBUG SEGFAULT	使服务器崩溃
21	FLUSHALL	从所有数据库中删除所有键
22	FLUSHDB	删除当前数据库中的所有键
23	INFO [section]	获取有关服务器的信息和统计信息
24	LASTSAVE	获取上次成功保存到磁盘的UNIX时间戳
25	MONITOR	监听服务器实时接收的所有请求
26	ROLE	返回实例在复制上下文中的角色
27	SAVE	将数据集同步保存到磁盘
28	SHUTDOWN [NOSAVE] [SAVE]	将数据集同步保存到磁盘，然后关闭服务器
29	SLAVEOF host port	使服务器成为另一个实例的从属，或将其提升作为主服务器
30	SLOWLOG subcommand [argument]	管理Redis慢查询日志
31	SYNC	用于复制的命令
32	TIME	返回当前服务器的时间

```



## 12、Redis地理位置(geo)命令
```
命令	描述
Redis GEOADD 命令	将指定的地理空间位置（纬度、经度、名称）添加到指定的key中
Redis GEODIST 命令	返回两个给定位置之间的距离
Redis GEOHASH 命令	返回一个或多个位置元素的 Geohash 表示
Redis GEOPOS 命令	从key里返回所有给定位置元素的位置（经度和纬度）
Redis GEORADIUS 命令	以给定的经纬度为中心， 找出某一半径内的元素
Redis GEORADIUSBYMEMBER 命令	找出位于指定范围内的元素，中心点是由给定的位置元素决定
```



## 13、Redis HyperLogLog命令
```
命令	描述
Redis Pfadd 命令	添加指定元素到 HyperLogLog 中。
Redis Pfcount 命令	返回给定 HyperLogLog 的基数估算值。
Redis Pgmerge 命令	将多个 HyperLogLog 合并为一个 HyperLogLog
```



## Redis基准测试中可用选项的列表
```
以下是Redis基准测试中可用选项的列表。
序号	选项	说明	默认值
1	-h	指定服务器主机名	127.0.0.1
2	-p	指定服务器端口	6379
3	-s	指定服务器套接字	
4	-c	指定并行连接的数量	50
5	-n	指定请求的总数	10000
6	-d	指定SET/GET值的数据大小(以字节为单位)	2
7	-k	1=keep alive, 0=reconnect	1
8	-r	使用SET/GET/INCR的随机键，SADD的随机值	
9	-p	管道<numreq>请求	1
10	-h	指定服务器主机名	
11	-q	强制让Redis安装。 只显示query/sec值	
12	--csv	以CSV格式输出	
13	-l	生成循环，永久运行测试	
14	-t	只运行逗号分隔的测试列表	
15	-I	空闲模式。 只打开N个空闲连接并等待
```

