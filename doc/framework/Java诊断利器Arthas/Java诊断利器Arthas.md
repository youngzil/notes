1、基本介绍和命令
2、热更新代码
3、查找Top N线程
4、动态更新应用Logger Level
5、排查logger冲突问题
6、排查函数调用异常
7、查看JVM信息
8、sc/sm 查看已加载的类
9、获取Spring Context
10、排查HTTP请求返回401
11、排查HTTP请求返回404
12、理解Spring Boot应用的ClassLoader结构
13、Web Console：Arthas支持通过Web Socket来连接。
14、arthas-boot支持的参数
15、watch使用示例



---------------------------------------------------------------------------------------------------------------------
基本介绍和命令

Java 线上诊断工具 Arthas
Arthas是阿里巴巴 2018 年 9 月开源的一款 Java 线上诊断工具。
Arthas 支持 JDK 6+，支持 Linux/Mac/Windows，采用命令行交互模式，同时提供丰富的 Tab 自动补全功能，进一步方便进行问题的定位和诊断。

Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas 


[Arthas Github](https://github.com/alibaba/arthas)  
[Arthas文档](https://alibaba.github.io/arthas/)  
[Arthas使用文档](https://github.com/alibaba/arthas/blob/master/README_CN.md)  


[Arthas基础教程](https://alibaba.github.io/arthas/arthas-tutorials?language=cn&id=arthas-basics)  
[Arthas进阶教程](https://alibaba.github.io/arthas/arthas-tutorials?language=cn&id=arthas-advanced)  





工具的使用场景：
这个类从哪个 jar 包加载的？为什么会报各种类相关的 Exception？
我改的代码为什么没有执行到？难道是我没 commit？分支搞错了？
遇到问题无法在线上 debug，难道只能通过加日志再重新发布吗？
线上遇到某个用户的数据处理有问题，但线上同样无法 debug，线下无法重现！
是否有一个全局视角来查看系统的运行状况？
有什么办法可以监控到 JVM 的实时运行状态？



使用as.sh脚本需要安装telnet


arthas要先attach之后，才会暴露端口。 在ali内部是有专门的工具可以到机器上执行脚本，然后attach jvm的。我觉得你们可以在运维上考虑一下类似的支持。
比如用 ansible自动化登陆，列出java进程，再让用户选择attach。 web界面调用ansible。
docker映射的端口要先预留好。


给你下个must done的任务，把arthas集成到 aigw-backend运行态，bin下面可以执行起来监控aigw-backend的运行时动态



安装并启动
sh install-local.sh

启动
sh as.sh 
或者
java -jar arthas-boot.jar --target-ip 0.0.0.0

/app/jdk/bin/java -jar arthas-boot.jar --target-ip 0.0.0.0


打印帮助信息：
help
sh as.sh -h
java -jar arthas-boot.jar -h


卸载
在 Linux/Unix/Mac 平台
删除下面文件：
rm -rf ~/.arthas/
rm -rf ~/logs/arthas

Windows平台直接删除user home下面的.arthas和logs/arthas目录


Web Console
通过浏览器连接arthas
Arthas目前支持Web Console，用户在attach成功之后，可以直接访问：http://127.0.0.1:3658/。
可以填入IP，远程连接其它机器上的arthas。
默认情况下，arthas只listen 127.0.0.1，所以如果想从远程连接，则可以使用 --target-ip参数指定listen的IP，更多参考-h的帮助说明。 注意会有安全风险，考虑下面的tunnel server的方案。
默认情况下，arthas tunnel server的web端口是8080，arthas agent连接的端口是7777。
启动之后，可以访问 http://localhost:8080/ ，再通过agentId连接到已注册的arthas agent上。



命令：
1、Dashboard
2、Thread
3、sc/sm 查看已加载的类/方法
4、Jad
5、Exit/Stop
6、
7、
8、
9、




Dashboard
dashboard 命令可以查看当前系统的实时数据面板。
输入 Q 或者 Ctrl+C 可以退出dashboard命令。

Thread
thread 1 命令会打印线程ID 1的栈，通常是main函数的线程。
Arthas支持管道，可以用 thread 1 | grep 'main(' 查找到main class。
可以看到main class是demo.MathGame：


sc/sm 查看已加载的类
下面介绍Arthas里查找已加载类的命令。

sc
sc 命令可以查找到所有JVM已经加载到的类。
如果搜索的是接口，还会搜索所有的实现类。比如查看所有的Filter实现类：
sc javax.servlet.Filter

通过-d参数，可以打印出类加载的具体信息，很方便查找类加载问题。
sc -d javax.servlet.Filter
sc -d *MathGame

sc支持通配，比如搜索所有的StringUtils：
sc *StringUtils

sm
sm命令则是查找类的具体函数。比如：
sm java.math.RoundingMode

通过-d参数可以打印函数的具体属性：
sm -d java.math.RoundingMode

也可以查找特定的函数，比如查找构造函数：
sm java.math.RoundingMode <init>


Jad
可以通过 jad 命令来反编译代码：
jad com.example.demo.arthas.user.UserController

通过--source-only参数可以只打印出在反编译的源代码：
jad --source-only com.example.demo.arthas.user.UserController



Watch
通过watch命令可以查看函数的参数/返回值/异常信息。
watch demo.MathGame primeFactors returnObj
输入 Q 或者 Ctrl+C 退出watch命令。


Exit/Stop
reset
Arthas在 watch/trace 等命令时，实际上是修改了应用的字节码，插入增强的代码。显式执行 reset 命令，可以清除掉这些增强代码。

退出Arthas
用 exit 或者 quit 命令可以退出Arthas。
退出Arthas之后，还可以再次用 java -jar arthas-boot.jar 来连接。

彻底退出Arthas
exit/quit命令只是退出当前session，arthas server还在目标进程中运行。
想完全退出Arthas，可以执行 stop 命令。




查看JVM信息
下面介绍Arthas里查看JVM信息的命令。
sysprop
sysprop 可以打印所有的System Properties信息。
也可以指定单个key： sysprop java.version
也可以通过grep来过滤： sysprop | grep user
可以设置新的value： sysprop testKey testValue

sysenv
sysenv 命令可以获取到环境变量。和sysprop命令类似。

jvm
jvm 命令会打印出JVM的各种详细信息。

dashboard
dashboard 命令可以查看当前系统的实时数据面板。
输入 Q 或者 Ctrl+C 可以退出dashboard命令。




进阶使用

基础命令
help——查看命令帮助信息
cat——打印文件内容，和linux里的cat命令类似
grep——匹配查找，和linux里的grep命令类似
tee——复制标准输入到标准输出和指定的文件，和linux里的tee命令类似
pwd——返回当前的工作目录，和linux命令类似
cls——清空当前屏幕区域
session——查看当前会话的信息
reset——重置增强类，将被 Arthas 增强过的类全部还原，Arthas 服务端关闭时会重置所有增强过的类
version——输出当前目标 Java 进程所加载的 Arthas 版本号
history——打印命令历史
quit——退出当前 Arthas 客户端，其他 Arthas 客户端不受影响
stop——关闭 Arthas 服务端，所有 Arthas 客户端全部退出
keymap——Arthas快捷键列表及自定义快捷键

jvm相关
dashboard——当前系统的实时数据面板
thread——查看当前 JVM 的线程堆栈信息
jvm——查看当前 JVM 的信息
sysprop——查看和修改JVM的系统属性
sysenv——查看JVM的环境变量
vmoption——查看和修改JVM里诊断相关的option
logger——查看和修改logger
getstatic——查看类的静态属性
ognl——执行ognl表达式
mbean——查看 Mbean 的信息
heapdump——dump java heap, 类似jmap命令的heap dump功能

class/classloader相关
sc——查看JVM已加载的类信息
sm——查看已加载类的方法信息
jad——反编译指定已加载类的源码
mc——内存编绎器，内存编绎.java文件为.class文件
redefine——加载外部的.class文件，redefine到JVM里
dump——dump 已加载类的 byte code 到特定目录
classloader——查看classloader的继承树，urls，类加载信息，使用classloader去getResource



---------------------------------------------------------------------------------------------------------------------

热更新代码

安装
sh install-local.sh

启动
sh as.sh 
或者
java -jar arthas-boot.jar --target-ip 0.0.0.0


jad --source-only com.quickstart.controller.AuthorizationController > /tmp/AuthorizationController.java
vim /tmp/AuthorizationController.java
sc -d *AuthorizationController | grep classLoaderHash
mc -c 18b4aac2 /Users/yangzl/workspace/quickstart-framework/quickstart--security/src/main/java/com/quickstart/security/controller/AuthorizationController.java -d ~/test
redefine /tmp/com/example/demo/arthas/user/UserController.class
redefine -c 18b4aac2  /Users/yangzl/workspace/gateway/~/test/com/quickstart/security/controller/AuthorizationController.class


sc -d *AuthorizationController | grep classLoaderHash
筛选出我们关注的类加载器哈希值。这里为什么有两个？一个是接口，一个是实现类。找到对应的类加载哈希：38af3868。



sc -d *ApiUserController | grep classLoaderHash
redefine -c 135fbaa4  /app/app/ApiUserController.class
watch com.quickstart.dev.controller.ApiUserController oprLogin "{params,returnObj}" -x 2 -b




案例: 热更新代码
下面介绍通过jad/mc/redefine 命令实现动态更新代码的功能。
目前，访问 http://localhost/user/0 ，会返回500异常：
curl http://localhost/user/0
{"timestamp":1550223186170,"status":500,"error":"Internal Server Error","exception":"java.lang.IllegalArgumentException","message":"id < 1","path":"/user/0"}


下面通过热更新代码，修改这个逻辑。
jad反编译UserController
jad --source-only com.example.demo.arthas.user.UserController > /tmp/UserController.java
jad反编译的结果保存在 /tmp/UserController.java文件里了。

再打开一个Terminal 3，然后用vim来编辑/tmp/UserController.java：
vim /tmp/UserController.java

比如当 user id 小于1时，也正常返回，不抛出异常：
    @GetMapping(value={"/user/{id}"})
    public User findUserById(@PathVariable Integer id) {
        logger.info("id: {}", (Object)id);
        if (id != null && id < 1) {
            return new User(id, "name" + id);
            // throw new IllegalArgumentException("id < 1");
        }
        return new User(id.intValue(), "name" + id);
    }

sc查找加载UserController的ClassLoader
$ sc -d *UserController | grep classLoaderHash
 classLoaderHash   1be6f5c3
可以发现是 spring boot LaunchedURLClassLoader@1be6f5c3 加载的。

mc
保存好/tmp/UserController.java之后，使用mc(Memory Compiler)命令来编译，并且通过-c参数指定ClassLoader：
$ mc -c 1be6f5c3 /tmp/UserController.java -d /tmp
Memory compiler output:
/tmp/com/example/demo/arthas/user/UserController.class
Affect(row-cnt:1) cost in 346 ms

redefine
再使用redefine命令重新加载新编译好的UserController.class：
$ redefine /tmp/com/example/demo/arthas/user/UserController.class
redefine success, size: 1
热修改代码结果
redefine -c 1be6f5c3  /tmp/com/example/demo/arthas/user/UserController.class


redefine成功之后，再次访问 https://2886795307-80-ollie08.environments.katacoda.com/user/0 ，结果是：
{
  "id": 0,
  "name": "name0"
}



1）第一步，修改代码
在代码中增加相应的日志代码，并且将相应的Java代码文件编译成class字节码文件HostFactoryImpl.class。将字节码文件上传到生产服务器。


2）第二步，获取类加载哈希值
启用Arthas，只需要使用java -jar  arthas-boot.jar即可，并且使用sc命令查找对应的字节码文件(因为我们要替换它)，并且要找到它的类加载哈希码，因为是类加载器加载类，所以我们需要使用同一个类加载器才行。

通过sc查找需要修改的class的ClassLoader
sc -d *AuthorizationController | grep classLoaderHash


3）第三步，替换字节码文件
将刚才上传到服务器的字节码文件加载到JVM中。使用redefine命令进行替换：

再使用redefine命令重新加载新编译好的AuthorizationController.class
$ redefine -c 452c5c14  /tmp/AuthorizationController.class
redefine success, size: 1
返回success，说明替换成功！

但是这是针对新的请求执行才会生效，正在执行的代码还是跟之前一样。
注意：Arthas热更新目前不支持在类增加/删除属性field或方法method操作。
假如你增加了属性或者方法则会出现下面的提示：
redefine error:XXX



3、总结
1）使用Arthas命令：sc和redefine。
2）正在执行的代码不会生效，新的请求执行才会生效。
3）不支持增加或删除属性field和方法method。
最后，Arthas提醒您： 诊断千万条，规范第一条，热更不规范，同事两行泪。



---------------------------------------------------------------------------------------------------------------------

案例：查找Top N线程
查看所有线程信息
thread

查看具体线程的栈
查看线程ID 16的栈：thread 16

查看CPU使用率top n线程的栈
thread -n 3

查看5秒内的CPU使用率top n线程栈
thread -n 3 -i 5000

查找线程是否有阻塞
thread -b


---------------------------------------------------------------------------------------------------------------------


案例: 动态更新应用Logger Level
在这个案例里，动态修改应用的Logger Level。

查找UserController的ClassLoader
sc -d com.example.demo.arthas.user.UserController | grep classLoaderHash

$ sc -d com.example.demo.arthas.user.UserController | grep classLoaderHash
 classLoaderHash   1be6f5c3
用ognl获取logger
ognl -c 1be6f5c3 '@com.example.demo.arthas.user.UserController@logger'

$ ognl -c 1be6f5c3 '@com.example.demo.arthas.user.UserController@logger'
@Logger[
    serialVersionUID=@Long[5454405123156820674],
    FQCN=@String[ch.qos.logback.classic.Logger],
    name=@String[com.example.demo.arthas.user.UserController],
    level=null,
    effectiveLevelInt=@Integer[20000],
    parent=@Logger[Logger[com.example.demo.arthas.user]],
    childrenList=null,
    aai=null,
    additive=@Boolean[true],
    loggerContext=@LoggerContext[ch.qos.logback.classic.LoggerContext[default]],
]
可以知道UserController@logger实际使用的是logback。可以看到level=null，则说明实际最终的level是从root logger里来的。

单独设置UserController的logger level
ognl -c 1be6f5c3 '@com.example.demo.arthas.user.UserController@logger.setLevel(@ch.qos.logback.classic.Level@DEBUG)'

再次获取UserController@logger，可以发现已经是DEBUG了：

ognl -c 1be6f5c3 '@com.example.demo.arthas.user.UserController@logger'

$ ognl -c 1be6f5c3 '@com.example.demo.arthas.user.UserController@logger'
@Logger[
    serialVersionUID=@Long[5454405123156820674],
    FQCN=@String[ch.qos.logback.classic.Logger],
    name=@String[com.example.demo.arthas.user.UserController],
    level=@Level[DEBUG],
    effectiveLevelInt=@Integer[10000],
    parent=@Logger[Logger[com.example.demo.arthas.user]],
    childrenList=null,
    aai=null,
    additive=@Boolean[true],
    loggerContext=@LoggerContext[ch.qos.logback.classic.LoggerContext[default]],
]
修改logback的全局logger level
通过获取root logger，可以修改全局的logger level：

ognl -c 1be6f5c3 '@org.slf4j.LoggerFactory@getLogger("root").setLevel(@ch.qos.logback.classic.Level@DEBUG)'




---------------------------------------------------------------------------------------------------------------------

案例: 排查logger冲突问题
在这个案例里，展示排查logger冲突的方法。

确认应用使用的logger系统
以UserController为例，它使用的是slf4j api，但实际使用到的logger系统是logback。

ognl -c 1be6f5c3 '@com.example.demo.arthas.user.UserController@logger'

$ ognl -c 1be6f5c3 '@com.example.demo.arthas.user.UserController@logger'
@Logger[
    serialVersionUID=@Long[5454405123156820674],
    FQCN=@String[ch.qos.logback.classic.Logger],
    name=@String[com.example.demo.arthas.user.UserController],
    level=null,
    effectiveLevelInt=@Integer[20000],
    parent=@Logger[Logger[com.example.demo.arthas.user]],
    childrenList=null,
    aai=null,
    additive=@Boolean[true],
    loggerContext=@LoggerContext[ch.qos.logback.classic.LoggerContext[default]],
]
获取logback实际加载的配置文件
ognl -c 1be6f5c3 '#map1=@org.slf4j.LoggerFactory@getLogger("root").loggerContext.objectMap, #map1.get("CONFIGURATION_WATCH_LIST")'

使用classloader命令查找可能存在的logger配置文件
classloader -c 1be6f5c3 -r logback-spring.xml

$ classloader -c 1be6f5c3 -r logback-spring.xml
 jar:file:/Users/hengyunabc/code/java/spring-boot-inside/demo-arthas-spring-boot/target/demo-arthas-spring-boot-0.0.1-SNAPSHOT.jar!/BOOT-INF/classes!/logback-spring.xml

Affect(row-cnt:1) cost in 13 ms.
可以知道加载的配置的具体来源。

可以尝试加载容易冲突的文件：

classloader -c 1be6f5c3 -r logback.xml

classloader -c 1be6f5c3 -r log4j.properties

CONTINUE

---------------------------------------------------------------------------------------------------------------------


案例: 排查函数调用异常
现象
目前，访问 http://localhost/user/0 ，会返回500异常：

curl http://localhost/user/0

{"timestamp":1550223186170,"status":500,"error":"Internal Server Error","exception":"java.lang.IllegalArgumentException","message":"id < 1","path":"/user/0"}
但请求的具体参数，异常栈是什么呢？

查看UserController的 参数/异常
在Arthas里执行：

watch com.example.demo.arthas.user.UserController * '{params, throwExp}'


第一个参数是类名，支持通配
第二个参数是函数名，支持通配
访问 curl http://localhost/user/0 ,watch命令会打印调用的参数和异常

$ watch com.example.demo.arthas.user.UserController * '{params, throwExp}'
Press Q or Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:2) cost in 53 ms.
ts=2019-02-15 01:35:25; [cost=0.996655ms] result=@ArrayList[
    @Object[][isEmpty=false;size=1],
    @IllegalArgumentException[java.lang.IllegalArgumentException: id < 1],
]
可以看到实际抛出的异常是IllegalArgumentException。

可以输入 Q 或者 Ctrl+C 退出watch命令。

如果想把获取到的结果展开，可以用-x参数：

watch com.example.demo.arthas.user.UserController * '{params, throwExp}' -x 2

返回值表达式
在上面的例子里，第三个参数是返回值表达式，它实际上是一个ognl表达式，它支持一些内置对象：

loader
clazz
method
target
params
returnObj
throwExp
isBefore
isThrow
isReturn
你可以利用这些内置对象来组成不同的表达式。比如返回一个数组：

watch com.example.demo.arthas.user.UserController * '{params[0], target, returnObj}'

更多参考： https://alibaba.github.io/arthas/advice-class.html

条件表达式
watch命令支持在第4个参数里写条件表达式，比如：

watch com.example.demo.arthas.user.UserController * returnObj 'params[0] > 100'

当访问 https://2886795307-80-ollie08.environments.katacoda.com/user/1 时，watch命令没有输出

当访问 https://2886795307-80-ollie08.environments.katacoda.com/user/101 时，watch会打印出结果。

$ watch com.example.demo.arthas.user.UserController * returnObj 'params[0] > 100'
Press Q or Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:2) cost in 47 ms.
ts=2019-02-13 19:42:12; [cost=0.821443ms] result=@User[
    id=@Integer[101],
    name=@String[name101],
]
当异常时捕获
watch命令支持-e选项，表示只捕获抛出异常时的请求：

watch com.example.demo.arthas.user.UserController * "{params[0],throwExp}" -e

按照耗时进行过滤
watch命令支持按请求耗时进行过滤，比如：

watch com.example.demo.arthas.user.UserController * '{params, returnObj}' '#cost>200'

CONTINUE


---------------------------------------------------------------------------------------------------------------------
查看JVM信息
下面介绍Arthas里查看JVM信息的命令。

sysprop
sysprop 可以打印所有的System Properties信息。

也可以指定单个key： sysprop java.version

也可以通过grep来过滤： sysprop | grep user

可以设置新的value： sysprop testKey testValue

sysenv
sysenv 命令可以获取到环境变量。和sysprop命令类似。

jvm
jvm 命令会打印出JVM的各种详细信息。

dashboard
dashboard 命令可以查看当前系统的实时数据面板。

输入 Q 或者 Ctrl+C 可以退出dashboard命令。



---------------------------------------------------------------------------------------------------------------------

sc/sm 查看已加载的类
下面介绍Arthas里查找已加载类的命令。

sc
sc 命令可以查找到所有JVM已经加载到的类。

如果搜索的是接口，还会搜索所有的实现类。比如查看所有的Filter实现类：

sc javax.servlet.Filter

通过-d参数，可以打印出类加载的具体信息，很方便查找类加载问题。

sc -d javax.servlet.Filter

sc支持通配，比如搜索所有的StringUtils：

sc *StringUtils

sm
sm命令则是查找类的具体函数。比如：

sm java.math.RoundingMode

通过-d参数可以打印函数的具体属性：

sm -d java.math.RoundingMode

也可以查找特定的函数，比如查找构造函数：

sm java.math.RoundingMode <init>

CONTINUE


---------------------------------------------------------------------------------------------------------------------

案例: 获取Spring Context
在这个案例里，展示获取spring context，再获取bean，然后调用函数。

使用tt命令获取到spring context
tt即 TimeTunnel，它可以记录下指定方法每次调用的入参和返回信息，并能对这些不同的时间下调用进行观测。

https://alibaba.github.io/arthas/tt.html
tt -t org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter invokeHandlerMethod

访问：https://2886795307-80-ollie08.environments.katacoda.com/user/1

可以看到tt命令捕获到了一个请求：

$ tt -t org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdaptePress Q or Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:1) cost in 252 ms.
 INDE  TIMESTAMP    COST(  IS-R  IS-  OBJECT     CLASS               METHOD
 X                  ms)    ET    EXP
-----------------------------------------------------------------------------------------
 1000  2019-02-15   4.583  true  fal  0xc93cf1a  RequestMappingHand  invokeHandlerMethod
       15:38:32     923          se              lerAdapter
使用tt命令从调用记录里获取到spring context
输入 Q 或者 Ctrl + C 退出上面的 tt -t命令。

tt -i 1000 -w 'target.getApplicationContext()'

$ tt -i 1000 -w 'target.getApplicationContext()'
@AnnotationConfigEmbeddedWebApplicationContext[
    reader=@AnnotatedBeanDefinitionReader[org.springframework.context.annotation.AnnotatedBeanDefinitionReader@2e457641],
    scanner=@ClassPathBeanDefinitionScanner[org.springframework.context.annotation.ClassPathBeanDefinitionScanner@6eb38026],
    annotatedClasses=null,
    basePackages=null,
]
Affect(row-cnt:1) cost in 439 ms.
获取spring bean，并调用函数
tt -i 1000 -w 'target.getApplicationContext().getBean("helloWorldService").getHelloMessage()'

结果是：

bash
$ tt -i 1000 -w 'target.getApplicationContext().getBean("helloWorldService").getHelloMessage()'
@String[Hello World]
Affect(row-cnt:1) cost in 52 ms.

CONTINUE



---------------------------------------------------------------------------------------------------------------------
案例: 排查HTTP请求返回401
在这个案例里，展示排查HTTP 401问题的技巧。

访问： https://2886795307-80-ollie08.environments.katacoda.com/admin

结果是：

Something went wrong: 401 Unauthorized
我们知道401通常是被权限管理的Filter拦截了，那么到底是哪个Filter处理了这个请求，返回了401？

跟踪所有的Filter函数
开始trace：

trace javax.servlet.Filter *

访问： https://2886795307-80-ollie08.environments.katacoda.com/admin

可以在调用树的最深层，找到AdminFilterConfig$AdminFilter返回了401：

+---[3.806273ms] javax.servlet.FilterChain:doFilter()
|   `---[3.447472ms] com.example.demo.arthas.AdminFilterConfig$AdminFilter:doFilter()
|       `---[0.17259ms] javax.servlet.http.HttpServletResponse:sendError()
通过stack获取调用栈
上面是通过trace命令来获取信息，从结果里，我们可以知道通过stack跟踪HttpServletResponse:sendError()，同样可以知道是哪个Filter返回了401

执行：

stack javax.servlet.http.HttpServletResponse sendError 'params[0]==401'

访问： https://2886795307-80-ollie08.environments.katacoda.com/admin

$ stack javax.servlet.http.HttpServletResponse sendError 'params[0]==401'
Press Q or Ctrl+C to abort.
Affect(class-cnt:2 , method-cnt:4) cost in 87 ms.
ts=2019-02-15 16:44:06;thread_name=http-nio-8080-exec-6;id=16;is_daemon=true;priority=5;TCCL=org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedWebappClassLoader@8546cd5
    @org.apache.catalina.connector.ResponseFacade.sendError()
        at com.example.demo.arthas.AdminFilterConfig$AdminFilter.doFilter(AdminFilterConfig.java:38)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)
        at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)
        at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
