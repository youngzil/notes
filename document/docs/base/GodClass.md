万能类/上帝类(God Class)
       万能类通常也认为是一种设计缺陷，它指的在系统中集多种功能于一身的类，它试图成为整个系统的中心。一个万能类承担了太多的职责，而只将很少的功能委托给其他不重要的类，并且万能类还需要从其他类那里获取数据。
       与依恋情节相同，2006年，Lanza和Marinescu还提出了一种通过计算三种度量指标来探测万能类的方法，这三种度量指标如下：
       (1) 加权方法计数(Weighted Method Count, WMC)： 一个类中所有方法的统计复杂度的和。
       (2) 类内聚的紧密度(Tight Class Cohesion, TCC)：通过访问相同的属性而直接发生联系的方法个数。
       (3) 访问外部数据个数(Access to Foreign Data, ATFD)：对于一个给定的类，它所访问的外部类的个数，它可以直接访问这些外部类的属性，也可以通过访问器方法(Accessor Method)访问这些属性。
       在Lanza和Marinescu的方法中，当一个类满足如下条件时它就是一个万能类：
		WMC ≥ VERY_HIGH∧ATFD > FEW ∧TCC < 1/3
       在此，Lanza和Marinescu设定VERY_HIGH的值为47，FEW的值为5，在他们的Object-Oriented Metrics in Practice一书中详细描述了这两个值是怎么获得的。
       iPlasma和inFusion采用了上述规则来识别万能类。JDeodorant通过其他类来判断一个类是否是万能类，并提出了Extract Class（提取类）的重构时机识别方法，这种探测方法与一个类本身的规模没有直接关系。

六种可定量分析的代码味道
http://blog.csdn.net/lovelion/article/details/18943893


看了一篇关于判断一个类是不是God Class上帝类的文章，说到一个类同时满足以下3个条件就是上帝类：
1、CPFD (Capsules Providing Foreign Data) 从多个不相关类（模块）中引用数据。
2、WOC (Weighted Operation Count) 类的所有函数的圈复杂度之和超过65。
3、TCC (Tight Capsule Cohesion) TCC < 1/3 类需要具有低内聚的特性（类中直接相关的方法与全部方法之比小于1/3），也就是较少的private方法。



中文名 上帝类 外文名 God Class 领域 Java 别称 Object类
在Java中任何一个对象都有上帝类（object类）中定义的方法。
构造器第一行有super(),那么Father类的构造器super()调用到谁的构造器了呢？任何一个类，如果没有写extends XXX 都是默认extends Object，这也就是我们俗称的上帝类。
任何类都是Object的子类：如果没有写extends XXX 默认继承Object。

