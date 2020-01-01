把NTP服务器给我们，配置电信云测试环境所有时钟保持同步
NTP 是网络时间协议（Network Time Protocol），它用来同步网络设备【如计算机、手机】的时间的协议。
 Network Time Protocol ，另外还有 Digital Time Synchronization Protocol (DTSS) 也可以达到相同的功能
 
软件时钟：由 Linux 操作系统根据 1970/01/01 开始计算的总秒数；
硬件时钟：主机硬件系统上面的时钟，例如 BIOS 记录的时间；

 
主要时间服务器： http://support.ntp.org/bin/view/Servers/StratumOneTimeServers
次要时间服务器： http://support.ntp.org/bin/view/Servers/StratumTwoTimeServers

rpm -qa |grep chrony先找台机器看看有没有chrony



chrony简介
　　Chrony是一个开源的自由软件，它能保持系统时钟与时钟服务器（NTP）同步，让时间保持精确。
　　它由两个程序组成：chronyd和chronyc。
　　chronyd是一个后台运行的守护进程，用于调整内核中运行的系统时钟和时钟服务器同步。它确定计算机增减时间的比率，并对此进行补偿。
 chrony是CentOS7.x上自带的时间同步软件


参考
https://www.jianshu.com/p/28864ab7fdd9
https://cloud.tencent.com/developer/article/1008065