CONTINUE



---------------------------------------------------------------------------------------------------------------------


案例: 排查HTTP请求返回404
在这个案例里，展示排查HTTP 404问题的技巧。

访问： https://2886795307-80-ollie08.environments.katacoda.com/a.txt

结果是：

Something went wrong: 404 Not Found
那么到底是哪个Servlet处理了这个请求，返回了404？

跟踪所有的Servlet函数
开始trace：

trace javax.servlet.Servlet * > /tmp/servlet.txt

访问： https://2886795307-80-ollie08.environments.katacoda.com/a.txt

在Terminal 3里，查看/tmp/servlet.txt的内容：

less /tmp/servlet.txt

/tmp/servlet.txt里的内容会比较多，需要耐心找到调用树里最长的地方。

可以发现请求最终是被freemarker处理的：

`---[13.974188ms] org.springframework.web.servlet.ViewResolver:resolveViewName()
    +---[0.045561ms] javax.servlet.GenericServlet:<init>()
    +---[min=0.045545ms,max=0.074342ms,total=0.119887ms,count=2] org.springframework.web.servlet.view.freemarker.FreeMarkerView$GenericServletAdapter:<init>()
    +---[0.170895ms] javax.servlet.GenericServlet:init()
    |   `---[0.068578ms] javax.servlet.GenericServlet:init()
    |       `---[0.021793ms] javax.servlet.GenericServlet:init()
    `---[0.164035ms] javax.servlet.GenericServlet:getServletContext()

