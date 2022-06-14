Redis是一个超精简的基于内存的键值对数据库（key-value），一般对并发有一定要求的应用都用其储存session，乃至整个数据库。 参见： node.js与redis结合使用。 不过它公自带一个最小化的命令行式的数据库管理工具，有时侯使用起来并不方便。不过Github上面已经有了很多图形化的管理工具，而且都针对REDIS做了一些优化，如自动折叠带schema的key等。



RedisView：一个个人开发的界面，还是比较方便的
https://github.com/cc20110101/RedisView/releases



Redis Desktop Manager
一款基于Qt5的跨平台Redis桌面管理软件
支持: Windows 7+, Mac OS X 10.10+, Ubuntu 14+
特点： C++ 编写，响应迅速，性能好。但不支持数据库备份与恢复。
项目地址： https://github.com/uglide/RedisDesktopManager


Redis Client
项目简介：　使用Java编写，功能丰富，缺点是性能稍差，网络不好时，会不时断线。
项目地址：　https://github.com/caoxinyu/RedisClient


Redis Studio
项目简介：　又一个C++编写的redis管理工具，仅支持windows平台，支持xp操作系统。
项目地址： https://github.com/cinience/RedisStudio


ps: 后面两款为国人开发。


