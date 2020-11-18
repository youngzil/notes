分布式链路跟踪系统  

APM系统，全称是（Application Performance Monitor，当然也有叫 Application Performance Management tools）  

APM工具：
1. [SkyWalking](#SkyWalking参考)  
2. [CAT](#CAT参考)  
3. [Zipkin](#Zipkin参考)：是一套基于 Google Dapper 的分布式链路调用的监控系统。  
4. [Pinpoint](#Pinpoint参考)  
5. [Sleuth](#Sleuth参考)：是 Spring Cloud 在分布式系统中提供链路追踪解决方案  
6. [Jaeger](#OpenTracing和Jaeger参考)：OpenTracing接口规范  
7. [SOFATracer](#SOFATracer参考)：蚂蚁金服分布式链路跟踪组件  
8. [X-Trace](#X-Trace参考)：十年不更新了。。。  
9. [HTrace](#HTrace参考): 3年多不更新了。。。。  
10. [Magpie](#)：资料找不到。。。  



那里有很多工具和框架（Zabbix，Nagious），但是大多数都有GPL许可，这使得它们无法与商业产品一起使用。其他的则具有有限的图表（JavaMelody），并且不支持或很少支持集群数据聚合。

[五大最佳开源java性能监控工具](https://www.cnblogs.com/wuchangsoft/p/9766488.html)  
[9大免费Java流程监控工具](https://developer.51cto.com/art/201906/598396.htm)  


[Google的Dapper论文](#Google的Dapper论文参考)


 
[全链路跟踪系统(一):理论篇](https://zhonghua.io/2017/10/14/hunter-1/)  
[全链路跟踪系统(二):实践篇](https://zhonghua.io/2017/11/19/hunter-2/)  
[解锁APM(Pinpoint）入门与实战](https://zhuanlan.zhihu.com/p/43599131)  


## SkyWalking参考   
[SkyWalking官网](https://skywalking.apache.org/)  
[SkyWalking Github](https://github.com/apache/skywalking)  




## CAT参考  
[CAT官网](https://github.com/dianping/cat)  




## Zipkin参考  
[Zipkin官网](https://zipkin.io/pages/quickstart)  
[Zipkin Github](https://github.com/openzipkin/zipkin)  




## Pinpoint参考  
[Pinpoint官网](https://github.com/naver/pinpoint)  
[Pinpoint文档](https://naver.github.io/pinpoint/)  
[分布式跟踪工具Pinpoint技术入门](http://www.herohuang.com/2017/03/01/apm-pinpoint/)  




## Sleuth参考  
[Sleuth官网](https://docs.spring.io/spring-cloud-sleuth/docs/current-SNAPSHOT/reference/html/)  
[Spring Cloud 参考文档（Spring Cloud Sleuth介绍）](https://segmentfault.com/a/1190000018986743)  
[Spring Cloud 参考文档（Spring Cloud Sleuth特性）](https://segmentfault.com/a/1190000019017973)  


## Stagemonitor
an open source solution to application performance monitoring for java server applications  
Java服务器应用程序的应用程序性能监视的开源解决方案

Stagemonitor is a Java monitoring agent that tightly integrates with time series databases like Elasticsearch, Graphite and InfluxDB to analyze graphed metrics and Kibana to analyze requests and call stacks. It includes preconfigured Grafana and Kibana dashboards that can be customized.  
Stagemonitor是一个Java监视代理，它与时间序列数据库（例如Elasticsearch，Graphite和InfluxDB）紧密集成，以分析图形化指标，而Kibana则用于分析请求和调用堆栈。 它包括可以自定义的预配置Grafana和Kibana仪表板。

[Stagemonitor官网](https://www.stagemonitor.org/)  
[Stagemonitor文档](https://github.com/stagemonitor/stagemonitor/wiki/Installation)  
[Stagemonitor Github](https://github.com/stagemonitor/stagemonitor)  






## MoSKito

[MoSKito官网](https://www.moskito.org/)  
[MoSKito Github](https://github.com/anotheria/moskito)  
[MoSKito-Control Github](https://github.com/anotheria/moskito-control)  
[MoSKito-Central Github](https://github.com/anotheria/moskito-central)  
[moskito-control-agent Github](https://github.com/anotheria/moskito-control-agent)  


MoSKito is an open source system for monitoring performance and behavior of Java web applications.  
MoSKito是一个开源系统，用于监视Java Web应用程序的性能和行为。

Monitoring for Java applications. Complete ecosystem for DevOps. Free & open source  
监视Java应用程序。完整的DevOps生态系统。免费和开源




## Kamon

[Kamon官网](https://kamon.io/)  
[Kamon Github](https://github.com/kamon-io/Kamon)  

Distributed Tracing, Metrics and Context Propagation for application running on the JVM  
在JVM上运行的应用程序的分布式跟踪，度量和上下文传播

Kamon is a set of tools for instrumenting applications running on the JVM.  
Kamon是一套工具，用于检测在JVM上运行的应用程序。 





## Glowroot

[Glowroot](https://glowroot.org/)  
[Glowroot Github](https://github.com/glowroot/glowroot)  


Easy to use, very low overhead, Java APM  
易于使用，开销极低，Java APM





## SOFATracer参考  
[蚂蚁金服分布式链路跟踪组件 SOFATracer 总览|剖析](https://www.sofastack.tech/blog/sofa-tracer-overview/) 




## OpenTracing和Jaeger参考  

OpenTracing 最重要的意义在于提供了一系列统一的接口规范, 用户需要根据自身系统的需要, 对特定语言的目标跟踪组件进行具体的实现. 

Uber工程团队的开源分布式追踪系统Jaeger自2016年起，在公司内部实现了大范围的运用, Jaeger正是基于OpenTracing标准, 同时Uber内部也是多语言系统, 包括Node.js、Python、Go和Java, 这给我们自研全链路跟踪系统树立了很好的榜样.

[Jaeger Documentation](https://www.jaegertracing.io/docs/1.19/)  
[Jaeger github](https://github.com/jaegertracing/jaeger)  
[Uber的分布式追踪演进](https://eng.uber.com/distributed-tracing/)  
[Jaeger加入CNCF基金会](https://www.cncf.io/blog/2017/09/13/cncf-hosts-jaeger/)  




Google的Dapper论文参考  
[Dapper论文](https://storage.googleapis.com/pub-tools-public-publication-data/pdf/36356.pdf)  
[Dapper论文本地地址](dapper分布式跟踪系统原文.pdf)  
[Dapper论文翻译版](https://bigbully.github.io/Dapper-translation/)  
[Dapper论文翻译版Github地址](https://github.com/bigbully/Dapper-translation)  

博客参考  
https://www.cnblogs.com/xiaoqi/p/apm.html  
https://blog.csdn.net/vking_wang/article/details/89203639  
https://blog.csdn.net/qq_41618510/article/details/86500806  
https://cloud.tencent.com/developer/article/1425181  




## HTrace参考  
[HTrace官网](http://htrace.org/)  
[HTrace Apache](http://incubator.apache.org/projects/htrace.html)  
[HTrace Github](https://github.com/apache/incubator-retired-htrace)  




## X Trace参考  
[X-Trace官网](http://www.x-trace.net/wiki/doku.php)  
[X-Trace Github](https://github.com/rfonseca/X-Trace)  