CONTINUE


---------------------------------------------------------------------------------------------------------------------

案例: 理解Spring Boot应用的ClassLoader结构
下面介绍classloader命令的功能。

先访问一个jsp网页，触发jsp的加载： https://2886795307-80-ollie08.environments.katacoda.com/hello

列出所有ClassLoader
classloader -l

$ classloader -l
 name                                                             loadedCount  hash      parent
 BootstrapClassLoader                                             2724         null      null
 com.taobao.arthas.agent.ArthasClassloader@411ce1ab               2009         411ce1ab  sun.misc.Launcher$ExtClassLoader@7494e528
 com.taobao.arthas.agent.ArthasClassloader@22ae1234               1253         22ae1234  sun.misc.Launcher$ExtClassLoader@7494e528
 org.apache.jasper.servlet.JasperLoader@65361d9a                  1            65361d9a  TomcatEmbeddedWebappClassLoader
                                                                                           context: ROOT
                                                                                           delegate: true
                                                                                         ----------> Parent Classloader:
                                                                                         org.springframework.boot.loader.LaunchedURLClassLoader@1be6f5c3

 TomcatEmbeddedWebappClassLoader                                  0            8546cd5   org.springframework.boot.loader.LaunchedURLClassLoader@1be6f5c3
   context: ROOT
   delegate: true
 ----------> Parent Classloader:
 org.springframework.boot.loader.LaunchedURLClassLoader@1be6f5c3

 org.springframework.boot.loader.LaunchedURLClassLoader@1be6f5c3  5416         1be6f5c3  sun.misc.Launcher$AppClassLoader@3d4eac69
 sun.misc.Launcher$AppClassLoader@3d4eac69                        45           3d4eac69  sun.misc.Launcher$ExtClassLoader@7494e528
 sun.misc.Launcher$ExtClassLoader@7494e528                        4            7494e528  null
