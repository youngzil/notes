# MQ消息


[MQ消息](https://github.com/youngzil/quickstart-mq)  
  
1、[RocketMQ](#RocketMQ)  

2、[ActiveMQ](#ActiveMQ)  

3、[Kafka](#Kafka)  

4、[RabbitMQ](#RabbitMQ)  

5、[MQTT](#MQTT)  
  
6、[OpenMessaging](#OpenMessaging)  


### activemq-apollo
支持STOMP协议，已经废弃




  
---------------------------------------------------------------------------------------------------------------------  
## RocketMQ

消息类型：  
  
从通讯方式：  
同步、异步、oneway  
  
普通消息  
tag消息  
顺序消息  
事务消息  
延时消息（定时消息）  
优先级消息（activemq） 

  
RocketMQ系统部署架构：Namesrv 和 Broker（Master、Slave）  
RocketMQ生产者模型、消费者模型  
RocketMQ存储模型:offset-->commitlog-->mmap  
  
生产者发送流程  
发送普通消息负载  
发送顺序消息  
发送事务消息  
  
Broker：  
broker消息存储过程、创建文件机制、刷盘机制  
broker查找消息过程  
如果想把一台broker下掉，但不能影响线上消息。  
RocketMQ的文件  
  
  
主题和消息：  
消息发送到消费流程  
消息重复原因和消费幂等的必要性  
线上关闭Topic自动创建  
事务消息流程  
  
  
  
消费者问题：  
1、多个消费者只有一个消费者消费：instanceId相同的问题  
2、全新的消费组第一次上线，设置从尾部开始消费，但是实际从头开始消费，如果是老的消费组重新上线，就从上次消费过的位置继续消费  
3、消费组中的消费者负载均衡  
4、  
  
  
RocketMQ和kafka的区别  
RocketMQ和ActiveMQ的区别  
常见问题  


---------------------------------------------------------------------------------------------------------------------  
## ActiveMQ

JMS的基本组成：  
ConnectionFactory，Connection，Session，Destination（queue，topic），Producer，Consumer，Message（TextMessage、MapMessage、BytesMessage、StreamMessage和ObjectMessage） 

JMS规范  
JMS消息组成：JMS消息由3部分组成：消息头、属性和消息体  
  
Activemq的同步和异步消息  
ActiveMQ顺序消息：consumer之独有消费者（exclusive consumer）、 Message Groups特性  
  
activemq开启jmx监控  
ActiveMQ的共享文件方式部署手册  
LevelDB部署  

---------------------------------------------------------------------------------------------------------------------  
## Kafka

Kafka生产、保存、消费流程  
Kafka在zk上注册的节点  
Producer和Consumer说明.md  
kafka架构内部原理  
查找消息  
同一分区消息乱序 


---------------------------------------------------------------------------------------------------------------------  
## RabbitMQ


---------------------------------------------------------------------------------------------------------------------  
## MQTT


---------------------------------------------------------------------------------------------------------------------  
## OpenMessaging


---------------------------------------------------------------------------------------------------------------------  

参考  
[消息分类](https://github.com/youngzil/quickstart-mq/blob/master/docs/消息分类.md)  
[ActiveMQ学习](https://github.com/youngzil/quickstart-mq/blob/master/quickstart-activemq/docs/ActiveMQ学习.md)  
[RocketMQ学习](https://github.com/youngzil/quickstart-mq/blob/master/quickstart-rocketmq/docs/RocketMQ学习.md)  
[Kafka学习](https://github.com/youngzil/quickstart-mq/blob/master/quickstart-kafka/docs/Kafka学习.md)  


Rocketmq原理  
https://blog.csdn.net/wuzhengfei1112/article/details/78076718  
  
Activemq和Rocketmq：  
实现的协议：  
存储消息的方式和处理：  
生产端和消费端  
  
  
activemq、Rocketmq、rabbitmq、  
 
  
  
自己做的消息组件框架的封装模式？为什么这么做？  
封装了哪些消息中间件，各个消息中间件的原理，区别？主题、队列等怎么统一适配？  
封装了哪些功能？服务端？客户端？  
一般用什么消息组件？为什么？遇到有什么问题？  
rocketmq数据存储方式：数据头+消息体，根据消息头判断读取多大的消息体  
先读取固定长度的消息头，消息头中含有消息体的大小，再从消息头开始往后读取消息体大小的数据作为消息体内容  
内存映射文件作用：效率，安全不丢失  
  
  
消息中间件：openmq、zeromq、hivemq、hornetq、  

  
---------------------------------------------------------------------------------------------------------------------  
  

  
