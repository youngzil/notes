# Redis运维命令


---------------------------------------------------------------------------------------------------------------------
- [Redis启动、连接命令](#Redis启动、连接命令)
- [Redis集群批量删除key](#Redis集群批量删除key)
    - [删除当前数据库中的所有Key](#删除当前数据库中的所有Key)
- [Redis运维常用命令](#Redis运维常用命令)
- [查看redisCluster集群中所有keys值的命令](#查看redisCluster集群中所有keys值的命令)
- [Redis查询某个key的slot](#Redis查询某个key的slot)
- [Redis的scan命令](#Redis的scan命令)



---------------------------------------------------------------------------------------------------------------------

## Redis启动、连接命令

```
Redis支持五种数据类型：
string（字符串），
hash（哈希），
list（列表），
set（集合）
zset(sorted set：有序集合)

连接：
本机redis-cli
远程redis-cli -h host -p port -a password
redis-cli -c -h 10.76.224.229 -p 6202 -a 密码
redis-cli -c -h 10.1.243.23 -p 7000 //集群方式登陆：-c说明以集群的方式登录

redis-cli --raw  防止中文乱码

PING 测试服务器是否正常

info 查看服务端信息和版本

cluster nodes   查看集群节点信息


redis集群操作

任意一个节点都可以创建key，或者查看key（演示）
redis-trib.rb check 192.168.133.130:7000//检测集群状态
cluster nodes//列出节点
cluster info//查看集群信息
cluster meet ip port //添加节点
cluster forget node_id //移除某个节点
cluster replicate node_id//将当前节点设置为指定节点的从
cluster saveconfig//保存配置文件



如果是用apt-get或者yum install安装的redis，可以直接通过下面的命令停止/启动/重启redis
/etc/init.d/redis-server stop
/etc/init.d/redis-server start
/etc/init.d/redis-server restart

如果是通过源码安装的redis，则可以通过redis的客户端程序redis-cli的shutdown命令来重启redis
1.redis关闭
redis-cli -h 127.0.0.1 -p 6379 shutdown

2.redis启动
redis-server

如果上述方式都没有成功停止redis，则可以使用终极武器 kill -9



测试网络PING

设置密码：
CONFIG get requirepass
CONFIG set requirepass "yiibai"
CONFIG get requirepass

客户端向Redis服务器验证自身，并检查服务器是否正在运行
AUTH "password"
PING

获取有关服务器的所有统计信息和信息info


获取配置
CONFIG SET loglevel "notice"
CONFIG GET loglevel
CONFIG GET *


基准测试命令的基本语法redis-benchmark [option] [option value]
通过调用100000个命令检查Redis：redis-benchmark -n 100000  
Redis基准实用程序中多个选项的使用redis-benchmark -h 127.0.0.1 -p 6379 -t set,lpush -n 100000 -q

在Redis配置文件(redis.conf)中，有一个名称为maxclients的属性，它描述了可以连接到Redis的客户端的最大数量。
config get maxclients
将客户端的最大数目设置为100000，并启动服务器。
redis-server --maxclients 100000



1.redis命令
1 redis执行了make install后，redis的课执行文件都会自动复制到 /usr/local/bin 目录
2 redis-server        redis服务器
3 redis-cli            redis命令行客户端
4 redis-benchmark        redis性能测试工具
5 redis-check-aof        aof文件修复工具
6 redis-check-dump    rdb文件检查工具


2.停止 redis 命令
# 停止Redis命令
redis-cli shutdown

只能一个节点一个节点的停止
http://doc.redisfans.com/server/shutdown.html


进来不要强制杀死进程，会丢失数据
#kill -9 10252 10257 10262 10267 10272 10294
#也可执行以下命令来关闭redis进程
#pkill -9 redis

```


---------------------------------------------------------------------------------------------------------------------
## 怎样查看Redis的版本号
```
redis-server --version
redis-server -v
redis-cli -h 172.16.49.106 -p 6379 --version
redis-cli -h 172.16.49.106 -p 6379 -v
redis-cli -h 172.16.49.106 -p 6379 info
```


---------------------------------------------------------------------------------------------------------------------


## 配置Redis的持久化配置
```
config  set save "900 1 300 10 60 10000"
config set "dbfilename" "new_file.rdb"

config get save
config get dbfilename
config get dir

#使配置更改永久化
config rewrite


所以实际执行下面这2个命令
config  set save "900 1 300 10 60 10000"
config rewrite


[How To Change Redis's Configuration from the Command Line](https://www.digitalocean.com/community/cheatsheets/how-to-change-redis-configuration)

```
---------------------------------------------------------------------------------------------------------------------

## Redis集群设置密码
```shell
# 每一台机器都执行下设置命令
redis-cli -h 127.0.0.1 -p 6379 config set requirepass 'XXX'
redis-cli -h 127.0.0.1 -p 6380 config set requirepass 'XXX'
redis-cli -h 127.0.0.1 -p 6381 config set requirepass 'XXX'
redis-cli -h 127.0.0.1 -p 6382 config set requirepass 'XXX'

# 使配置更改永久化
config rewrite


# 要想去除密码设置
./redis-cli -h 127.0.0.1 -p 6379 -a XXX config set requirepass ''
./redis-cli -h 127.0.0.1 -p 6380 -a XXX config set requirepass ''


# 一样的，最后使配置更改永久化
config rewrite

```


---------------------------------------------------------------------------------------------------------------------

## Redis客户端最大连接数查询与设置

```
可以在redis.conf配置文件中修改
maxclients 10000


CONFIG GET maxclients
CONFIG GET max*


info clients


#Redis Client List 命令用于返回所有连接到服务器的客户端信息和统计数据。

CLIENT LIST
```

参考  
https://www.cnblogs.com/zt007/p/9510795.html  
[Redis Client List 命令 - 获取连接到服务器的客户端连接列表](https://www.redis.net.cn/order/3657.html)


---------------------------------------------------------------------------------------------------------------------


## 禁止一些高危命令

修改 redis.conf 文件，添加
```
rename-command FLUSHALL ""
rename-command CONFIG   ""
rename-command EVAL     ""


# 重命名为其他名称
rename-command FLUSHALL rds_flushall
rename-command FLUSHDB rds_flushdb
rename-command KEYS rds_keys
rename-command MONITOR rds_monitor

```


---------------------------------------------------------------------------------------------------------------------
## 查看redisCluster集群中所有keys值的命令


```shell
这种方式只会查询单个节点的：

redis-cli -c -h 172.16.48.179 -p 7000                         
172.16.48.179:7000> keys "*lengfeng*"
(empty array)
172.16.48.179:7000>


这个可以查询整个集群的
redis-cli -c --cluster call 172.16.48.179:7000 keys "*lengfeng.test3*"
```



---------------------------------------------------------------------------------------------------------------------


## Redis集群批量删除key

1、查看集群信息
redis-cli -c -h 20.26.37.179 -p 28001 -a password
redis-cli -c -h 10.76.227.89 -p 6202 -a XXX
cluster nodes

2、删除keys
redis-cli -c -h 20.26.37.179 -p 28001 keys "OAUTH2:TOKEN:*" | xargs -t -n1 redis-cli -c -h 20.26.37.179 -p 28001 del


或者
redis-cli -c -h 20.26.37.179 -p 28001 -n 0 keys "OAUTH2:TOKEN:*" | xargs redis-cli -c -h 20.26.37.179 -p 28001 -n 0 del


### 删除当前数据库中的所有Key

https://blog.csdn.net/iloveyin/article/details/46813427
删除redis所有KEY

如果要访问 Redis 中特定的数据库，使用下面的命令
//下面的命令指定数据序号为0，即默认数据库
redis-cli -h ip -p port -n 0 keys "*"| xargs redis-cli -h ip -p port -n 0 del


删除所有Key，可以使用Redis的flushdb和flushall命令

//删除当前数据库中的所有Key
flushdb
//删除所有数据库中的key
flushall

注：keys 指令可以进行模糊匹配，但如果 Key 含空格，就匹配不到了，暂时还没发现好的解决办法。


---------------------------------------------------------------------------------------------------------------------



## Redis运维常用命令

1. info命令(可以查看Redis 服务器的各种信息和统计数值)
2. config get xxx(可以查看redis配置属性值)
3. client list(实时查看已经建立的连接)
4. client kill IP:PORT（杀掉某个连接）
5. slowlog get N 获取慢日志（查看redis慢查询）
6. dbsize  // 当前数据库的key的数量



参考  
[Redis运维常用命令](https://www.cnblogs.com/yjb007/p/9647567.html)  
[redis运维常用命令](http://www.peter-zhou.com/fu-wu-bu-shu/redis/13redisyun-wei-chang-yong-ming-ling.html)  
[记录一下redis常用运维命令](https://www.jianshu.com/p/1f3b86f46e03)  
[redis运维命令及参数整理](https://blog.51cto.com/dba10g/1846068)  
[Redis运维手册](https://help.fanruan.com/finereport/doc-view-2951.html)  
[redis运维常用命令](https://blog.csdn.net/zdp072/article/details/50985328)  



---------------------------------------------------------------------------------------------------------------------


## Redis查询某个key的slot

CLUSTER KEYSLOT 'client:prism:{mass-v2:sink:hll:cu}:app-version:hhh'


---------------------------------------------------------------------------------------------------------------------



## Redis的scan命令

[官网参考](https://redis.io/commands/scan)

```
redis 127.0.0.1:6379> scan 0 MATCH *11*
1) "288"
2) 1) "key:911"
redis 127.0.0.1:6379> scan 288 MATCH *11*
1) "224"
2) (empty list or set)
redis 127.0.0.1:6379> scan 224 MATCH *11*
1) "80"
2) (empty list or set)
redis 127.0.0.1:6379> scan 80 MATCH *11*
1) "176"
2) (empty list or set)
redis 127.0.0.1:6379> scan 176 MATCH *11* COUNT 1000
1) "0"
2)  1) "key:611"
    2) "key:711"
    3) "key:118"
    4) "key:117"
    5) "key:311"
    6) "key:112"
    7) "key:111"
    8) "key:110"
    9) "key:113"
   10) "key:211"
   11) "key:411"
   12) "key:115"
   13) "key:116"
   14) "key:114"
   15) "key:119"
   16) "key:811"
   17) "key:511"
   18) "key:11"
redis 127.0.0.1:6379>
```



---------------------------------------------------------------------------------------------------------------------


## 判断key是否存在和计算key的值的数量


- type key 和 llen key 都不能，不存在或者为空的时候，返回的是一样的，前者是none，后者是0
- exists key 判断一个key是否存在

Redis Type 命令用于返回 key 所储存的值的类型。  
返回key 的数据类型，数据类型有：
- none (key不存在)
- string (字符串)
- list (列表)
- set (集合)
- zset (有序集)
- hash (哈希表)


Key长度
- STRLEN key（string）
- LLEN key（list）
- HLEN key（hash）
- SCARD key（set）
- zcard key（zset）


---------------------------------------------------------------------------------------------------------------------