TomcatEmbeddedWebappClassLoader 加载的class数量是0，所以在spring boot embedded tomcat里，它只是一个空壳，所有的类加载都是LaunchedURLClassLoader完成的
列出ClassLoader里加载的所有类
列出上面的org.apache.jasper.servlet.JasperLoader加载的类：

classloader -a -c 65361d9a

$ classloader -a -c 65361d9a
 hash:1698045338, org.apache.jasper.servlet.JasperLoader@65361d9a
 org.apache.jsp.jsp.hello_jsp
反编译jsp的代码
jad org.apache.jsp.jsp.hello_jsp

$ jad org.apache.jsp.jsp.hello_jsp

ClassLoader:
+-org.apache.jasper.servlet.JasperLoader@65361d9a
  +-TomcatEmbeddedWebappClassLoader
      context: ROOT
...
查看ClassLoader树
classloader -t

$ classloader -t
+-BootstrapClassLoader
+-sun.misc.Launcher$ExtClassLoader@28cbbddd
  +-com.taobao.arthas.agent.ArthasClassloader@8c25e55
  +-sun.misc.Launcher$AppClassLoader@55f96302
    +-org.springframework.boot.loader.LaunchedURLClassLoader@1be6f5c3
      +-TomcatEmbeddedWebappClassLoader
          context: ROOT
          delegate: true
        ----------> Parent Classloader:
        org.springframework.boot.loader.LaunchedURLClassLoader@1be6f5c3

        +-org.apache.jasper.servlet.JasperLoader@21ae0fe2
