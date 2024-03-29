# Reactive响应式编程

[反应式编程](https://github.com/youngzil/quickstart-reactive)
  
---------------------------------------------------------------------------------------------------------------------  
## 

响应式编程是一种处理异步数据流的规范
响应式为数据流的转换和聚合以及数据流的控制管理提供了工具支持


响应式编程的基础：数据流的概念、Observable 类和它的各种操作以及通过工厂方法创建静态和动态的 Observable 对象。

Observable 是事件的源头，Observer 提供了一组简单的接口，并通过订阅事件源来消费 Observable 的事件。
Observable 通过 onNext 向 Observer 通知事件的到达，后面可能会跟上 onError 或 onComplete 来表示事件的结束。


Reactive Streams（以下简称为 RS）是“一种规范，它为基于非阻塞回压的异步流处理提供了标准”。它是一组包含了 TCK 工具套件和四个简单接口（Publisher、Subscriber、Subscription 和 Processor）的规范，这些接口将被集成到 Java 9.



响应式框架：
- 1、Java 8 Stream API 和 CompletableFuture
  RxJava 选择了 Java 6，而 Java 6 里没有 java.util.function 包，RxJava 也就无法利用这个包下面的 Functino 类和 Consumer 类，所以它必须创建很多类似 Func1、Func2、Action0、Action1 这样的类。
- 2、RxJava2 使用类似 Reactor 2 的方式把这些类作为 java.util.function 的镜像，因为它还得支持 Java 7。
- 3、Reactor 是基于 Java 8 的，所以在大部分情况下，Stream API 已经能够满足需求了。





---------------------------------------------------------------------------------------------------------------------  
## 


---------------------------------------------------------------------------------------------------------------------  
## 


---------------------------------------------------------------------------------------------------------------------  
## 


---------------------------------------------------------------------------------------------------------------------  
## 

---------------------------------------------------------------------------------------------------------------------  


Reactive Programming(RP),响应式编程
/Users/yangzl/git/quickstart-reactive/docs



quickstart-reactivex
quickstart-reactor
quickstart-reactive-streams
quickstart-rsocket
quickstart-spring-webflux
quickstart-akka
quickstart-springboot-rsocket
quickstart-ratpack




