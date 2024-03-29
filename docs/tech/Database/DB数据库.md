# DB数据库


[数据库](https://github.com/youngzil/quickstart-database)  
  
1、[MySQL](#MySQL)  

2、[Oracle](#Oracle)  

3、[数据库操作框架](#数据库操作框架)  

4、[数据库中间件](#数据库中间件)  

5、[轻量级数据库](#轻量级数据库)  

6、[其他数据库工具](#其他数据库工具)  


[DB-Engines Ranking](https://db-engines.com/en/ranking)  
[墨天轮中国数据库流行度排行](https://www.modb.pro/dbRank)  
[数据库排行榜](https://dbdb.io/stats)  
[]()  
[]()  

---------------------------------------------------------------------------------------------------------------------  
## MySQL

DML、DDL、DCL的区别
数据库的概念：库，用户，等
SQL列约束、主键约束、外键约束  
SQL唯一约束、主键、外键  
三范式：1NF、2NF、3NF
锁表原因及解决思路  
JDBC接口  
使用PreparedStatement预编译的好处  
SQL关键字：DISTINCT、Where(AND/OR、IN、BETWEEN、LIKE)GROUP BY(HAVING)、ORDER BY
数据库优化
SQL优化
索引的种类、数据结构、时间复杂度、实现原理
MySQL自适应索引(Adaptive hash index, AHI)实现解析
游标（cursor）
数据库中事务的四大特性（ACID）


1、DML、DDL、DCL的区别  
DDL（data definition language）数据库定义语言：CREATE、ALTER、DROP等  
DCL（Data Control Language）数据库控制语言：包括（grant,deny,revoke等）语句  
DML（data manipulation language）数据操纵语言:常用到的 SELECT、UPDATE、INSERT、DELETE。  

SQL唯一约束、主键、外键  
三范式：  
第一范式(1NF)：定义所需要的数据项、确保有数据没有重复的组、确保有一个主键、  
第二范式(2NF)：满足所有1NF的规则，必须有任意列不依赖主键关系  
第三范式(3NF)：满足第二范式 、所有非主字段都是依赖于主键  
  
  
第一范式是最基本的范式。如果数据库表中的所有字段值都是不可分解的原子值，就说明该数据库表满足了第一范式。  
第二范式：在一个数据库表中，一个表中只能保存一种数据，不可以把多种数据保存在同一张数据库表中。也就是一类，比如订单信息和客户信息分成两个表  
第三范式需要确保数据表中的每一列数据都和主键直接相关，而不能间接相关。 


2、数据库优化
数据库优化套路  
  分库分表、优化SQL语句、执行计划和Hint（提示）  
  
数据库优化：  
1) SQL语句及索引的优化  
2) 数据库表结构的优化  
数据库架构扩展：主从复制与读写分离、增加缓存、分库、分表、分区，开启慢查询日志，  
3) 系统配置的优化  
4) 硬件优化 

3、SQL优化：执行计划和Hint：EXPLAIN 或 EXPLAIN PLAN FOR 、/*+ all_rows */  
  
查看执行计划：mysql：EXPLAIN  或者 oracle：EXPLAIN PLAN FOR  
访问数据扫描方式：全表扫描、通过ROWID的扫描、索引扫描（索引唯一扫描、索引范围扫描、索引全扫描、索引快速扫描）  
表之间连接：四种  
SQL优化：执行计划和Hint（提示）、SQL语句优化  
SQL语句优化：优化语句使用索引、加Hint(提示) 

SQL优化
一个 SQL 语句的具体执行过程，比如会怎么利用索引，怎么优化之类的  

什么样的sql不走索引：where条件上索引列有计算、比较等操作，%%通配符，使用or关键字等等 
检查SQL是否使用了索引：用explain 来执行检验sql     
 mysql:key列显示MySQL实际决定使用的键（索引）
SQL语句优化：避免全表扫描  
MySQL行级锁、表级锁、页级锁的优化


4、索引的种类、数据结构、时间复杂度、实现原理
索引的作用，结构，为什么可以加快查询，缺点
占用空间，增删改变慢  

数据库中主键与索引的区别
加索引能使查询变快，加索引后会使写入、修改、删除变慢，占用存储空间 
索引的实现使用的数据结构：B-tree 或者 B+tree（局部性原理、磁盘预读、）
由于B+Tree内节点去掉了data域，因此可以拥有更大的出度，从而拥有更好的性能。  
数据库系统的设计者巧妙利用了磁盘预读原理，将一个节点的大小设为等于一个页，这样每个节点只需要一次I/O就可以完全载入。为了达到这个目的，在实际实现B-Tree还需要使用如下技巧：每次新建节点时，直接申请一个页的空间，这样就保证一个节点物理上也存储在一个页里，加之计算机存储分配都是按页对齐的，就实现了一个node只需一次I/O。  


索引的种类：唯一索引、聚集索引、非聚集索引、覆盖索引
索引查询的流程：非聚集索引和聚集索引的区别在于， 通过聚集索引可以查到需要查找的数据， 而通过非聚集索引可以查到记录对应的主键值 ， 再使用主键的值通过聚集索引查找到需要的数据  
索引数据结构设相关的计算机原理：磁盘预读原理 和 B+树
B树的搜索复杂度为O(h)=O(logdN)，所以树的出度d越大，深度h就越小，I/O的次数就越少。B+Tree恰恰可以增加出度d的宽度，因为每个节点大小为一个页大小，所以出度的上限取决于节点内key和data的大小

索引类型：  
a、普通索引：没有限制  
b、唯一索引：索引列的值必须唯一，但允许有空值。  
c、主键索引：特殊的唯一索引，不允许有空值。  
d、组合索引：最左前缀。  
1):查询条件中出现联合索引第一列,或者全部,则能利用联合索引.  
2)条件列中只要条件相连在一起,以本文例子来说就是:  
last_name=’1′ and first_name=’1′  
与first_name=’1′ and last_name=’1′,无论前后,都会利用上联合索引.  
3)查询条件中没有出现联合索引的第一列,而出现联合索引的第二列,或者第三列,都不会利用联合索引查询.复合索引中只要有一列含有NULL值，那么这一列对于此复合索引就是无效的  
e、全文索引  
  
索引的坏处：虽然大大提高了查询速度，但是会降低表的更新速度，例如insert、delete、update时，不仅要更新表，还要更新索引文件。  


数据库中事务的定义，什么是数据库事务
数据库中事务的四大特性（ACID）
怎么实现ACID：实现ACID的核心技术是并发控制和日志技术
并发控制：2PL、OCC、MVCC：保证并发操作的正确性
日志：Redo/Undo,WAL协议：保证故障场景下可恢复

数据库事务定义：一致性、隔离性
事务（Transaction）的4大特性ACID
ACID 原子性、一致性、隔离性（Isolation）、持久性
事务（Transaction）的隔离级别：Read uncommitted、Read committed、Repeatable read、Serializable：
SQL标准定义了4种事务隔离级别：读未提交，读已提交，可重复读，串行化  
事物隔离级别的实现原理：共享锁、独占锁、行级锁、表级锁  
事务隔离解决问题：脏读、不可重复读、幻读

read-uncommited 读未提交，别人修改了未提交就能看得到。会产生脏读  
read-commited  读提交，默认的就是这个。  会产生读取旧数据，  
repeatable-read  可重复读。会产生幻读，就是突然蹦出来的数据。读取数据的事务将会禁止写事务（但允许读事务），写事务则禁止任何其他事务。  
serializable  可串行化，强制事务串行执行。但是性能低下。  

  
Select、where、order by、COUNT、HAVING 、  
  
4、redis怎么防止内存穿透，怎么做到缓存和数据库一致  

DB数据库深度分页：覆盖索引、主键索引+join、倒序排列、缓存若干页、业务不允许查太多页  


数据库，innobd，隔离级别，行级锁  

  
JDBC规范提供的接口和类   
Statement、PreparedStatement、CallableStatement区别  
  
12、mybatis中的 $｛param｝与#｛param｝区别  
  
13、mysql主从复制  
主从好处：数据安全备份、读写分离、业务数据分库存储  
主从原理：主库的binlog、position输出线程、从库的I/O线程接收binlog、position线程 和 从库的SQL线程  
  
mysql主从复制存在的问题：  
主库宕机后，数据可能丢失  
从库只有一个sql Thread，主库写压力大，复制很可能延时  
  
解决方法：  
半同步复制—解决数据丢失的问题  
并行复制—-解决从库复制延迟的问题  

mysql数据库底层的排序机制？ sort page是怎么工作的？

1、数据库分页重复和分页实现  
    使用分页SQL的时候，数据如果是动态变化的，就会导致分页查询到重复数据  
    Oracle分页查询的三种方法  
2、数据库深度分页优化  
3、分库分表如何做到永不迁移数据和避免热点  
1、数据库分库分表原因、策略、带来的问题、解决  
2、数据库分布式事务解决：JTA的XA协议、二阶段提交（2PC、3PC）、柔性事务、最终一致性事务（消息）  
3、spring事务(Transaction)的七种事务传播行为及五种隔离级别  


数据库（database）、表（table）、视图（view）、索引（index）、序列（sequence）、  
表连接方式：INNER JOIN、LEFT JOIN、RIGHT JOIN、FULL JOIN、SELF JOIN、CARTESIAN JOIN（笛卡尔乘积）、UNION ALL、UNION  
 
框架：mybatis、hibernate  

数据库问题：  
索引分类，有什么用，好处、有什么优缺点，为什么可以加快查询，怎么检查一个SQL是否走索引，
索引使用条件、判断是否使用、不使用的情况 
聚集索引、非聚集索引、覆盖索引（复合索引或者多字段索引查询），不加索引（全表扫描）  
  B-tree 或者 B+tree  
  占用空间，增删改变慢  
  
数据库：范式、索引、优化、锁、oracle、mysql、mybatis  
  
数据库的锁：表级锁、页级锁、行级锁，悲观锁、乐观锁  
查找算法分类：  
  
mysql的主从是怎么实现的  
mysql当表达到一定数量，查询变慢，为什么？感觉是数据库优化的问题，建索引、分库分表、主从读写分离  
  
  
mysql主从同步基于什么来做的？  
mysql为什么一张表到了一定量查询会变慢？  

MySQL有三种锁的级别：页级、表级、行级。



---------------------------------------------------------------------------------------------------------------------  
## Oracle

Oracle  
JDBC 链接oracle的三种URL写法：SID方式 、ServerName方式、RAC方式   
  
SID是数据库实例的名字  
Service_name参数，该参数对应一个数据库，而不是一个实例  
一个数据库对应多个实例（SID）  
一个数据库可以对应多个Service_name  


oracle的sid与实例  
1.SID:对应着实例，一个数据库可以有多个实例（如RAC），SID是用来标识这个数据库内部每个实例的名字。  
2.SERVICE_NAME：是这个数据库对外宣称的名字，对应着数据库。  

  
Oracle序列的创建  

Oracle 物化视图 说明
https://blog.csdn.net/tianlesoftware/article/details/4713553 

---------------------------------------------------------------------------------------------------------------------  
## 数据库操作框架


---------------------------------------------------------------------------------------------------------------------  
## 数据库中间件


---------------------------------------------------------------------------------------------------------------------  
## 轻量级数据库

---------------------------------------------------------------------------------------------------------------------  
## 其他数据库工具


---------------------------------------------------------------------------------------------------------------------  
   
  
数据库：数据源、druid、h2、sqlite、yugong、，mybatis、liquibase、jooq、sharding-sphere、thinkjd  
  
  
