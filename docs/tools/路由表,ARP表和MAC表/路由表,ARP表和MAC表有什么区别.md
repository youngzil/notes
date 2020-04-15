路由表,ARP表和MAC表有什么区别.md


路由表是IP地址可达范围的一张表，相当于是网络里的地图，负责三层的数据转发；
ARP表示IP地址和MAC地址的逻辑关系表；
MAC地址表是MAC地址和交换机接口的逻辑关系表，负责二层的数据转发



路由表是用三层ip地址表述的，一般存在路由器等三层设备
ARP表是存储的ip mac对应的表
MAC表属于二层的东西，存在于交换机等二层设备，用于局域网寻址



在计算机网络中，路由表（routing table）或称路由择域信息库（RIB, Routing Information Base），是一个存储在路由器或者联网计算机中的电子表格（文件）或类数据库。
路由表存储着指向特定网络地址的路径（在有些情况下，还记录有路径的路由度量值）。路由表中含有网络周边的拓扑信息。路由表创建的主要目标是为了实现路由协议和静态路由选择。
在现代路由器构造中，路由表不直接参与数据包的传输，而是用于生成一个小型指向表，这个指向表仅仅包含由路由算法选择的数据包传输优先路径，这个表格通常为了优化硬件存储和查找而被压缩或提前编译。本文将忽略这个执行的详细情况而选择整个路径选择／传输信息子系统作为路由表来说明。

在路径选择的过程中，主机和路由器的决策是由一个叫路由表的路径数据库辅助决定的。
路由表在路由器内部。根据路由协议，主机也可以拥有用于选择最佳路径的路由表。




Linux、MacOS：addRoute.sh
route -n delete -net 130.17.0.0/16 134.32.80.1&&
route -n delete -net 130.97.0.0/16 134.32.80.1&&
route -n delete -net 134.32.0.0/16 134.32.80.1&&
route -n delete -net 132.35.0.0/16 134.32.80.1&&
route -n delete -net 10.0.0.0/8 134.32.80.1&&

route -n add -net 130.17.0.0/16 134.32.80.1&&
route -n add -net 130.97.0.0/16 134.32.80.1&&
route -n add -net 134.32.0.0/16 134.32.80.1&&
route -n add -net 132.35.0.0/16 134.32.80.1&&
route -n add -net 10.0.0.0/8 134.32.80.1&&
route -n add -net 132.0.0.0/8 134.0.80.1&&
route -n add -net 134.0.0.0/8 134.0.80.1&&
route -n add -net 10.72.10.0/8 134.32.80.1 




Windows：route.bat
route delete 130.17.0.0
route delete 130.97.0.0
route delete 134.32.0.0
route delete 132.45.0.0
route delete 132.42.0.0
route delete 132.35.0.0
route delete 134.34.0.0
route delete 10.0.0.0
route add -p 134.34.0.0 MASK 255.255.0.0 134.32.80.1 METRIC 10
route add -p 130.17.0.0 MASK 255.255.0.0 134.32.80.1 METRIC 10
route add -p 130.97.0.0 MASK 255.255.0.0 134.32.80.1 METRIC 10
route add -p 134.32.0.0 MASK 255.255.0.0 134.32.80.1 METRIC 10
route add -p 132.42.0.0 MASK 255.255.0.0 134.32.80.1 METRIC 10
route add -p 132.45.0.0 MASK 255.255.0.0 134.32.80.1 METRIC 10
route add -p 132.35.0.0 MASK 255.255.0.0 134.32.80.1 METRIC 10
route add -p 10.0.0.0 MASK 255.0.0.0 134.32.80.1 METRIC 10	




参考
https://zh.wikipedia.org/wiki/%E8%B7%AF%E7%94%B1%E8%A1%A8


