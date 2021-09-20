- [SOCKS介绍](#SOCKS介绍)


---------------------------------------------------------------------------------------------------------------------
## SOCKS介绍  

SOCKS是一种网络传输协议，主要用于客户端与外网服务器之间通讯的中间传递。SOCKS是"SOCKet Secure"的缩写[注 1]。

当防火墙后的客户端要访问外部的服务器时，就跟SOCKS代理服务器连接。这个代理服务器控制客户端访问外网的资格，允许的话，就将客户端的请求发往外部的服务器。

这个协议最初由David Koblas开发，而后由NEC的Ying-Da Lee将其扩展到SOCKS4。最新协议是SOCKS5，与前一版本相比，增加支持UDP、验证，以及IPv6。

根据OSI模型，SOCKS是会话层的协议，位于表示层与传输层之间。

SOCKS协议不提供加密。




### 与HTTP代理的对比

SOCKS工作在比HTTP代理更低的层次：SOCKS使用握手协议来通知代理软件其客户端试图进行的SOCKS连接，然后尽可能透明地进行操作，而常规代理可能会解释和重写报头（例如，使用另一种底层协议，例如FTP；然而，HTTP代理只是将HTTP请求转发到所需的HTTP服务器）。

虽然HTTP代理有不同的使用模式，HTTP CONNECT方法允许转发TCP连接；然而，SOCKS代理还可以转发UDP流量（仅SOCKS5），而HTTP代理不能。HTTP代理通常更了解HTTP协议，执行更高层次的过滤（虽然通常只用于GET和POST方法，而不用于CONNECT方法）。

SOCKS是一组由Internal工程工作小组（IETF）所开发出来的开放软件开放标准，用来处理网络安全的事宜。SOCKS像一堵墙被夹在 Internal服务器和客户端之间，对于出入企业网络的资讯提供流量和安全的管理。

SOCKS这个名词并不是一组英文字头的缩写，而是一个和 TCP/IP的Socket端口有关的安全标准，一般防火墙系统通常是象网关（Gateway）一样是作用在OSI模型的第七层也就是应用层上，对 TCP/IP的高级协议，如Telnet、FTP、HTTP和SMTP加以管制，而SOCKS作用在OSI模型的第五层也就是会话层上，像一个代理一样对客户端到服务器端或服务器和服务器之间的数据联系提供安全上的服务。

由于SOCKS作用在会话层上，因此它是一个提供会话层到会话层间安全服务的方案，不受高层应用程序变更的影响。 Socks代理只是简单地传递数据包，而不必关心是何种应用协议(比如FTP、HTTP和NNTP请求)，所以Socks代理服务器比应用层代理服务器要快。





[SOCKS介绍](https://zh.wikipedia.org/wiki/SOCKS)  
[SOCKS Protocol Version 5](https://datatracker.ietf.org/doc/html/rfc1928)  
[Socks5协议中文文档](https://blog.csdn.net/testcs_dn/article/details/7915505)  

[Java SOCKS 4/5 server implementation for Java](https://github.com/bbottema/java-socks-proxy-server)  
[Java Socks Server](https://github.com/ravn/jsocks)  
[]()  
[]()  
[]()  



---------------------------------------------------------------------------------------------------------------------
