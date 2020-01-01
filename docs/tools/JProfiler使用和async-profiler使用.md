常见的Profiler工具：JProfiler、async-profiler、jconsole
火焰图生成工具FlameGraph

---------------------------------------------------------------------------------------------------------------------
JProfiler：

JProfiler下载：https://www.ej-technologies.com/download/jprofiler/files

本地项目和远程项目使用：
其实远程和本地的区别不大，主要区别只是，JProfiler的GUI运行在你本地，而JProfiler的Agent运行在远程服务端。本地和远端都需要安装Jprofiler的运行环境


本地项目：安装和IDEA集成
1、在本地下载安装，并且激活
2、在Idea中安装JProfiler插件
3、在idea中配置本地的安装路径/Applications/JProfiler.app/Contents/Resources/app/bin/macos/jprofiler.sh
4、直接在本地IDEA中使用JProfiler启动，就会自动启动本地JProfiler程序并监控

远程项目：
1、下载linux压缩包并且在Linux主机解压
2、本地安装，选择菜单Session->integration Wizards->new remote integration 开始做链接配置，在最后一步会出现一个jvm的javaagent配置，复制下来加在服务器应用启动脚本里
  -agentpath:/home/aifqa/profiler/jprofiler11.0/bin/linux-x64/libjprofilerti.so=port=60998
3、然后启动linux主机上的应用，就可以了

或者

1、下载linux压缩包并且在Linux主机解压，并运行${JPROFILER_HOME}/bin下面的./jpenable，然后选择监控的进程、模式、端口
2、然后建立本地主机和远程主机之间ssh的信任通道
3、本地选择QuickAttach，remote 选择 SSH通道，使用账号密码形式



---------------------------------------------------------------------------------------------------------------------
https://my.oschina.net/u/1404949/blog/3039469
https://www.jianshu.com/p/19c2f211173b
https://my.oschina.net/u/1404949/blog/3039469
https://blog.csdn.net/flybridy/article/details/81947570
https://www.cnblogs.com/zhangyaxiao/p/6678385.html

火焰图详解 参考：
http://www.ruanyifeng.com/blog/2017/09/flame-graph.html
https://blog.csdn.net/21cnbao/article/details/78527777



async-profiler：idea中集成的jvm profiler

async-profiler工具：https://github.com/jvm-profiling-tools/async-profiler
火焰图生成工具FlameGraph：https://github.com/brendangregg/FlameGraph


async-profiler可以跟踪以下类型的事件：
CPU周期
硬件和软件性能计数器，如缓存未命中，分支未命中，页面错误，上下文切换等。
Java堆中的分配
满足锁定尝试，包括Java对象监视器和ReentrantLocks



java 性能调优，使用 async-profiler + FlameGraph火焰图 分析cup消耗热点代码
目的：通过分析工具找到项目中占用cpu时间最长的代码片段，优化热点代码，达到优化内存的效果。


本地项目：IDEA自带集成
1、Preferences-->Java Profiler-->点击添加，可以添加CPU视图 和 Memory视图，只能分别监控
2、本地项目启动的时候，可以选择是CPU视图启动 或者 Memory视图启动
3、一段时间之后可以在控制台profiler标签页查看



单独使用：更多用法和原理查看github主页
./profiler.sh start $pid
./profiler.sh stop $pid

alloc类型的数据
./profiler.sh start  -e alloc pid
./profiler.sh stop  -e alloc pid


在Linux下使用
可以在启动Java应用的时候加上下面的参数：
-agentpath:${path}/lightweight-java-profiler/build-64/liblagent.so
生成火焰图。
程序执行完之后，就可以获取到trace.txt文件。接下来，就需要将Java应用的运行时profile数据转换为可视化的火焰图来进行性能分析了，使用FlameGraph将profile数据转化为火焰图。命令如下：
cd FlameGraph
./stackcollapse-ljp.awk < ${path}/traces.txt | ./flamegraph.pl > {$path}/traces.svg


sudo ./async-profiler/profiler.sh -d 20 -o collapsed -f /tmp/collapsed2.txt 13929
./flamegraph.pl --colors=java /tmp/collapsed.txt > ~/flamegraph.svg
./FlameGraph/flamegraph.pl --colors=java /tmp/collapsed.txt > ~/flamegraph.svg


./profiler.sh -d 10 -o collapsed -f /tmp/collapsed.txt pid
这个命令的意思是说，采集数据的时间为10秒，并且将数据按照collapsed规范进行dump，并且dump到/tmp/collapsed.txt这个文件，过了10秒之后，工具会自动停止，并且将cpu的profile数据dump到指定的路径（按照指定的规范），可以到/tmp/collapsed.txt查看具体的文件内容，但是很大程度上是看不懂的，所以需要使用FlameGraph工具来进行加工一下，可以使用下面的命令来生成火焰图：
~/github/FlameGraph/flamegraph.pl --colors=java /tmp/collapsed.txt > flamegraph.svg


其中几个重要的命令解释如下：
start ： 开始进行应用的profile数据采集，如果没有设定采集时间的话会一直运行下去直到遇到stop命令
stop： 和start配合使用，用来停止应用的profile数据采集
status：检测工具的运行状态，比如可以看到是否已经不可用，或者已经运行多少时间了等信息
list：将可以采集的profile数据类型打印出来
-d N： 设定采集应用profile数据的时间，单位为秒
-e event：指定采集数据类型，比如cpu




http://www.liuhaihua.cn/archives/526634.html
如何看火焰图：
火焰图就是看顶层的哪个函数占据的宽度最大。只要有 “平顶”(plateaus), 就表示该函数可能存在性能问题。他们的颜色并没有特殊含义。

正常的火焰图形状类似的“山脉”，“山脉”的“海拔”表示业务函数的调用深度，“山脉”的“长度”表示业务函数占用cpu的比例。如下图：

另外一个对比是下图，可以看到 get_serial_id 这个函数占用了绝大部分的 CPU 比例，问题的排查可以从这里入手，找到其调用栈中异常的函数。

一般来说一个正常的火焰图看起来像一座座连绵起伏的“山峰”，而一个异常的火焰图看起来像一座“平顶山”



---------------------------------------------------------------------------------------------------------------------





---------------------------------------------------------------------------------------------------------------------


