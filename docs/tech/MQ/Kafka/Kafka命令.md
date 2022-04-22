- [Kafka操作命令](#Kafka操作命令)
- [查看kafka的zookeeper上的数据](#查看kafka的zookeeper上的数据)

---------------------------------------------------------------------------------------------------------------------
# Kafka操作命令

启动：

```
bin/zookeeper-server-start.sh config/zookeeper.properties &

bin/kafka-server-start.sh config/server.properties &
```
或者
```
nohup sh bin/zookeeper-server-start.sh config/zookeeper.properties &

nohup sh bin/kafka-server-start.sh config/server.properties &
```

停止：
```
bin/zookeeper-server-stop.sh

bin/kafka-server-stop.sh
```


创建主题Topic
```
#replication-factor 表示该topic需要在不同的broker中保存几份, partitions为几个分区

现在我们要创建一个含有6个Partition分区，每个分区3个备份的topic：
bin/kafka-topics.sh --create --partitions 6 --replication-factor 3  --topic topic03 --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

老的版本使用zookeeper地址
bin/kafka-topics.sh --create --partitions 6 --replication-factor 3 --topic localhost.test.topic --zookeeper 127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183/kafka

```

列出主题列表
```
bin/kafka-topics.sh --list --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

bin/kafka-topics.sh --list --zookeeper 127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183/kafka

```

查看主题详细信息
```
bin/kafka-topics.sh --describe --topic topic03 --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

一次查询多个topic
bin/kafka-topics.sh --describe --topic k2.tomcat.log,k2.tomcat.log2 --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094


bin/kafka-topics.sh --describe --topic topic03 --zookeeper 127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183/kafka

一次查询多个topic
bin/kafka-topics.sh --describe --topic topic01,topic02,topic03 --zookeeper 127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183/kafka

Topic:dream    PartitionCount:5    ReplicationFactor:2    Configs:
    Topic: topic01    Partition: 0    Leader: 1    Replicas: 1,2    Isr: 1,2
    Topic: topic01    Partition: 1    Leader: 2    Replicas: 2,3    Isr: 2,3
    Topic: topic01    Partition: 2    Leader: 3    Replicas: 3,1    Isr: 3,1
    Topic: topic01    Partition: 3    Leader: 1    Replicas: 1,3    Isr: 1,3
    Topic: topic01    Partition: 4    Leader: 2    Replicas: 2,1    Isr: 2,1

leader:负责处理消息的读和写，leader是从所有节点中随机选择的.
Replicas:列出了所有的副本节点，不管节点是否在服务中.
Lsr:是正在服务中的节点.

```


查看topic指定分区offset的最大值或最小值
```aidl
--time，为毫秒值，-time=-1时表示最大值latest，为-2时表示最小值earliest。该offset值是所写时间戳之后的第一条数据。结果为：

bin/kafka-run-class.sh kafka.tools.GetOffsetShell --topic topic03 --time -1 --partitions 0 --broker-list 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094
bin/kafka-run-class.sh kafka.tools.GetOffsetShell --topic topic03 --time -2 --broker-list 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

具体的时间戳
bin/kafka-run-class.sh kafka.tools.GetOffsetShell  -topic topicName --time 1585186237000 --broker-list broker1:9092,broker2:9092


查询offset的最大值
bin/kafka-run-class.sh kafka.tools.GetOffsetShell --topic topic03 --time -1 --broker-list 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094


查询offset的最小值
bin/kafka-run-class.sh kafka.tools.GetOffsetShell --topic topic03 --time -2 --broker-list 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

```

修改主题配置

```aidl

bin/kafka-configs.sh --alter --topic topic03 --add-config max.message.bytes=20480000 --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

bin/kafka-topics.sh --alter --topic topic03 --config max.message.bytes=102400000 --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

bin/kafka-topics.sh --alter --topic topic03 --config max.message.bytes=102400000 --zookeeper 127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183/kafka
```


为topic增加分区(不支持减partition)

```
为topic增加partition

bin/kafka-topics.sh --alter --topic topic03 --partitions 3 --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

bin/kafka-topics.sh --alter --topic topic03 --partitions 6 --zookeeper 127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183/kafka


如何增加__consumer_offsets的副本数？其他Topic主题也是一样
可使用kafka-reassign-partitions.sh来增加__consumer_offsets的副本数，方法如下：

构造一JSON文件reassign.json：
    {
    "version":1,
    "partitions":[
    {"topic":"__consumer_offsets","partition":0,"replicas":[1,2,3]},
    {"topic":"__consumer_offsets","partition":1,"replicas":[2,3,1]},
    {"topic":"__consumer_offsets","partition":2,"replicas":[3,1,2]},
    {"topic":"__consumer_offsets","partition":3,"replicas":[1,2,3]},
    ...
    {"topic":"__consumer_offsets","partition":100,"replicas":[2,3,1]}
    ]
    }

然后执行：
bin/kafka-reassign-partitions.sh --reassignment-json-file reassign.json --execute --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

“[1,2,3]”中的数字为broker.id值。

```

删除主题
```
bin/kafka-topics.sh --delete --topic topic03 --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094
bin/kafka-topics.sh --delete --topic topic03 --zookeeper 127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183/kafka


kafka删除topic方法
1) bin/kafka-topics.sh --delete --zookeeper master:2181 --topic DreamTopic
如果删除后查看topic显示为:marked for deletion  则需要在每一台机器中的 config/server.properties 文件加入  delete.topic.enable=true，然后重启kafka

2) 删除kafka存储目录（server.properties文件log.dirs配置，默认为"/tmp/kafka-logs"）相关topic目录删除zookeeper "/brokers/topics/"目录下相关topic节点

```


生产者Producer发送消息
```
bin/kafka-console-producer.sh --topic topic03 --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

bin/kafka-console-producer.sh --topic topic03 --broker-list 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

```

消费者Consumer消费主题
```
bin/kafka-console-consumer.sh --topic topic03 --from-beginning --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

bin/kafka-console-consumer.sh --topic topic03 --from-beginning --group test.group --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094


1) 从头开始 
bin/kafka-console-consumer.sh --topic test --from-beginning --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094
bin/kafka-console-consumer.sh --topic test --offset earliest --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

2) 从尾部开始(默认)
bin/kafka-console-consumer.sh --topic test --offset latest --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

3) 指定分区 
bin/kafka-console-consumer.sh --topic test --offset latest --partition 1 --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

4) 取指定个数 
bin/kafka-console-consumer.sh --topic test --offset latest --partition 1 --max-messages 1 --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

5) 新消费者（ver>=0.9） 
bin/kafka-console-consumer.sh --topic test --new-consumer --from-beginning --consumer.config config/consumer.properties --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094


```



查看有哪些消费者Group
```
2) API方式（新）
bin/kafka-consumer-groups.sh --list --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094


1) 分ZooKeeper方式（老）
bin/kafka-consumer-groups.sh --zookeeper 127.0.0.1:2181/kafka --list

```


查看Group详情
查看消费者消费偏移量
```
bin/kafka-consumer-groups.sh --list --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094
bin/kafka-consumer-groups.sh --group testgroup --describe --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

bin/kafka-consumer-groups.sh --list --zookeeper 10.1.128.60:2181,10.1.128.61:2181,10.1.128.62:2181
bin/kafka-consumer-groups.sh --group testgroup --describe --zookeeper 10.1.128.60:2181,10.1.128.61:2181,10.1.128.62:2181

```


获取指定Consumer Group的位移信息(新的2.x的版本不能使用)
```
需consumer.properties中设置exclude.internal.topics=false：
1) 0.11.0.0版本之前： 
bin/kafka-simple-consumer-shell.sh --topic __consumer_offsets --partition 11 --broker-list 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094 --formatter "kafka.coordinator.GroupMetadataManager\$OffsetsMessageFormatter" 

2) 0.11.0.0版本以后(含)： 
bin/kafka-simple-consumer-shell.sh --topic __consumer_offsets --partition 11 --broker-list 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094 --formatter "kafka.coordinator.group.GroupMetadataManager\$OffsetsMessageFormatter" 

4.查看消费者消费偏移量
bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group lengfeng.consumer.group --describe

```


修改消费组的offset
```
设置为最初偏移量：
bin/kafka-consumer-groups.sh --group testgroup --topic topic03 --reset-offsets --to-earliest --execute --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

设置最近偏移量
bin/kafka-consumer-groups.sh --group testgroup --topic topic03 --reset-offsets --to-latest --execute --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094


设置任意偏移量：
bin/kafka-consumer-groups.sh --group lengfeng.consumer.group --topic kafka_flink_mysql --reset-offsets --to-offset 3 --execute --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

```




查看内部主题__consumer_offsets（保存Consumer Group消费位移信息的Topic）

```
需consumer.properties中设置exclude.internal.topics=false：

1) 0.11.0.0之前版本 
bin/kafka-console-consumer.sh --topic __consumer_offsets --zookeeper localhost:2181 --formatter "kafka.coordinator.GroupMetadataManager\$OffsetsMessageFormatter" --consumer.config config/consumer.properties --from-beginning 

2) 0.11.0.0之后版本(含) 
bin/kafka-console-consumer.sh --topic __consumer_offsets --formatter "kafka.coordinator.group.GroupMetadataManager\$OffsetsMessageFormatter" --consumer.config config/consumer.properties --from-beginning --bootstrap-server 127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094

老的版本使用zookeeper查询
bin/kafka-console-consumer.sh --topic __consumer_offsets --zookeeper localhost:2181 --formatter "kafka.coordinator.group.GroupMetadataManager\$OffsetsMessageFormatter" --consumer.config config/consumer.properties --from-beginning
```






如何增加__consumer_offsets的副本数？其他Topic主题也是一样
```
可使用kafka-reassign-partitions.sh来增加__consumer_offsets的副本数，方法如下：

构造一JSON文件reassign.json：
    {
    "version":1,
    "partitions":[
    {"topic":"__consumer_offsets","partition":0,"replicas":[1,2,3]},
    {"topic":"__consumer_offsets","partition":1,"replicas":[2,3,1]},
    {"topic":"__consumer_offsets","partition":2,"replicas":[3,1,2]},
    {"topic":"__consumer_offsets","partition":3,"replicas":[1,2,3]},
    ...
    {"topic":"__consumer_offsets","partition":100,"replicas":[2,3,1]}
    ]
    }

然后执行：
kafka-reassign-partitions.sh --zookeeper localhost:2181/kafka --reassignment-json-file reassign.json --execute
“[1,2,3]”中的数字为broker.id值。


__consumer_offsets
__consumer_offsets是kafka内置的Topic，在0.9.0.0之后的Kafka，将topic的offset 信息由之前存储在zookeeper上改为存储到内置的__consumer_offsets中。

server.properties中的配置项num.partitions和default.replication.factor对__consumer_offsets无效，而是受offsets.topic.num.partitions和offsets.topic.replication.factor两个控制。 
```



设置修改Consumer Group的offset

```
执行zkCli.sh进入zookeeper命令行界面，假设需将group为testgroup的topic的offset设置为2018，则：set /consumers/testgroup/offsets/test/0 2018

如果kakfa在zookeeper中的根目录不是“/”，而是“/kafka”，则： 

set /kafka/consumers/testgroup/offsets/test/0 2018 

另外，还可以使用kafka自带工具kafka-run-class.sh kafka.tools.UpdateOffsetsInZK修改，命令用法： 

kafka.tools.UpdateOffsetsInZK$ [earliest | latest] consumer.properties topic 

从用法提示可以看出，只能修改为earliest或latest，没有直接修改zookeeper灵活。 

```


删除Group
```
老版本的ZooKeeper方式可以删除Group，新版本则自动删除，当执行：
kafka-consumer-groups.sh --group test --delete --bootstrap-server 127.0.0.1:9092

输出如下提示： 
```
kafka-consumer-groups.sh --group lengfeng-test-edu-gatling-group1 --delete --bootstrap-server 172.16.48.179:9081,172.16.48.180:9081,172.16.48.181:9081


查看新消费者详情
```
仅支持offset存储在zookeeper上的：

kafka-run-class.sh kafka.tools.ConsumerOffsetChecker --zkconnect localhost:2181 --group test 

bin/kafka-run-class.sh kafka.tools.ConsumerOffsetChecker --broker-info --group CONSUMER_TOPICTEST_ALL_MSGTEST_CLUSTER_GROUP --topic topicTest --zookeeper 10.1.243.23:52181

```

查看broker的配置
bin/kafka-configs.sh --describe --all --broker 0 --bootstrap-server localhost:9092
bin/kafka-configs.sh --alter --add-config k3=v3 --broker 0 --bootstrap-server localhost:9092
bin/kafka-configs.sh --alter --add-config 'log.cleaner.threads.config=50' --entity-default --entity-type brokers  --bootstrap-server localhost:9092




# 查看kafka的zookeeper上的数据

1) 查看Kakfa在zookeeper的根目录
   ls /kafka

2) 查看brokers
    ls /kafka/brokers

