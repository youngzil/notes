IPV4和IPV6.md


IPv4与IPv6什么意义？
IP就是TCP/IP协议族中网络层的一种互联协议，类似人类交流的语言，同类别的语言可以听得懂，同样同类型的协议才能数据交换。

IPv4与IPv6中的4和6是指什么？
IPv4与IPv6后面的数字其实是指的协议版本号，你可以理解为V4.0版本和V6.0版本

IPV4与IPV6最多支持多少个物理设备？
IPv4地址长度是32位（4个字节），支持的物理地址是2^32-1个地址；
IPv6地址的长度是128位（16个字节），支持的物理地址是2^128-1个地址。



IPV6相比较IPV4有什么优势？
1、更大的地址空间，IPV6地址容量巨大。
2、iPV6地址分配遵循Aggregation原则，路由器的路由表长度减少，提高转发数据包的速度。

ipv4怎么升级过度到IPV6？
目前有三种主流方案，分别是双栈技术（所有的设备上ipv4 ipv6共存）、、隧道技术、GRE隧道and手动隧道ipv6 over ipv4，对于普通用户我们完全不用担心，按时更新系统就可以了。



IPV4地址：192.168.1.1（本地路由器常用的地址）
IPV6地址：2001:0db8:3c4d:0015:0000:0000:1a2f:1a2b。



IPv6是英文“Internet Protocol Version 6”（互联网协议第6版）的缩写，是互联网工程任务组（IETF）设计的用于替代IPv4的下一代IP协议，其地址数量号称可以为全世界的每一粒沙子编上一个地址 [1]  。

IPv6的地址长度为128位，是IPv4地址32位长度的4倍。于是IPv4点分十进制格式不再适用，采用十六进制表示。

IPv6有3种表示方法:
1、冒分十六进制表示法
2、0位压缩表示法
3、内嵌IPv4地址表示法



一、冒分十六进制表示法
    格式为X:X:X:X:X:X:X:X，其中每个X表示地址中的16b，以十六进制表示，例如：
    ABCD:EF01:2345:6789:ABCD:EF01:2345:6789
    这种表示法中，每个X的前导0是可以省略的，例如：
    2001:0DB8:0000:0023:0008:0800:200C:417A→ 2001:DB8:0:23:8:800:200C:417A

二、0位压缩表示法
    在某些情况下，一个IPv6地址中间可能包含很长的一段0，可以把连续的一段0压缩为“::”。但为保证地址解析的唯一性，地址中”::”只能出现一次，例如：
    FF01:0:0:0:0:0:0:1101 → FF01::1101
    0:0:0:0:0:0:0:1 → ::1
    0:0:0:0:0:0:0:0 → ::


三、内嵌IPv4地址表示法
    为了实现IPv4-IPv6互通，IPv4地址会嵌入IPv6地址中，此时地址常表示为：X:X:X:X:X:X:d.d.d.d，前96b采用冒分十六进制表示，而最后32b地址则使用IPv4的点分十进制表示，例如::192.168.0.1与::FFFF:192.168.0.1就是两个典型的例子，注意在前96b中，压缩0位的方法依旧适用 




二、JAVA正则表达式区分IPv4和IPv6地址

输入数据合法格式：

IPv4:唯一标准格式 -> 0-255.0-255.0-255.0-255

IPv6: 标  准  格  式 -> abcd:abcd:abcd:abcd:abcd:abcd:abcd:abcd   标准IPv6地址一共（8*4 + 7）  个字符

IPv6  压  缩  格  式 -> abcd::abcd:abcd:abcd:abcd
                       ::abcd:abcd:abcd
                       abcd:abcd:abcd:abcd:abcd::
                       ::1
                       ::

IPv6压缩规则：至少两个全0块才可以压缩，并且只能压缩一次，存在多个全0块优先压缩更长的全0块；



JAVA正则表达式区分IPv4和IPv6地址
https://blog.csdn.net/bokerr/article/details/83508415
/Users/yangzl/git/quickstart-framework/quickstart-javase/src/test/java/org/quickstart/javase/jdk/io/JudgeIpAddress.java




参考
https://blog.csdn.net/chao199512/article/details/86139714
https://zhuanlan.zhihu.com/p/50747832




