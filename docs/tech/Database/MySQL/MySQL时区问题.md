- [MySQL时区问题](#MySQL时区问题)
  - [MySQL数据库时间和jdbc查询时间相差12小时问题](#MySQL数据库时间和jdbc查询时间相差12小时问题)
    - [MySQL自身时区设置](#MySQL自身时区设置)
    - [JDBC URL时区设置](#JDBC-URL时区设置)
    - [JSON时区](#JSON时区)
    - [排查示例](#排查示例)
  - [MySQL时区源码解读](#MySQL时区源码解读)
    - [6.X版本](#6.X版本)
    - [8.X版本](#8.X版本)





# MySQL时区问题



## MySQL数据库时间和jdbc查询时间相差12小时问题

可以按照如下检查
- 检查主机时区（mysql server主机和Java客户端主机）：date
- MySQL自身时区设置：select now()
- jdbcURL设置：serverTimezone=Asia/Shanghai
- json时区：spring.jackson.time-zone=GMT+8


### MySQL自身时区设置

使用select now()查询

再去确认一下MySQL时区，一开始的time_zone的值是SYSTEM，忘记截图了，改为GMT+8之后，使用show variables like '%time_zone%'查看一下修改结果，证明时区也没问题了。


### JDBC URL时区设置

添加serverTimezone配置，

之前可能是世界时或者其他时区

serverTimezone=UTC

时差应该改为 中国时

serverTimezone=Asia/Shanghai

或者

serverTimezone=GMT%2B8


url: jdbc:mysql://ip:3306/db?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&useSSL=false

spring.datasource.url=jdbc:mysql://127.0.0.1:3306/reservoir?characterEncoding=utf8&useSSL=true&zeroDateTimeBehavior=convertToNull&useTimezone=true&serverTimezone=Asia/Shanghai



### JSON时区

因为页面上提交的是payload数据，走的是json格式，而springboot默认使用的是jackson，遂增加jackson时区配置。

```
#json timezone
spring.jackson.time-zone=GMT+8
```



[MySQL数据库时间和jdbc查询时间相差12小时](https://www.jiweichengzhu.com/article/04cc05b3fef8412e9c63ca82b4638a5e)
[Java 与 MySQL 的 13 个小时时差](https://blog.csdn.net/wo18237095579/article/details/90288735)



### 排查示例

```
mysql时间和本地时间相差13个小时

修改linux的时间 执行tzselect 命令

date命令查看时区什么都是对的但是mysql的时间就是不对

折腾了一个多小时

set global time_zone = '+08:00'; set time_zone = '+08:00'; 这些命令都测试了还是不行

后台打印本地new Date()没有问题是北京时间，肯定问题出在mysql时区设置上。后台进到mysql命令行模式，查看数据库时区：show variables like '%time_zone%';

发现果然是时区问题，设置成了美国那里的时区，OK问题发现。

后来直接修改的/etc/my.cnf的

直接添加重启mysql就可以了

default-time-zone='+08:00'
```






## MySQL时区源码解读

### 6.X版本

在mysql:mysql-connector-java:6.0.6.jar中

ConnectionImpl.java中的构造方法
public ConnectionImpl(HostInfo hostInfo) throws SQLException
会调用createNewIO--->connectOneTryOnly--->initializePropsFromServer--->loadServerVariables

在loadServerVariables中会执行SQL从服务端查询属性设置在本地
使用的SQL如下
```
/* mysql-connector-java-6.0.6 ( Revision: 3dab84f4d9bede3cdd14d57b99e9e98a02a5b97d ) */SELECT  @@session.auto_increment_increment AS auto_increment_increment, @@character_set_client AS character_set_client, @@character_set_connection AS character_set_connection, @@character_set_results AS character_set_results, @@character_set_server AS character_set_server, @@init_connect AS init_connect, @@interactive_timeout AS interactive_timeout, @@license AS license, @@lower_case_table_names AS lower_case_table_names, @@max_allowed_packet AS max_allowed_packet, @@net_buffer_length AS net_buffer_length, @@net_write_timeout AS net_write_timeout, @@query_cache_size AS query_cache_size, @@query_cache_type AS query_cache_type, @@sql_mode AS sql_mode, @@system_time_zone AS system_time_zone, @@time_zone AS time_zone, @@tx_isolation AS tx_isolation, @@wait_timeout AS wait_timeout
```


ConnectionImpl类中props和父类中的propertySet保存了连接的所有属性

- 如果我们没有设置serverTimezone，可以看到propertySet中serverTimezone的值为空
- 如果我们设置了serverTimezone，可以看到propertySet中就是我们设置的值

在ConnectionImpl.java中的构造方法打断点，可以看到是从druid中的filter构建的（我们项目使用的是druid）

ConnectionImpl.java中的构造方法：初始化MysqlaSession，MysqlaSession中再初始化MysqlaProtocol


### 8.X版本

在mysql-connector-java 8.x版本中

ConnectionImpl的构造方法，初始化的是NativeSession，NativeSession中初始化的是NativeProtocol

在ConnectionImpl的构造方法，
会调用createNewIO--->connectOneTryOnly--->initializePropsFromServer--->initServerSession--->configureTimeZone
在configureTimeZone中使用TimeZone.getDefault()来设置this.serverSession.setSessionTimeZone(selectedTz);


[如何使用Java中的mysql时区](https://www.code456.com/article/218987.html)

