列出ClassLoader的urls
比如上面查看到的spring LaunchedURLClassLoader的 hashcode是1be6f5c3，可以通过-c参数来列出它的所有urls：

classloader -c 1be6f5c3

$ classloader -c 1be6f5c3
jar:file:/home/scrapbook/tutorial/demo-arthas-spring-boot.jar!/BOOT-INF/classes!/
jar:file:/home/scrapbook/tutorial/demo-arthas-spring-boot.jar!/BOOT-INF/lib/spring-boot-starter-aop-1.5
.13.RELEASE.jar!/
...
加载指定ClassLoader里的资源文件
查找指定的资源文件： classloader -c 1be6f5c3 -r logback-spring.xml

$ classloader -c 1be6f5c3 -r logback-spring.xml
 jar:file:/home/scrapbook/tutorial/demo-arthas-spring-boot.jar!/BOOT-INF/classes!/logback-spring.xml
尝试加载指定的类
比如用上面的spring LaunchedURLClassLoader 尝试加载 java.lang.String ：

classloader -c 1be6f5c3 --load java.lang.String

$ classloader -c 1be6f5c3 --load java.lang.String
load class success.
 class-info        java.lang.String
 code-source
 name              java.lang.String
 isInterface       false
 isAnnotation      false
 isEnum            false
 isAnonymousClass  false
 isArray           false
 isLocalClass      false
 isMemberClass     false
 isPrimitive       false
 isSynthetic       false
 simple-name       String
 modifier          final,public
 annotation
 interfaces        java.io.Serializable,java.lang.Comparable,java.lang.CharSequence
 super-class       +-java.lang.Object
 class-loader
 classLoaderHash   null
