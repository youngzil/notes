http://findbugs.sourceforge.net/
http://findbugs.sourceforge.net/manual/index.html

https://sourceforge.net/projects/findbugs/
https://sourceforge.net/projects/findbugs/files/

https://www.oschina.net/p/findbugs

FindBugs是一个能静态分析源代码中可能会出现Bug的Eclipse插件工具。它检查类或者 JAR 文件，将字节码与一组缺陷模式进行对比以发现可能的问题。有了静态分析工具，就可以在不实际运行程序的情况对软件进行分析。不是通过分析类文件的形式或结构来确定程序的意图，而是通常使用 Visitor 模式。

下载之后，把解冻后的文件拷贝到 $ECLIPSE_HOME/plugins/目录下，重新启动eclipse即完成安装。

FindBugs的设置：
安装好之后，可以通过 Projects > Property > FindBugs标签对其进行设置。设置方法可以根据自己的需要进行调整。

另外在 问题（Proplems）列表窗口（Windows > 视图 > 问题）的Filter设置里，把FindBugs的有关选项都check上。
FindBugs地执行：
选中 所在项目，鼠标右键 > Find Bugs > Find Bugs执行















