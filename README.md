项目地址  
https://github.com/youngzil/notes  

#目录

- [Java](#Java)
    - [基础](#基础)
    - [集合](#集合)
    - [并发](#并发)
    - [JVM](#JVM)
    - [I/O](#IO)
    - [Java8](#Java8)
    - [Java9](#Java9)
    - [Java学习常见问题汇总](#Java学习常见问题汇总)
    - [读书和笔记](#读书和笔记)
- [MQ消息组件](#MQ消息组件)
    - [RocketMQ](#RocketMQ)
    - [ActiveMQ](#ActiveMQ)
    - [Kafka](#Kafka)
    - [RabbitMQ](#RabbitMQ)
    - [OpenMessaging](#OpenMessaging)
    - [MQTT](#MQTT)
    - [OpenMQ](#OpenMQ)
    - [ZeroMQ](#ZeroMQ)
    - [HiveMQ](#HiveMQ)
    - [HornetQ](#HornetQ)
- [远程通讯和RPC框架](#远程通讯和RPC框架)
    - [Netty](#Netty)
    - [MINA](#MINA)
    - [Hession](#Hession)
    - [t-io](#t-io)
    - [xSocket](#xSocket)
    - [Grizzly](#Grizzly)
    - [Dubbo](#Dubbo)
    - [gRPC](#gRPC)
    - [Thrift](#Thrift)
    - [Finagle](#Finagle)
    - [Jupiter](#Jupiter)
    - [Motan](#Motan)
    - [Tars](#Tars)
    - [HSF](#HSF)
    - [自己实现simple RPC](#自己实现simple RPC)
- [容器](#容器)
    - [Docker](#Docker)
    - [Kubernetes](#Kubernetes)
    - [Istio](#Istio)
    - [Pouch](#Pouch)
- [缓存和KV数据库](#缓存和KV数据库)
    - [Redis](#Redis)
    - [Memcached](#Memcached)
    - [Caffeine](#Caffeine)
    - [JetCache](#JetCache)
    - [JCache](#JCache)
    - [GuavaCache](#GuavaCache)
    - [ConcurrentLinkedHashMap](#ConcurrentLinkedHashMap)
    - [EhCache](#EhCache)
    - [Hazelcast](#Hazelcast)
    - [Codis](#Codis)
    - [Tair](#Tair)
- [Reactive响应式编程](#Reactive响应式编程)
    - [Reactor](#Reactor)
    - [ReactiveX](#ReactiveX)
    - [WebFlux](#WebFlux)
    - [RSocket](#RSocket)
    - [Akka](#Akka)
    - [Ratpack](#Ratpack)
- [架构和设计](#架构和设计)
    - [设计模式](#设计模式)
- [网络和HTTP](#网络和HTTP)
    - [HTTP客户端](#HTTP客户端)
        - [Unirest](#Unirest)
        - [Feign](#Feign)
        - [HttpClient](#HttpClient)
        - [OkHttp](#OkHttp)
        - [http-jersey](#http-jersey)
        - [JDK NIO/BIO](#JDK NIOBIO)
- [Spring](#Spring)
    - [SpringBoot](#SpringBoot)
        - [websocket](#websocket)
        - [web](#web)
        - [sqlite](#sqlite)
        - [mybatis-generator](#mybatis-generator)
        - [tkmapper](#tkmapper)
        - [swagger](#swagger)
        - [webflux](#webflux)
        - [starter](#starter)
        - [security](#security)
        - [kafka](#kafka)
        - [cache](#cache)
        - [activemq](#activemq)
        - [actuator](#actuator)
        - [admin](#admin)
        - [druid](#druid)
        - [jooq](#jooq)
        - [kafka](#kafka)
        - [multidatasource](#multidatasource)
    - [SpringCloud](#SpringCloud)
        - [zuul](#zuul)
        - [stream](#stream)
        - [web](#web)
        - [sleuth](#sleuth)
        - [example](#example)
        - [hystrix](#hystrix)
        - [eureka](#eureka)
        - [consul](#consul)
        - [config](#config)
    - [SpringMVC](#SpringMVC)
        - [kafka](#kafka)
        - [jooq](#jooq)
        - [example](#example)
        - [annotation](#annotation)
        - [activemq](#activemq)
    - [SpringData](#SpringData)
        - [solr](#solr)
        - [redis](#redis)
        - [elasticsearch](#elasticsearch)
- [注册中心和配置中心](#注册中心和配置中心)
    - [注册中心](#注册中心)
        - [ZooKeeper](#ZooKeeper)
        - [Nacos](#Nacos)
        - [Etcd](#Etcd)
        - [Consul](#Consul)
        - [ZKWeb](#ZKWeb)
    - [配置中心](#配置中心)
        - [Apollo](#Apollo)
        - [Disconf](#Disconf)
        - [XDiamond](#XDiamond)
        - [XXL-CONF](#XXL-CONF)
- [分布式](#分布式)
    - [分布式事务](#分布式事务)
    - [分布式锁](#分布式锁)
    - [分布式ID](#分布式ID)
    - [分布式缓存](#分布式缓存)
- [网关](#网关)
    - [API服务网关](#API服务网关)
        - [Zuul2](#Zuul2)
        - [Zuul1](#Zuul1)
        - [Kong](#Kong)
    - [代理服务器](#代理服务器)
        - [Nginx](#Nginx)
        - [Tengine](#Tengine)
        - [LittleProxy](#LittleProxy)
        - [Apache HTTP](#ApacheHTTP)
    - [限流熔断](#限流熔断)
        - [Sentinel](#Sentinel)
        - [Resilience4j](#Resilience4j)
        - [Eureka](#Eureka)
        - [SnowJena](#SnowJena)
- [模块化和类隔离](#模块化和类隔离)
    - [sofa-jarslink](#sofa-jarslink)
    - [Pandora](#Pandora)
    - [Java9](#Java9)
    - [JarsLink](#JarsLink)
- [Linux](#Linux)
    - [](#)
- [AIF组件和项目](#AIF组件和项目)
    - [网关和能力开放平台OSP](#网关和能力开放平台OSP)
    - [消息组件MsgFrame](#消息组件MsgFrame)
    - [缓存Aicache](#缓存Aicache)
    - [配置中心Amber](#配置中心Amber)
    - [微服务治理框架CSF](#微服务治理框架CSF)
    - [监控和跟踪Log4x和ISee](#监控和跟踪Log4x和ISee)
    - [调度ET(AISchedule)](#调度ET(AISchedule))
    - [服务编排Comframe](#服务编排Comframe)
    - [统一权限USPA](#统一权限USPA)
    - [网管项目](#网管项目)
- [数据结构与算法](#数据结构与算法)
    - [数据结构](#数据结构)
    - [算法](#算法)
- [应用容器](#应用容器)
    - [Jetty](#Jetty)
    - [Tomcat](#Tomcat)
    - [Undertow](#Undertow)
    - [JBoss](#JBoss)
    - [Jersey](#Jersey)
    - [QuickServer](#QuickServer)
    - [WebLogic](#WebLogic)
    - [WebSphere](#WebSphere)
- [系统监控](#系统监控)
    - [进程监控](#进程监控)
        - [Prometheus](#Prometheus)
        - [Zabbix](#Zabbix)
    - [在线诊断工具](#在线诊断工具)
        - [JVM SandBox](#JVM SandBox)
        - [Anthas](#Anthas)
        - [BTrace](#BTrace)
        - [Greys-Anatomy](#Greys-Anatomy)
        - [HouseMD](#HouseMD)
- [常用框架](#常用框架)
    - [Disruptor](#Disruptor)
    - [Guava](#Guava)
    - [Servlet](#Servlet)
    - [Guice](#Guice)
    - [Crypto](#Crypto)
    - [字节码框架ASM](#字节码框架ASM)
    - [logging框架](#logging框架)
    - [JSON框架](#JSON框架)
    - [Reflect反射](#Reflect反射)
    - [YAML框架](#YAML框架)
    - [XML框架](#XML框架)
    - [JVM序列化框架](#JVM序列化框架)
    - [String字符串压缩](#String字符串压缩)
    - [FastDFS](#FastDFS)
    - [Quartz](#Quartz)
    - [JFinal](#JFinal)
    - [UUID](#UUID)
    - [Proxy代理](#Proxy代理)
    - [Java和Kotlin、Groovy、Scala的代码和相互调用](#Java和Kotlin、Groovy、Scala的代码和相互调用)
- [数据库](#数据库)
    - [数据库产品](#数据库产品)
        - [MySQL](#MySQL)
        - [Oracle](#Oracle)
        - [OceanBase](#OceanBase)
        - [MongoDB](#MongoDB)
    - [数据库操作框架](#数据库操作框架)
        - [DataSource](#DataSource)
        - [MyBatis](#MyBatis)
        - [MyBatis-Plus](#MyBatis-Plus)
        - [Hibernate](#Hibernate)
        - [ThinkJD](#ThinkJD)
        - [JOOQ](#JOOQ)
    - [数据库中间件](#数据库中间件)
        - [MyCat](#MyCat)
        - [Druid](#Druid)
        - [ShardingSphere](#ShardingSphere)
        - [Zdal](#Zdal)
    - [轻量级数据库](#轻量级数据库)
        - [H2](#H2)
        - [SQLite](#SQLite)
        - [Derby](#Derby)
        - [InfluxDB](#InfluxDB)
    - [数据迁移](#数据迁移)
        - [Yugong](#Yugong)
    - [Liquibase](#Liquibase)
    - [Otter](#Otter)
    - [数据库工具](#数据库工具)
        - [DataGrip](#DataGrip)
        - [Navicat](#Navicat)
        - [PL/SQL Developer](#PLSQL Developer)
        - [PL/SQL](#PLSQL)
- [大数据处理](#大数据处理)
    - [流处理](#流处理)
        - [Flink](#Flink)
        - [JStorm](#JStorm)
        - [Storm](#Storm)
        - [Flume](#Flume)
        - [Spark](#Spark)
        - [Beam](#Beam)
        - [Samza](#Samza)
        - [Hadoop](#Hadoop)
        - [HBase](#HBase)
        - [druid-io](#druid-io)
    - [搜索](#搜索)
        - [Elasticsearch](#Elasticsearch)
        - [Lucene](#Lucene)
        - [Solr](#Solr)
    - [Spider爬虫](#Spider爬虫)
        - [Jsoup](#Jsoup)
        - [Crawler4j](#Crawler4j)
- [SOFA](#SOFA)
    - [sofa-rpc](#sofa-rpc)
    - [sofa-mesh](#sofa-mesh)
    - [sofa-boot](#sofa-boot)
    - [sofa-bolt](#sofa-bolt)
    - [sofa-ark](#sofa-ark)
    - [sofa-jarslink](#sofa-jarslink)

- [Netflix](#Netflix)
    - [zuul2](#zuul2)
    - [zuul1](#zuul1)
    - [Eureka](#Eureka)
    - [Hystrix](#Hystrix)
    - [Ribbon](#Ribbon)
    - [Turbine](#Turbine)
    - [Archaius](#Archaius)
    - [Governator](#Governator)
- [Micronaut Framework](#Micronaut Framework)
    - [](#)
- [WebService](#WebService)
    - [](#)
- [测试](#测试)
    - [单元测试](#单元测试)
        - [JUnit](#JUnit)
        - [TestNG](#TestNG)
        - [Arquillian](#Arquillian)
    - [Mock测试](#Mock测试)
        - [Mockito](#Mockito)
        - [Spock](#Spock)
        - [Moco框架](#Moco框架)
    - [压力测试](#压力测试)
        - [JMeter](#JMeter)
        - [LoadRunner](#LoadRunner)
    - [自动化测试](#自动化测试)
        - [Selenium](#Selenium)
    - [基准测试](#基准测试)
        - [JMH](#JMH)
- [Golang](#Golang)
    - [](#)
- [Python](#Python)
    - [](#)
- [Lua](#Lua)
    - [](#)
- [C++/C](#C++C)
    - [](#)
- [前端开发](#前端开发)
    - [VueJS](#VueJS)
    - [Angular](#Angular)
    - [Bootstrap](#Bootstrap)
    - [ECharts](#ECharts)
    - [RequireJS](#RequireJS)
    - [zTree](#zTree)
    - [Layui](#Layui)
    - [JavaScript](#JavaScript)
- [读书和笔记](#读书和笔记)
    - [Java](#Java)
    - [数据库](#数据库)
    - [网络HTTP](#网络HTTP)
    - [Linux](#Linux)
    - [Netty](#Netty)
    - [Spring](#Spring)
    - [分布式](#分布式)
    - [架构设计](#架构设计)
    - [技术其他](#技术其他)
    - [英语](#英语)
    - [医学](#医学)
    - [历史](#历史)
    - [股票](#股票)
- [面试指南](#面试指南)
    - [备战面试](#备战面试)
    - [面经](#面经)
    - [常见的学习网站](#常见的学习网站)
    - [开源项目](#开源项目)
- [开发工具](#开发工具)
    - [基础工具](#基础工具)
        - [Git](#Git)
        - [Nexus](#Nexus)
    - [项目管理](#项目管理)
        - [Maven](#Maven)
        - [Gradle](#Gradle)
        - [Ant](#Ant)
        - [Ivy](#Ivy)
    - [代码扫描](#代码扫描)
        - [SonarQube](#SonarQube)
        - [PMD](#PMD)
        - [FindBugs](#FindBugs)
        - [Checkstyle](#Checkstyle)
    - [DevOps工具](#DevOps工具)
        - [Jenkins](#Jenkins)
- [待办](#待办)
- [说明](#说明)

---------------------------------------------------------------------------------------------------------------------
## Java

### 基础
* [基础](docs/java/XXX.md)

### 集合
* [集合](docs/java/XXX.md)

### 并发
* [并发](docs/java/XXX.md)

### JVM
* [JVM](docs/java/XXX.md)

### I/O
* [BIO,NIO,AIO 总结](docs/java/XXX.md)

### Java8 
* [Java 8 新特性总结](docs/java/What's%20New%20in%20JDK8/Java8Tutorial.md)
* [Java 8 学习资源推荐](docs/java/What's%20New%20in%20JDK8/Java8教程推荐.md)
* [Java8 forEach 指南](docs/java/What's%20New%20in%20JDK8/Java8foreach指南.md)


### Java9 
[quickstart-javase9]

### Java学习常见问题汇总 

###读书和笔记
* [Java 编程规范以及优雅 Java 代码实践总结](docs/java/Java编程规范.md)

---------------------------------------------------------------------------------------------------------------------
##MQ消息组件
[quickstart-mq]

### RocketMQ
* [RocketMQ](docs/java/XXX.md)

### ActiveMQ
* [ActiveMQ](docs/java/XXX.md)

### Kafka
* [Kafka](docs/java/XXX.md)

### RabbitMQ
* [RabbitMQ](docs/java/XXX.md)

### OpenMessaging
云原生，与供应商无关的开放式规范，用于分布式消息传递

### MQTT
* [MQTT](docs/java/XXX.md)

### msgframe
quickstart-msgframe-v1
quickstart-msgframe-v2

### Jafka
一个快速，简单的分布式发布-订阅消息系统（mq）

### Nanomsg
nanomsg是一个消息通信组件 - zeromq的作者之一用C语言重写的通信框架，

### OpenMQ
Open-MQ 是一个开源的消息中间件，类似IBM的 WebSphere MQ(MQSeries)，采用 C++ 和 Qt 库编写的，支持Windows、Unix 以及 Mac OS 平台，支持 JMS。

### ZeroMQ
ZeroMQ（简称ZMQ）是一个基于消息队列的多线程网络库，其对套接字类型、连接处理、帧、甚至路由的底层细节进行抽象，提供跨越多种传输协议的套接字。

### HiveMQ
HiveMQ的MQTT代理使以高效，快速和可靠的方式轻松地在连接的设备之间来回移动数据。

### HornetQ
HornetQ是一个开放源代码项目，用于构建多协议，可嵌入，非常高性能的集群异步消息传递系统。 

### Pulsar
Pulsar是一个分布式pub-sub消息平台，具有非常灵活的消息传递模型和直观的客户端API。

### Artemis
高性能，无阻塞的体系结构，用于下一代事件驱动的消息传递应用程序。

### activemq-apollo
支持STOMP协议，已经废弃

---------------------------------------------------------------------------------------------------------------------
##远程通讯和RPC框架
[quickstart-remoting]
[quickstart-rpc]

### Netty
* [Netty](docs/java/XXX.md)

### MINA
* [mina](docs/java/XXX.md)

### Hession
* [hessian](docs/java/XXX.md)

### t-io
* [t-io](docs/java/XXX.md)


### xSocket

### Grizzly

### Dubbo

### gRPC

### Thrift

### Finagle

### Jupiter

### Motan

### Tars

### HSF

### 自己实现simple RPC

---------------------------------------------------------------------------------------------------------------------
##容器
[quickstart-container]

### Docker
* [Docker](docs/java/XXX.md)

### Kubernetes
* [Kubernetes](docs/java/XXX.md)

### Istio
* [Istio](docs/java/XXX.md)

### Pouch

---------------------------------------------------------------------------------------------------------------------
##缓存和KV数据库
[quickstart-cache]

### Redis

### Memcached

### Caffeine
Caffeine缓存框架

### JetCache
JetCache是​​一种Java缓存抽象，可为各种缓存解决方案提供一致的使用。

### JCache
Java缓存规范JCache API（JSR107），它对Java对象缓存进行标准化，方便高效开发，让程序员摆脱实现缓存有效期、互斥、假脱机（spooling）和缓存一致性等负担。

### GuavaCache
Guava LocalCache 缓存

### ConcurrentLinkedHashMap
基于LRU（Least recently used，最近最少使用）算法来替换Map中的元素

### EhCache
EhCache 是一个纯Java的进程内缓存框架，具有快速、精干等特点，是Hibernate中默认的CacheProvider。

### Hazelcast
zelcast是一个高度可扩展的数据分发和集群平台，可用于实现分布式数据存储、数据缓存

### Codis
Redis 的集群解决方案有社区的，也有官方的，社区的解决方案有 Codis 和Twemproxy,官方的集群解决方案就是 Redis Cluster

### Tair
air是一个Key/Value结构数据的解决方案，它默认支持基于内存和文件的两种存储方式，分别和我们通常所说的缓存和持久化存储对应。

---------------------------------------------------------------------------------------------------------------------
##Reactive响应式编程
[quickstart-reactive]

### Reactor

### ReactiveX

### WebFlux

### RSocket

### Akka

### Ratpack

---------------------------------------------------------------------------------------------------------------------
##架构和设计


###设计模式

---------------------------------------------------------------------------------------------------------------------
##网络和HTTP
[quickstart-http]



---------------------------------------------------------------------------------------------------------------------
##Spring
###SpringBoot
[quickstart-spring-boot]
[quickstart-spring-boot2]

###SpringCloud
[quickstart-spring-cloud]
[quickstart-spring-cloud2]


###SpringMVC
[quickstart-spring-framework]


###SpringData
[quickstart-spring-data]

---------------------------------------------------------------------------------------------------------------------
##注册中心和配置中心
[quickstart-register]
[quickstart-config]

###注册中心
###ZooKeeper
###Nacos
###Etcd
###Consul
###ZKWeb

###配置中心
###Apollo
###Disconf
###XDiamond
###XXL-CONF

---------------------------------------------------------------------------------------------------------------------
##分布式

###分布式事务
* [分布式理论](docs/interview/分布式.md)

###分布式锁


###分布式ID


###分布式缓存



---------------------------------------------------------------------------------------------------------------------
##网关
网关、微服务
[quickstart-gateway]

###API服务网关
###Zuul2
###Zuul1
###Kong

###代理服务器
流量网关 或者 代理服务器 或者 负载均衡
###Nginx
###Tengine
###LittleProxy
###ApacheHTTP

###限流熔断
###Sentinel
###Resilience4j
###Eureka
###SnowJena
---------------------------------------------------------------------------------------------------------------------
##模块化和类隔离
[quickstart-modular]		模块化


###sofa-jarslink

###Pandora

###Java9
java9模块化开发

###JarsLink
阿里开源，已经合并到sofa-jarslink里面了


---------------------------------------------------------------------------------------------------------------------
##Linux


---------------------------------------------------------------------------------------------------------------------
##AIF项目
### 网关和能力开放平台OSP
* [gateway和osp](docs/java/XXX.md)

### 消息组件MsgFrame
* [消息组件MsgFrame](docs/java/XXX.md)

### 缓存Aicache
* [缓存Aicache](docs/java/XXX.md)

### 配置中心Amber
* [hessian](docs/java/XXX.md)

### 微服务治理框架CSF
* [微服务治理框架CSF](docs/java/XXX.md)

### 监控和跟踪Log4x和ISee
* [log4x和isee](docs/java/XXX.md)

### 调度ET(AISchedule)
* [ET(AISchedule)](docs/java/XXX.md)

### 服务编排Comframe
* [comframe](docs/java/XXX.md)

### 统一权限USPA
* [uspa](docs/java/XXX.md)

### 网管项目
自己做过的项目
[oss-example]		网管项目示例

---------------------------------------------------------------------------------------------------------------------
## 数据结构与算法


### 数据结构

### 算法

---------------------------------------------------------------------------------------------------------------------
## 应用容器
[quickstart-application-container]

### Jetty
### Tomcat
### Undertow
### JBoss
### Jersey
### QuickServer
### WebLogic
### WebSphere
---------------------------------------------------------------------------------------------------------------------
## 系统监控
[quickstart-monitor]	监控

### 进程监控
### Prometheus
### Zabbix

### 在线诊断工具
### JVM SandBox
### Anthas
### BTrace
### Greys-Anatomy
### HouseMD


---------------------------------------------------------------------------------------------------------------------
##常用框架
---------------------------------------------------------------------------------------------------------------------
##数据库
[quickstart-database]


###数据库产品
###MySQL
###Oracle
###OceanBase
###MongoDB


###数据库操作框架
###DataSource
###MyBatis
###MyBatis-Plus
###Hibernate
###ThinkJD
###JOOQ


###数据库中间件
###MyCat
###Druid
###ShardingSphere
###Zdal


###轻量级数据库
###H2
###SQLite
###Derby
###InfluxDB


###数据迁移
###Yugong


###Liquibase
###Otter


###数据库工具
###DataGrip
###Navicat
###PL/SQL Developer
###PL/SQL


---------------------------------------------------------------------------------------------------------------------
##大数据处理
[quickstart-data]		大数据、流式计算


###流处理
###Flink
###JStorm
###Storm
###Flume
###Spark
###Beam
###Samza
###Hadoop
###HBase
###druid-io


###搜索
###Elasticsearch
###Lucene
###Solr

###Spider爬虫

---------------------------------------------------------------------------------------------------------------------
##SOFA
[quickstart-sofa]

###sofa-rpc
###sofa-mesh
###sofa-boot
###sofa-bolt
###sofa-ark
###sofa-jarslink

---------------------------------------------------------------------------------------------------------------------
##Netflix
[quickstart-netflix]	netflix组件

---------------------------------------------------------------------------------------------------------------------
##Micronaut Framework
[quickstart-micronaut]	微服务框架micronaut

---------------------------------------------------------------------------------------------------------------------
##WebService
[quickstart-webservice]		webservice服务

quickstart-webservice-wink
quickstart-webservice-web
quickstart-webservice-spring-framework
quickstart-webservice-spring-boot
quickstart-webservice-resteasy3
quickstart-webservice-spring
quickstart-webservice-resteasy2
quickstart-webservice-jersey1
quickstart-webservice-jersey2
quickstart-webservice-jaxws
quickstart-webservice-cxf
quickstart-webservice-client
quickstart-webservice-axis2

---------------------------------------------------------------------------------------------------------------------
##测试
[quickstart-test]

###单元测试
###JUnit
###TestNG
###Arquillian


###Mock测试
###Mockito
###Spock
###Moco框架


###压力测试
###JMeter
###LoadRunner


###自动化测试
###Selenium

###基准测试
###JMH

---------------------------------------------------------------------------------------------------------------------
##Golang
[quickstart-golang]

---------------------------------------------------------------------------------------------------------------------
##Python
[quickstart-python]
---------------------------------------------------------------------------------------------------------------------
##Lua

---------------------------------------------------------------------------------------------------------------------
##C++/C
[quickstart-cpp]
---------------------------------------------------------------------------------------------------------------------
##前端开发
[quickstart-front]

###VueJS
###Angular
###Bootstrap
###ECharts
###RequireJS
###zTree
###Layui
###JavaScript
---------------------------------------------------------------------------------------------------------------------
##读书和笔记
1、[notes]学习笔记文档  
[youngzil.github.io]  

### Java
* [Effective Java中文版](docs/java/Effective Java中文版.md)
* [Java多线程编程核心技术](docs/java/Java多线程编程核心技术.md)
* [Java编程思想](docs/java/Java编程思想.md)
* [深入理解Java虚拟机 JVM高级特性与最佳实践](docs/java/深入理解Java虚拟机JVM高级特性与最佳实践.md)
* [码出高效：Java开发手册](docs/java/码出高效：Java开发手册.md)
* [Java程序性能优化](docs/java/)

### 数据库
* [深入浅出MyBatis技术原理与实战](docs/java/深入浅出MyBatis技术原理与实战.md)
* [高性能MySQL](docs/java/.md)
* [test](MQ_ADDRESS/README.md)


### 网络HTTP
* [图解 HTTP](docs/java/图解HTTP.md)
* [TCP/IP详解：卷一](docs/java/)


### Linux
* [鸟哥的Linux私房菜.md](docs/java/鸟哥的Linux私房菜.md)

### Netty
* [Netty权威指南](docs/java/Netty权威指南.md)

### Spring
* [Spring实战](docs/java/)

### 分布式
* [从PAXOS到ZOOKEEPER分布式一致性原理与实践](docs/java/从PAXOS到ZOOKEEPER分布式一致性原理与实践.md)
* [Zookeeper](docs/java/)

### 架构设计
* [代码整洁之道](docs/java/)
* [重构](docs/java/)
* [亿级网站架构核心技术](docs/java/)
* [可伸缩服务架构](docs/java/)

### 技术其他
* [阿里巴巴Java开发手册](docs/java/阿里巴巴Java开发手册.md)

### 英语

### 医学

### 历史

### 股票



##面试指南
###备战面试
* [面试学习网站](docs/interview/面试学习网站.md)


###面经

###常见的学习网站
* [开源组织和公司开源项目地址和网站](docs/interview/开源组织和公司开源项目地址和网站.md)
* [框架网站](docs/interview/框架网站.md)
* [其他学习网站](docs/interview/其他的学习网站.md)


###开源项目


---------------------------------------------------------------------------------------------------------------------
##开发工具
[quickstart-tools]

###基础工具
###Git
###Nexus


###项目管理
###Maven
###Gradle
###Ant
###Ivy


###代码扫描
###SonarQube
###PMD
###FindBugs
###Checkstyle

###DevOps工具
###Jenkins


---------------------------------------------------------------------------------------------------------------------
2、Java相关：

Java实例：
quickstart-example	Java代码示例
quickstart-javase


常用框架：
quickstart-apache-commons	apache-commons学习.md
quickstart-asm  字节码修改工具
quickstart-disruptor	无锁队列Disruptor
quickstart-crypto	加解密工具
quickstart-elastic-job	Elastic-Job 是一个分布式调度解决方案
quickstart-eaio-uuid	UUID工具类
quickstart-fastdfs	FastDFS是一个开源的分布式文件系统
quickstart-guava	Guava工具类
quickstart-guice	依赖注入框架
quickstart-hppc	Java集合类扩展

quickstart-machine-learning		机器学习相关
quickstart-mnemonic		Apache Mnemonic  是一个面向非易失性混合内存存储的库，它提出了一个非易失性/持久的 Java 对象模型和持久的计算服务，能显着提高了海量实时数据处理/分析的性能。 
quickstart-objenesis		Objenesis是一个专用于在创建对象时绕过构造函数的库。在任何JVM上都有。

quickstart-proxy	动态代理和静态代理，Java Agent，字节码工具等
quickstart-quartz	Quartz是一个开源的作业调度框架
quickstart-reflect	Java反射框架：reflections等

quickstart-servlet	Servlet3异步NIO
quickstart-string-compress	字符串压缩
quickstart-web	JavaWeb框架
quickstart-websocket	websocket协议使用

quickstart-velocity		Velocity是一个基于Java的模板引擎
quickstart-xbean		java XML解析
quickstart-xml
quickstart-xmlbeans
quickstart-yaml		yaml文件解析

quickstart-jool		jOOλ，Java lambdas和Stream API
quickstart-joor		jOOR - 更好地进行Java反射。
quickstart-joou		jOOU - 无符号整数，Object Oriented Unsigned无符号的
quickstart-joox		jOOX - 应用于W3C DOM的jQuery的强大功能

quickstart-json		json工具：fastjson、Gson、jackson等
quickstart-jvm-serializer	JVM序列化工具：jdk、fst、kryo、hession、thrift等
quickstart-logging	日志框架：logback、log4j2、log4j、jul

quickstart-lombok	lombok框架
quickstart-jctools	JCTools是一款对jdk并发数据结构进行增强的并发工具，主要提供了map以及queue的增强数据结构。
quickstart-jgit	Java git工具
quickstart-jython	Jython是一种完整的语言，而不是一个Java翻译器或仅仅是一个Python编译器，它是一个Python语言在Java中的完全实现。
quickstart-linux	Linux命令、Shell脚本等
quickstart-proguard		Java混淆器 ProGuard，我们通常说的proguard包括四个功能，shrinker（压缩）, optimizer（优化）,obfuscator（混淆）,preverifier（预校验）。


设计模式和lintcode等：
quickstart-design-pattern	设计模式和代码示例
quickstart-code	lintcode等刷题、剑指Offer


微服务、Web框架
quickstart-dropwizard	Dropwizard与Spring Boot类似，也是构建微服务可选的工具
quickstart-jfinal	JAVA 极速WEB+ORM框架 JFinal
quickstart-plexus	Plexus——Spring之外的IoC容器
quickstart-servicecomb	ServiceComb 是华为开源的一套包含代码框架生成，服务注册发现，负载均衡，服务可靠性（容错熔断，限流降级，调用链追踪）等功能的微服务框架。



其他语言：
Java和Kotlin、Groovy、Scala的代码和相互调用
/Users/yangzl/git/quickstart-framework/quickstart-kotlin
quickstart-groovy
quickstart-kotlin
quickstart-scala

quickstart-lua	lua脚本语言


---------------------------------------------------------------------------------------------------------------------
[notes]:https://github.com/youngzil/notes
[oss-example]:https://github.com/youngzil/oss-example
[quickstart-all]:https://github.com/youngzil/quickstart-all
[quickstart-application-container]:https://github.com/youngzil/quickstart-application-container
[quickstart-cache]:https://github.com/youngzil/quickstart-cache
[quickstart-config]:https://github.com/youngzil/quickstart-config
[quickstart-container]:https://github.com/youngzil/quickstart-container
[quickstart-cpp]:https://github.com/youngzil/quickstart-cpp
[quickstart-data]:https://github.com/youngzil/quickstart-data
[quickstart-database]:https://github.com/youngzil/quickstart-database
[quickstart-framework]:https://github.com/youngzil/quickstart-framework
[quickstart-front]:https://github.com/youngzil/quickstart-front
[quickstart-gateway]:https://github.com/youngzil/quickstart-gateway
[quickstart-golang]:https://github.com/youngzil/quickstart-golang
[quickstart-http]:https://github.com/youngzil/quickstart-http
[quickstart-javase9]:https://github.com/youngzil/quickstart-javase9
[quickstart-micronaut]:https://github.com/youngzil/quickstart-micronaut
[quickstart-modular]:https://github.com/youngzil/quickstart-modular
[quickstart-monitor]:https://github.com/youngzil/quickstart-monitor
[quickstart-mq]:https://github.com/youngzil/quickstart-mq
[quickstart-netflix]:https://github.com/youngzil/quickstart-netflix
[quickstart-python]:https://github.com/youngzil/quickstart-python
[quickstart-reactive]:https://github.com/youngzil/quickstart-reactive
[quickstart-register]:https://github.com/youngzil/quickstart-register
[quickstart-remoting]:https://github.com/youngzil/quickstart-remoting
[quickstart-rpc]:https://github.com/youngzil/quickstart-rpc
[quickstart-sofa]:https://github.com/youngzil/quickstart-sofa
[quickstart-spring-boot]:https://github.com/youngzil/quickstart-spring-boot
[quickstart-spring-boot2]:https://github.com/youngzil/quickstart-spring-boot2
[quickstart-spring-cloud]:https://github.com/youngzil/quickstart-spring-cloud
[quickstart-spring-cloud2]:https://github.com/youngzil/quickstart-spring-cloud2
[quickstart-spring-data]:https://github.com/youngzil/quickstart-spring-data
[quickstart-spring-framework]:https://github.com/youngzil/quickstart-spring-framework
[quickstart-test]:https://github.com/youngzil/quickstart-test
[quickstart-tools]:https://github.com/youngzil/quickstart-tools
[quickstart-webservice]:https://github.com/youngzil/quickstart-webservice
[youngzil.github.io]:https://github.com/youngzil/youngzil.github.io

---------------------------------------------------------------------------------------------------------------------