CONTINUE


---------------------------------------------------------------------------------------------------------------------
Web Console：Arthas支持通过Web Socket来连接。

Web Console
Arthas支持通过Web Socket来连接。

教程里的Web Console
http://2886795307-8563-ollie08.environments.katacoda.com/?ip=2886795307-8563-ollie08.environments.katacoda.com&port=80

注意：教程里访问的是80端口，因为做了端口转发。在本地体验时，需要访问8563端口。

本地体验
当在本地启动时，可以访问 http://127.0.0.1:8563/ ，通过浏览器来使用Arthas。

Arthas WebConsole

推荐通过“快速入门”来体验： https://alibaba.github.io/arthas/quick-start.html

---------------------------------------------------------------------------------------------------------------------


arthas-boot支持的参数
arthas-boot.jar 支持很多参数，可以执行 java -jar arthas-boot.jar -h 来查看。

允许外部访问
默认情况下， arthas server侦听的是 127.0.0.1 这个IP，如果希望远程可以访问，可以使用--target-ip的参数。

java -jar arthas-boot.jar --target-ip

列出所有的版本
java -jar arthas-boot.jar --versions

使用指定版本：

java -jar arthas-boot.jar --use-version 3.1.0

只侦听Telnet端口，不侦听HTTP端口
java -jar arthas-boot.jar --telnet-port 9999 --http-port -1

