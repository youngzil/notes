https://blog.csdn.net/catoop/article/details/50630095

下面说一下方法吧： 
环境：Tomcat、Eclipse，做远程调试我们并不需要其他特殊插件

1、配置Tomcat/bin/startup.bat 
在前面增加代码：SET CATALINA_OPTS=-server -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000 
其中8000即为我们远程调试的端口，后面会用到。另外，该命令不可手工换行（博客显示的时候可能会被换行，实际配置的时候请注意）。

2、启动Tomcat 
查看Tomcat控制台输出，能看到我们刚刚的配置已经生效，输出如下： 



3、配置Eclipse 
点击Eclipse上面的debug图标，选择Debug Configurations，打开窗口找到Remote Java Application，
双击 Remote Java Application 即可创建一个远程调试
选择源码、填写Host和Port，点击Debug即可进入Debug模式。
点击上面圈起来的图标（Disconnect）即可断开Debug模式。 
断开Debug模式后，可以随时再开启Debug模式，



#===========================================================================================
# JVM Configuration
#===========================================================================================
JAVA_OPT="${JAVA_OPT} -server -Xms8g -Xmx8g -Xmn4g"
JAVA_OPT="${JAVA_OPT} -XX:+UseG1GC -XX:G1HeapRegionSize=16m -XX:G1ReservePercent=25 -XX:InitiatingHeapOccupancyPercent=30 -XX:SoftRefLRUPolicyMSPerMB=0 -XX:SurvivorRatio=8"
JAVA_OPT="${JAVA_OPT} -verbose:gc -Xloggc:/dev/shm/mq_gc_%p.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCApplicationStoppedTime -XX:+PrintAdaptiveSizePolicy"
JAVA_OPT="${JAVA_OPT} -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=5 -XX:GCLogFileSize=30m"
JAVA_OPT="${JAVA_OPT} -XX:-OmitStackTraceInFastThrow"
JAVA_OPT="${JAVA_OPT} -XX:+AlwaysPreTouch"
JAVA_OPT="${JAVA_OPT} -XX:MaxDirectMemorySize=15g"
JAVA_OPT="${JAVA_OPT} -XX:-UseLargePages -XX:-UseBiasedLocking"
JAVA_OPT="${JAVA_OPT} -Djava.ext.dirs=${JAVA_HOME}/jre/lib/ext:${BASE_DIR}/lib"
#JAVA_OPT="${JAVA_OPT} -Xdebug -Xrunjdwp:transport=dt_socket,address=9555,server=y,suspend=n"
JAVA_OPT="${JAVA_OPT} ${JAVA_OPT_EXT}"
JAVA_OPT="${JAVA_OPT} -cp ${CLASSPATH}"




