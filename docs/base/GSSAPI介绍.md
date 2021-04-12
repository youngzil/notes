



## JAAS/GSS-API/SASL/Kerberos简介


### JAAS
JAAS是Java Authentication and Authorization Service的缩写，提供了认证与授权相关的服务框架与接口定义:

- 认证：认证主要是验证一个用户的身份。
- 授权：授权用户访问或操作某些敏感的资源。



### GSS-API
Java GSS-API是 Generic Security Services Application Program Interface的缩写，主要应用于跨应用程序之间的安全信息交换(secure message exchanges)， RFC 2853提供了详细的接口协议定义。应用程序可以通过GSS-API访问Kerberos服务。

JAAS的认证请求，通常先于GSS-API的调用。也就是说，先通过JAAS的接口完成登录认证，而后通过GSS-API来确保后面交换信息的安全性。两者经常被联合一起使用，但也可以单独使用，例如，基于JAAS也可以完成一些简单的认证与授权，一些别的场景下，也可以只使用GSS-API而不使用JAAS。




### SASL
SASL是Simple Authentication and Security Layer的缩写，主要应用于跨节点通信时的认证与数据加密，如Client与Server基于RPC进行通信时，可以基于SASL来提供身份认证以及数据加密能力。

当SASL中使用Kerberos服务时，也需要使用到GSS-API来与Kerberos之间进行安全信息交换。




### Kerberos



[JAAS/GSS-API/SASL/Kerberos简介](http://www.nosqlnotes.com/technotes/distributed-system-with-kerberos/)  
[图解Kerberos协议原理](http://www.nosqlnotes.com/technotes/kerberos-protocol/)  


---------------------------------------------------------------------------------------------------------------------

## GSSAPI介绍

通用安全服务应用程序接口 (Generic Security Services Application Program Interface)

使用 GSS-API，程序员在编写应用程序时，可以应用通用的安全机制。开发者不必针对任何特定的平台、安全机制、保护类型或传输协议来定制安全实现。使用 GSS-API，程序员可忽略保护网络数据方面的细节。使用 GSS-API 编写的程序在网络安全方面具有更高的可移植性。这种可移植性是通用安全服务 API 的一个特点。



从广义上讲，GSS-API 主要具有以下两种功能：

1. GSS–API 可创建一个安全上下文，应用程序可在该上下文中相互传递数据。上下文是指两个应用程序之间的信任状态。由于共用同一个上下文的应用程序可相互识别，因此可以允许在上下文存在期间进行数据传送。
2. GSS–API 可向要传送的数据应用一种或多种类型的保护，称为安全服务。



GSS-API 提供了三种类型的安全服务：

- 验证－验证是 GSS-API 提供的基本安全性，它是指对身份进行验证。如果用户通过了验证，则系统会假设其有权以该用户名进行操作。

- 完整性－完整性是指对数据的有效性进行验证。即使数据来自有效用户，数据本身也可能会损坏或遭到破坏。完整性可确保消息与预期的一样完整（未增减任何内容）。GSS-API 提供的数据附带有一个名为消息完整性代码 (Message Integrity Code, MIC) 的加密标记。MIC 可用于证明收到的数据与发送者所传送的数据是否相同。

- 保密性－保密性可确保拦截了消息的第三方难以阅读消息内容。验证和完整性机制都不会修改数据。如果数据由于某种原因而被拦截，则其他人可以阅读该数据。因此，可通过 GSS-API 对数据进行加密，前提是提供了支持加密的基础机制。这种数据加密称为保密性。




GSS-API 的语言绑定

本文档目前仅介绍 GSS-API 的 C 语言绑定，即函数和数据类型。  
现已推出 Java 绑定版本的 GSS-API。Java GSS-API 包含通用安全服务应用编程接口 (Generic Security Service Application Program Interface, GSS-API) 的 Java 绑定，如 RFC 2853 中所定义。





[GSS-API 介绍](https://docs.oracle.com/cd/E19253-01/819-7056/6n91eac40/index.html)  
[GSS-API GSSAPI 介绍 通用的安全机制](https://blog.csdn.net/whatday/article/details/104427027)  
[JAAS/GSS-API/SASL/Kerberos简介](http://www.nosqlnotes.com/technotes/distributed-system-with-kerberos/)  




