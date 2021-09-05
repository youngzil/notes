- [敏捷开发](#敏捷开发)
  - [敏捷宣言](#敏捷宣言)
- [敏捷软件开发](#敏捷软件开发)
- [DevOps](#DevOps)
- [AIOps](#AIOps)
- [GitOps](#GitOps)
- [CI和CD](#CI和CD)
- [SRE](#SRE)








---------------------------------------------------------------------------------------------------------------------
## 敏捷开发

极限编程（Extreme Programming，XP）、Scrum、DSDM、自适应软件开发、Crystal、特征驱动开发（Feature-Driven Development，FDD）、实用主义编程。


参考  
[20 年起义，敏捷已死，敏捷万岁](https://www.infoq.cn/article/lmiNQOS6f4lI6fWzGRD5)

### 敏捷宣言

敏捷宣言（Agile Manifesto，敏捷软件开发）

《敏捷软件开发宣言》（Agile Software Development Manifesto）
[Manifesto for Agile Software Development](https://agilemanifesto.org/iso/en/manifesto.html)
[敏捷软件开发宣言](https://agilemanifesto.org/iso/zhchs/manifesto.html)


我们身体力行同时帮助他人来探索开发软件的更佳方式，进而认可下列价值：
- 个体和互动高于过程和工具。（Individuals and interactions over processes and tools.）
- 可工作的软件高于详尽的文档。（Working software over comprehensive documentation.）
- 客户合作高于合同谈判。（Customer collaboration over contract negotiation.）
- 响应变化高于遵循计划。（Responding to change over following a plan.）


也就是说，尽管右项有其价值，我们更重视左项的价值。



---------------------------------------------------------------------------------------------------------------------

## DevOps


DevOps: Development和Operations的组合

可以把DevOps看作开发（软件工程）、技术运营和质量保障（QA）三者的交集。
Development：Software Engineering
QA：Quality Assurance
Technology Operations



DevOps 是 Development 和 Operations 的合成词，其目标是要加强开发人员、测试人员、运维人员之间的沟通协调。如何实现这一目标呢？需要我们的项目做到持续集成、持续交付、持续部署。

时下流行的 Jenkins、Bamboo，就是两款优秀的持续集成工具。而 Docker 容器则为 DevOps 提供了强大而有效的统一环境。

什么是 DevSecOps？
「DevSecOps」 的作用和意义建立在「每个人都对安全负责」的理念之上，其目标是在不影响安全需求的情况下快速的执行安全决策，将决策传递至拥有最高级别环境信息的人员。




DevOps（Development和Operations的组合词）是一组过程、方法与系统的统称，用于促进开发（应用程序/软件工程）、技术运营和质量保障（QA）部门之间的沟通、协作与整合。
它是一种重视“软件开发人员（Dev）”和“IT运维技术人员（Ops）”之间沟通合作的文化、运动或惯例。透过自动化“软件交付”和“架构变更”的流程，来使得构建、测试、发布软件能够更加地快捷、频繁和可靠。
它的出现是由于软件行业日益清晰地认识到：为了按时交付软件产品和服务，开发和运维工作必须紧密合作。


DevOps对应用程序发布的影响
在很多企业中，应用程序发布是一项涉及多个团队、压力很大、风险很高的活动。然而在具备DevOps能力的组织中，应用程序发布的风险很低，原因如下 [1]  ：
（1）减少变更范围
与传统的瀑布式开发模型相比，采用敏捷或迭代式开发意味着更频繁的发布、每次发布包含的变化更少。由于部署经常进行，因此每次部署不会对生产系统造成巨大影响，应用程序会以平滑的速率逐渐生长。

（2）加强发布协调
靠强有力的发布协调人来弥合开发与运营之间的技能鸿沟和沟通鸿沟；采用电子数据表、电话会议、即时消息、企业门户（wiki、sharepoint）等协作工具来确保所有相关人员理解变更的内容并全力合作。

（3）自动化
强大的部署自动化手段确保部署任务的可重复性、减少部署出错的可能性。
与传统开发方法那种大规模的、不频繁的发布（通常以“季度”或“年”为单位）相比，敏捷方法大大提升了发布频率（通常以“天”或“周”为单位）



DevOps开发模式|DevOps是什么|DevOps 工具|敏捷开发 DevOps 

实现DevOps需要什么？
硬性要求：工具上的准备

上文提到了工具链的打通，那么工具自然就需要做好准备。现将工具类型及对应的不完全列举整理如下：
代码管理（SCM）：GitHub、GitLab、BitBucket、SubVersion
构建工具：Ant、Gradle、maven
自动部署：Capistrano、CodeDeploy
持续集成（CI）：Bamboo、Hudson、Jenkins
配置管理：Ansible、Chef、Puppet、SaltStack、ScriptRock GuardRail
容器：Docker、LXC、第三方厂商如AWS
编排：Kubernetes、Core、Apache Mesos、DC/OS
服务注册与发现：Zookeeper、etcd、Consul
脚本语言：python、ruby、shell
日志管理：ELK、Logentries
系统监控：Datadog、Graphite、Icinga、Nagios
性能监控：AppDynamics、New Relic、Splunk
压力测试：JMeter、Blaze Meter、loader.io
预警：PagerDuty、pingdom、厂商自带如AWS SNS
HTTP加速器：Varnish
消息总线：ActiveMQ、SQS
应用服务器：Tomcat、JBoss
Web服务器：Apache、Nginx、IIS
数据库：MySQL、Oracle、PostgreSQL等关系型数据库；cassandra、mongoDB、redis等NoSQL数据库
项目管理（PM）：Jira、Asana、Taiga、Trello、Basecamp、Pivotal Tracker

在工具的选择上，需要结合公司业务需求和技术团队情况而定。（注：更多关于工具的详细介绍可以参见此文：51 Best DevOps Tools for #DevOps Engineers）




参考
https://www.jianshu.com/p/c5d002cf25b9
[DevOps wiki](https://zh.wikipedia.org/wiki/DevOps)



---------------------------------------------------------------------------------------------------------------------
## 敏捷软件开发

敏捷软件开发（英语：Agile software development）
敏捷开发（Agile）是一种以人为核心、迭代、循序渐进的开发方法。



简单地来说，敏捷开发并不追求前期完美的设计、完美编码，而是力求在很短的周期内开发出产品的核心功能，尽早发布出可用的版本。然后在后续的生产周期内，按照新需求不断迭代升级，完善产品。

敏捷软件开发（英语：Agile software development），又称敏捷开发，是一种从1990年代开始逐渐引起广泛关注的新型软件开发方法，是一种能应对快速变化需求的软件开发能力。
它们的具体名称、理念、过程、术语都不尽相同，相对于“非敏捷”，更强调程序员团队与业务专家之间的紧密协作、面对面的沟通（认为比书面的文档更有效）、频繁交付新的软件版本、紧凑而自我组织型的团队、能够很好地适应需求变化的代码编写和团队组织方法，也更注重软件开发过程中人的作用。





四条原则：
1、递增，而不是连续的
2、避免不必要的开销
3、协作
4、说真话

递增，而不是连续的：如果开发实践是真正的敏捷精神，那么交付的工作软件是一小部分一小部分递增的。不必等到一个阶段完全完成后才开始另一个，工作也不是向大的发布日期而努力。完成的工作，但并不是业务最终期限，驱动着敏捷交付。但敏捷精神也承认业务操纵着最后截止日期。

避免不必要的开销：如果实践仍然是真正的敏捷精神，那么团队就致力于尽可能多地减少项目计划和文档。与其讨论要做什么，然后再写下来，不如赶紧动手去做，否则，就是在浪费时间在工作的工作上。在工作对工作中，敏捷精神有利于实际的工——作交付工作软件。而且它也值面对面的交流通过邮件和其他书面文件。

协作：根据需求，团队成员一直与其它人进行交互，以及一些外部利益相关者。在敏捷教练世界中，整个团队的负责人Lisa Crispin能够解决所有问题，在问题出现之前 。真正的敏捷精神团队是自助的。他们分配需要做的工作。虽然每个成员承担的任务都在他们的专业技能范围内，他们还是需要与团队协作的。没有人的工作是孤立的，也没有团队本身是独立工作的。没有业务利益相关者，以及诸如用户体验方面的外部专家的重大投入，团队就不可能使项目向前发展，

说真话：为了保证真正的敏捷，团队探讨的与项目相关的一切都要是真实的。在一些至关重要的专业领域，如冲刺测试的编码技能，他们承认存在差距。关于实际生产力，他们的要讲事实；这也就是说，在y时间内，团队是否有能力做到x。他们承认错误。说真话是一项挑战，因为他们害怕承认缺点会让他们显得很弱。但敏捷精神知道说出事实需要勇气。承认问题需要信心，然后快速地去解决问题。 [1]




敏捷方法有时候被误认为是无计划性和纪律性的方法，实际上更确切的说法是敏捷方法强调适应性而非预见性。
适应性的方法集中在快速适应现实的变化。当项目的需求起了变化，团队应该迅速适应。这个团队可能很难确切描述未来将会如何变化.

对比迭代方法
相比迭代式开发两者都强调在较短的开发周期提交软件，敏捷方法的周期可能更短，并且更加强调队伍中的高度协作。

对比瀑布式开发
两者没有很多的共同点，瀑布模型式是最典型的预见性的方法，严格遵循预先计划的需求、分析、设计、编码、测试的步骤顺序进行。步骤成果作为衡量进度的方法，例如需求规格，设计文档，测试计划和代码审阅等等。
瀑布式的主要的问题是它的严格分级导致的自由度降低，项目早期即作出承诺导致对后期需求的变化难以调整，代价高昂。瀑布式方法在需求不明并且在项目进行过程中可能变化的情况下基本是不可行的。
相对来讲，敏捷方法则在几周或者几个月的时间内完成相对较小的功能，强调的是能将尽早将尽量小的可用的功能交付使用，并在整个项目周期中持续改善和增强。 [2]



列入敏捷方法的有：
软件开发之韵，Software Development Rhythms
敏捷数据库技术，AD/Agile Database Techniques
敏捷建模，AM/Agile Modeling
自适应软件开发，ASD/Adaptive Software Development
水晶方法，Crystal
特性驱动开发，FDD/Feature Driven Development
动态系统开发方法，DSDM/Dynamic Systems Development Method
精益软件开发，Lean Software Development
AUP（Agile Unified Process）
Scrum
XBreed
极限编程，XP Extreme Programming
探索性测试 [2]


敏捷技术编辑
测试驱动开发，TDD/Test-Driven Development
行为驱动开发，BDD/Bahavior-Driven Development
Scrum [2]



SCRUM 则是一种开发流程框架，也可以说是一种套路。
SCRUM 框架中包含三个角色，三个工件，四个会议，听起来很复杂，其目的是为了有效地完成每一次迭代周期的工作。在这里我们重点讨论的是 SCRUM。

SCRUM 的工作流程
学习 Scrum 之前，我们先要了解几个基本术语：
Sprint：冲刺周期，通俗的讲就是实现一个“小目标”的周期。一般需要 2-6 周时间。
User Story：用户的外在业务需求。拿银行系统来举例的话，一个 Story 可以是用户的存款行为，或者是查询余额等等。也就是所谓的小目标本身。
Task：由 User Story 拆分成的具体开发任务。
Backlog：需求列表，可以看成是小目标的清单。分为 Sprint Backlog 和 Product Backlog。
Daily meeting：每天的站会，用于监控项目进度。有些公司直接称其为 Scrum。
Sprint Review meeting: 冲刺评审会议，让团队成员们演示成果。
Sprint burn down：冲刺燃尽图，说白了就是记录当前周期的需求完成情况。
Release：开发周期完成，项目发布新的可用版本。




参考
https://blog.csdn.net/csdn15556927540/article/details/90712308



---------------------------------------------------------------------------------------------------------------------
## CI和CD
持续集成Continuous Integration (CI) && 持续交付Continuous Delivery (CD)
持续测试Continuous Testing 和 持续部署Continuous Deployment


工厂里的装配线以快速、自动化、可重复的方式从原材料生产出消费品。同样，软件交付管道以快速、自动化和可重复的方式从源代码生成发布版本。
如何完成这项工作的总体设计称为“持续交付”（CD）。
启动装配线的过程称为“持续集成”（CI）。
确保质量的过程称为“持续测试(CT)”，
将最终产品提供给用户的过程称为“持续部署(CD)”。
一些专家让这一切简单、顺畅、高效地运行，这些人被称为运维开发DevOps践行者。



“持续”是什么意思？
“持续”用于描述遵循我在此提到的许多不同流程实践。这并不意味着“一直在运行”，而是“随时可运行”。在软件开发领域，它还包括几个核心概念/最佳实践。这些是：
频繁发布：。。。
自动化流程：。。。
可重复：。。。
快速迭代：。。。



参考
https://blog.csdn.net/guofangsky/article/details/89684857


---------------------------------------------------------------------------------------------------------------------
## AIOps

AIOps 使用人工智能来简化 IT 运营管理，并在复杂的现代 IT 环境中加速和自动化问题解决。





[AIOps](https://www.ibm.com/cloud/learn/aiops)
[What Is AIOps? A Beginner’s Guide](https://www.bmc.com/blogs/what-is-aiops/)
[What is AIOps?](https://www.moogsoft.com/resources/aiops/guide/everything-aiops/)



---------------------------------------------------------------------------------------------------------------------
## GitOps

GitOps 是一种持续交付的方式。它的核心思想是将应用系统的声明性基础架构和应用程序存放在 Git 版本库中。

将 Git 作为交付流水线的核心，每个开发人员都可以提交拉取请求（Pull Request）并使用 Git 来加速和简化 Kubernetes 的应用程序部署和运维任务。通过使用像 Git 这样的简单工具，开发人员可以更高效地将注意力集中在创建新功能而不是运维相关任务上（例如，应用系统安装、配置、迁移等）。



[GitOps | 一种云原生的持续交付模型](https://juejin.cn/post/6844903665187160072)

[GitOps 初探](https://segmentfault.com/a/1190000019809452)
[Gitops入门到精通（1）概念篇](https://zhuanlan.zhihu.com/p/339726600)
[最全的GitOps工具选型，30+款工具随你挑](https://cloud.tencent.com/developer/news/710975)
[GitOps：一款基于Kubernetes的高速CI/CD框架](http://dockone.io/article/3450)
[21 个运维必知领域之「GitOps」](https://www.infoq.cn/article/z653ttpzar2vrxgxgpt1)
[What is GitOps?](https://about.gitlab.com/topics/gitops/)





---------------------------------------------------------------------------------------------------------------------
## SRE

SRE (Site Reliability Engineering)运维

SRE 是谷歌提出的实践，旨在保障互联网服务的稳定性和性能；而广受应用的微服务架构，几乎是大家保持研发效率的唯一方法。

自动化是 SRE 角色与传统运营团队之间的一个区别。



SRE的怎么来的？

10多年前，谷歌出现了一种新的岗位叫做SRE，它重视运维人员的开发能力，要求运维工作在50%以内，另外50%精力开发自动化工具减少人力需求，谷歌的这种模式大获成功，不仅解决了运维和开发之间的矛盾，还降低了人力成本，这个岗位发展到现在有1000名以上的SRE！这就是SRE的历史起源。

SRE的方法论是什么？

谷歌的一名SRE出了一本书叫《SRE：Google运维解密》，通过这本书，我们知道了谷歌SRE的一些方法论：
1、运维工作50%，另外50%精力用于开发自动化工具；
2、保障服务的前提下最大化迭代速度，不追求100%可靠性；
3、通过监控预案缩短平均恢复时间MTTR；
4、部署变更管理：渐进发布，精确检测，安全回滚；
……

从这里我们就可以看出传统运维和SRE的区别了：相对传统运维，SRE重视开发，重视效率，追求自动化，专注于整个软件系统的生命周期管理。

总体来说，SRE就是运维开发一体化的一套方法论，而在国内这种运维开发一体化的模式叫做Devops。




[SRE和运维的区别是什么？](https://www.zhihu.com/question/58721069)
[SRE 工程师到底是做什么的？](https://www.infoq.cn/article/oklq_1ts0b2q7gfdubak)
[21 个运维必知领域之「SRE」](https://www.infoq.cn/article/tbrbL5T2djWylxQSEBWj)