3) 查看有哪些brokers（214和215等为server.properties中配置的broker.id值）：
   ls /kafka/brokers/ids

4) 查看broker 214，下列数据显示该broker没有设置JMX_PORT：
   get /kafka/brokers/ids/214

5) 查看controller，下列数据显示broker 214为controller：
   get /kafka/controller

6) 查看kafka集群的id：
    get /kafka/cluster/id

7) 查看有哪些topics：
    ls /kafka/brokers/topics

8) 查看topic下有哪些partitions：
    ls /kafka/brokers/topics/__consumer_offsets/partitions

9) 查看“partition 0”的状态：
    get /kafka/brokers/topics/__consumer_offsets/partitions/0/state

23. 如何增加__consumer_offsets的副本数？
    可使用kafka-reassign-partitions.sh来增加__consumer_offsets的副本数，方法如下：

    构造一JSON文件reassign.json：

{
"version":1,
"partitions":[
{"topic":"__consumer_offsets","partition":0,"replicas":[1,2,3]},
{"topic":"__consumer_offsets","partition":1,"replicas":[2,3,1]},
{"topic":"__consumer_offsets","partition":2,"replicas":[3,1,2]},
{"topic":"__consumer_offsets","partition":3,"replicas":[1,2,3]},
...
{"topic":"__consumer_offsets","partition":100,"replicas":[2,3,1]}
]
}
然后执行：

kafka-reassign-partitions.sh --zookeeper localhost:2181/kafka --reassignment-json-file reassign.json --execute
“[1,2,3]”中的数字为broker.id值。


__consumer_offsets
__consumer_offsets是kafka内置的Topic，在0.9.0.0之后的Kafka，将topic的offset 信息由之前存储在zookeeper上改为存储到内置的__consumer_offsets中。

 	server.properties中的配置项num.partitions和default.replication.factor对__consumer_offsets无效，而是受offsets.topic.num.partitions和offsets.topic.replication.factor两个控制。 


kafka不支持topic修改副本数量：

bin/kafka-topics.sh --alter --topic db.192_168_5_14_3319_wac_trinity.position --replication-factor 3 --partitions 1 --bootstrap-server 172.16.48.182:9011,172.16.48.182:9012,172.16.48.183:9011
Option "[replication-factor]" can't be used with option "[alter]"




[Kafka常用命令收录](https://cloud.tencent.com/developer/article/1350788)  
[Kafka操作命令](https://www.cnblogs.com/zcqdream/articles/6593875.html)  



---------------------------------------------------------------------------------------------------------------------

