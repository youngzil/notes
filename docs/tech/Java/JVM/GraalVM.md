# GraalVM


## GraalVM介绍

[GraalVM官网](https://www.graalvm.org/)

[GraalVM 简介](https://www.graalvm.org/22.1/docs/introduction/)

[GraalVM文档](https://www.graalvm.org/22.1/docs/getting-started/)

[GraalVM Github](https://github.com/oracle/graal)


[解密新一代 Java JIT 编译器 Graal](https://www.infoq.cn/article/graal-java-jit-compiler)


官网的描述

High Performanсe. Cloud Native. Polyglot.

高性能。云原生。多语种。



它的口号:

GraalVM: Run Programs Faster Anywhere 🚀



GraalVM is a high-performance JDK distribution designed to accelerate the execution of applications written in Java and other JVM languages along with support for JavaScript, Ruby, Python, and a number of other popular languages.
GraalVM 是一个高性能 JDK 发行版，旨在加速用 Java 和其他 JVM 语言编写的应用程序的执行，同时支持 JavaScript、Ruby、Python 和许多其他流行语言。


GraalVM为 HotSpot Java 虚拟机添加了一个用 Java 编写的高级即时 (JIT) 优化编译器。

除了运行 Java 和基于 JVM 的语言之外，GraalVM 的语言实现框架 (Truffle)使得在 JVM 上运行 JavaScript、Ruby、Python 和许多其他流行语言成为可能。借助 GraalVM Truffle，Java 和其他支持的语言可以直接互操作，并在同一内存空间中来回传递数据。



2018年4月，Oracle Labs新公开了一项黑科技：Graal VM，从它的口号“Run Programs Faster Anywhere”就能感觉到一颗蓬勃的野心，这句话显然是与1995年Java刚诞生时的“Write Once，Run Anywhere”在遥相呼应。

Graal VM被官方称为“Universal VM”和“Polyglot VM”，这是一个在HotSpot虚拟机基础上增强而成的跨语言全栈虚拟机，可以作为“任何语言”的运行平台使用，这里“任何语言”包括了Java、Scala、Groovy、Kotlin等基于Java虚拟机之上的语言，还包括了C、C++、Rust等基于LLVM的语言，同时支持其他像JavaScript、Ruby、Python和R语言等等。Graal VM可以无额外开销地混合使用这些编程语言，支持不同语言中混用对方的接口和对象，也能够支持这些语言使用已经编写好的本地库文件。


参考 

[Graal VM：云原生时代的Java](https://cloud.tencent.com/developer/article/1623187)





## LLVM项目

LLVM项目是模块化、可重用的编译器以及工具链技术的集合。

LLVM是一套编译器基础设施项目，为自由软件，以C++写成，包含一系列模块化的编译器组件和工具链，用来开发编译器前端和后端。它是为了任意一种程式语言而写成的程式，利用虚拟技术创造出编译时期、链结时期、执行时期以及“闲置时期”的最佳化。

它最早以C/C++为实作对象，而目前它已支援包括ActionScript、Ada、D语言、Fortran、GLSL、Haskell、Java字节码、Objective-C、Swift、Python、Ruby、Crystal、Rust、Scala[1]以及C#[2]等语言。




[深入浅出让你理解什么是LLVM](https://www.jianshu.com/p/1367dad95445)

[LLVM官网](https://llvm.org/)

[LLVM Github](https://github.com/llvm/llvm-project)

[LLVM 维基百科](https://zh.m.wikipedia.org/zh-hans/LLVM)




