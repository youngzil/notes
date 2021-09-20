目前微服务的开发框架，最常用的有以下四个：
- Spring Cloud：http://projects.spring.io/spring-cloud（现在非常流行的微服务架构）
- Dubbo：http：//dubbo.io
- Dropwizard：http://www.dropwizard.io （关注单个微服务的开发）
- Consul、etcd&etc.（微服务的模块）


Spring Cloud
JAVA系响应式编程的工具包Vert.x
SparkJava
Micronaut
Javalin
Quarkus




JAVA系微服务框架No1-Spring Cloud
介绍
有Spring大靠山在，更新、稳定性、成熟度的问题根本不需要考虑。在JAVA系混的技术人员大约都听说过Spring的大名吧，所以不缺程序员……，而且这入手的难度十分低，完全可以省去一个架构师。
但是，你必然在服务器上付出：

至少一台“服务发现 ”的服务器；
可能有一个统一的网关Gateway;
可能需要一个用于“分布式配置管理”的配置中心；
可能进行“服务追踪”，知道我的请求从哪里来，到哪里去；
可能需要“集群监控”；
项目上线后发现，我们需要好多服务器，每次在集群中增加服务器时，都感觉心疼；



JAVA系响应式编程的工具包Vert.x
介绍
背靠Eclipse的Eclipse Vert.x是一个用于在JVM上构建响应式应用程序的工具包。定位上与SprintBoot不冲突，甚至可以将Vert.x结合SprintBoot使用。众多Vert.x模块提供了大量微服务的组件，在很多人眼里是一种微服务架构的选择。
华为微服务框架Apache ServiceComb就是以Vert.x为底层框架实现的，在"基准测试网站TechEmpower"中，Vert.x的表现也十分亮眼。




JAVA系其他微服务框架

SparkJava

jar比较小，大约10M
占内存小，大约30~60MB；
性能还可以，与SprintBoot相仿；




Micronaut

Grails团队新宠；
可以用 Java、Groovy 和 Kotlin 编写的基于微服务的应用程序；
相比SprintBoot已经比较全面；
性能较优，编码方式与SprintBoot比较类似；
启动时间和内存消耗方面比其他框架更高效；
多语言；
依赖注入；
内置多种云本地功能；
很新，刚发布1.0.0




Javalin

上手极为容易；
灵活，可以兼容同步和异步两种编程思路；
JAR小，4～5M；
多语言；
有KOA的影子；
只有大约2000行源代码，源代码足够简单，可以理解和修复；
符合当今趋势；
多语言；
嵌入式服务器Jetty；



Quarkus

启动快；
JAR小，大约10M；
文档很少；

作者：襄垣
链接：https://juejin.im/post/5c89f266f265da2d8763b5f9
来源：掘金
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。