打印运行的详情
java -jar arthas-boot.jar -v

CONTINUE



---------------------------------------------------------------------------------------------------------------------
https://alibaba.github.io/arthas/watch.html



安装并启动
sh install-local.sh

启动
sh as.sh 
或者
java -jar arthas-boot.jar --target-ip 0.0.0.0

/app/jdk/bin/java -jar arthas-boot.jar --target-ip 0.0.0.0



观察方法出参和返回值
watch demo.MathGame primeFactors "{params,returnObj}" -x 2


watch com.quickstart.common.util.PoUtil xml2pojo "{params,returnObj}" -x 2

观察方法入参
watch demo.MathGame primeFactors "{params,returnObj}" -x 2 -b
watch com.quickstart.common.controller.PictureCheckCodeController getVerify "{params,returnObj}" -x 2 -b
watch com.quickstart.dev.controller.ApiUserController oprLogin "{params,returnObj}" -x 2 -b

同时观察方法调用前和方法返回后
watch demo.MathGame primeFactors "{params,target,returnObj}" -x 2 -b -s -n 2

调整-x的值，观察具体的方法参数值
watch demo.MathGame primeFactors "{params,target}" -x 3

观察异常信息的例子
watch demo.MathGame primeFactors "{params[0],throwExp}" -e -x 2



条件表达式的例子
watch demo.MathGame primeFactors "{params[0],target}" "params[0]<0"

按照耗时进行过滤
$ watch demo.MathGame primeFactors '{params, returnObj}' '#cost>200' -x 2






---------------------------------------------------------------------------------------------------------------------


