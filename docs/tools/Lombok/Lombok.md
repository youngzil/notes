https://projectlombok.org/
https://github.com/rzwitserloot/lombok
https://projectlombok.org/download


https://blog.csdn.net/arkblue/article/details/52608213
http://www.blogjava.net/fancydeepin/archive/2012/07/12/lombok.html

1.下载lombok.jar包https://projectlombok.org/download.html

2.运行Lombok.jar: java -jar D:\software\lombok.jar D:\software\lombok.jar这是windows下lombok.jar所在的位置
  数秒后将弹出一框，以确认eclipse的安装路径</code>
3.确认完eclipse的安装路径后，点击install/update按钮，即可安装完成

4.安装完成之后，请确认eclipse安装路径下是否多了一个lombok.jar包，并且其
配置文件eclipse.ini中是否 添加了如下内容: </code>
    -javaagent:lombok.jar 
    -Xbootclasspath/a:lombok.jar 
那么恭喜你已经安装成功，否则将缺少的部分添加到相应的位置即可 </code>
5.重启eclipse或myeclipse


2.eclipse / myeclipse 手动安装 lombok
    1. 将 lombok.jar 复制到 myeclipse.ini / eclipse.ini 所在的文件夹目录下
    2. 打开 eclipse.ini / myeclipse.ini，在最后面插入以下两行并保存：
        -Xbootclasspath/a:lombok.jar
        -javaagent:lombok.jar
    3.重启 eclipse / myeclipse

    
lombok 注解：
    lombok 提供的注解不多，可以参考官方视频的讲解和官方文档。
    Lombok 注解在线帮助文档：http://projectlombok.org/features/index.
    下面介绍几个我常用的 lombok 注解：
        @Data   ：注解在类上；提供类所有属性的 getting 和 setting 方法，此外还提供了equals、canEqual、hashCode、toString 方法
        @Setter：注解在属性上；为属性提供 setting 方法
        @Getter：注解在属性上；为属性提供 getting 方法
        @Log4j ：注解在类上；为类提供一个 属性名为log 的 log4j 日志对象
        @NoArgsConstructor：注解在类上；为类提供一个无参的构造方法
        @AllArgsConstructor：注解在类上；为类提供一个全参的构造方法




