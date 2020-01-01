https://github.com/google/styleguide
https://google.github.io/styleguide/

Google 开源项目风格指南 (中文版) 
https://github.com/zh-google-styleguide/zh-google-styleguide

https://google.github.io/styleguide/javaguide.html
https://checkstyle.sourceforge.io/google_style.html
https://developers.google.com/style/


http://www.jianshu.com/p/afbfc784238a
http://www.yeolar.com/note/2012/05/21/ds-list/


集群脑裂问题
在“双机热备”高可用（HA）系统中，当联系2个节点的“心跳线”断开时，本来为一整体、动作协调的HA系统，就分裂成为2个独立的个体。由于相互失去了联系，都以为是对方出了故障，2个节点上的HA软件像“裂脑人”一样，“本能”地争抢“共享资源”、争起“应用服务”，就会发生严重后果：或者共享资源被瓜分、2边“服务”都起不来了；或者2边“服务”都起来了，但同时读写“共享存储”，导致数据损坏（常见如数据库轮询着的联机日志出错）。
http://blog.csdn.net/cweeyii/article/details/72354363
http://czmmiao.iteye.com/blog/1180851
http://blog.chinaunix.net/uid-20726500-id-5473292.html




