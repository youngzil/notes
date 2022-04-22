# Eclipse插件安装

## Eclipse插件

eclipse在线升级
http://download.eclipse.org/eclipse/updates/4.7
把网址“http://download.eclipse.org/eclipse/updates”复制到网址浏览器的上可以得到最新4.7等等版

Oxygen	http://download.eclipse.org/releases/oxygen	Enabled


1、安装eclipse
2、配置JDK
3、配置Maven
4、安装SVN（http://subclipse.tigris.org/update_1.12.x）
5、反编译工具enhanced-class-decompiler：Eclipse Marketplace
6、安装Egit（Eclipse Marketplace）
7、安装Servers：
1、如果不行再安装下一步，http://download.eclipse.org/webtools/repository/oxygen/---》Web Tools Platform (WTP) 3.9.1a，如果不行再安装下一步
2、（Help->InstallNew Software->"Kepler" repository(http://download.eclipse.org/releases/kepler)->Web,XML, Java EE and OSGi Enterprise Development ->JST Server AdaptersExtensions(打勾选上该项)）
8、配置Tomcat
9、JUint（Eclipse自带）
10、TestNG：Eclipse Marketplace 或者 http://beust.com/eclipse
11、安装FindBugs
安装指引：http://findbugs.cs.umd.edu/eclipse/
官方发布的http://findbugs.cs.umd.edu/eclipse
候选版本和正式版本的http://findbugs.cs.umd.edu/eclipse-candidate
所有版本的http://findbugs.cs.umd.edu/eclipse-daily，包括开发版本
参考
http://blog.csdn.net/xlxxcc/article/details/52056732
12、阿里Java代码规约检查插件P3C：https://p3c.alibaba.com/plugin/eclipse/update
13、EasyShell：Eclipse Marketplace
14、ShellEd：使用zip包安装的方式，先安装下面2个依赖插件
在http://sourceforge.net/projects/shelled/files/latest/download下载ShellEd的zip包
ShellEd依赖的：
name: man-page viewer
http://download.eclipse.org/technology/linuxtools/updates-nightly/
Name: Dynamic Languages Toolkit
http://download.eclipse.org/technology/dltk/updates-dev/4.0-nightly/
15、Lombok
-Xbootclasspath/a:/Users/yangzl/mysoft/lombok/lombok-1.18.0.jar
-javaagent:/Users/yangzl/mysoft/lombok/lombok-1.18.0.jar
16、idea 插件：JRebel和JProfiler，idea自带的jvm Profiler 是async-profiler，有些人在IDEA中配置了JRebel热部署，要想JRebel和JProfiler同时运行，就要改手动管理JProfiler session了。

17、Gradle
18、安装C++
参考
http://blog.csdn.net/yuanguangyu1221/article/details/50564017
19、Sonar
20、
21、
22、
23、
24、
25、
26、
27、
28、
29、
30、






## 常用的插件

git：
http://marketplace.eclipse.org/content/egit-git-integration-eclipse

Spring：
http://marketplace.eclipse.org/content/spring-tools-aka-spring-ide-and-spring-tool-suite

sonar和findbugs：
https://marketplace.eclipse.org/content/sonarlint
https://marketplace.eclipse.org/content/findbugs-eclipse-plugin


反编译：
http://marketplace.eclipse.org/content/enhanced-class-decompiler

gradle：
http://marketplace.eclipse.org/content/buildship-gradle-integration

testNG和junit：
http://marketplace.eclipse.org/content/testng-eclipse
http://marketplace.eclipse.org/content/junit-5-support-oxygen

jboss：
http://marketplace.eclipse.org/content/jboss-tools


python：
http://marketplace.eclipse.org/content/pydev-python-ide-eclipse

eclipse皮肤：
http://marketplace.eclipse.org/content/eclipse-color-theme
http://marketplace.eclipse.org/content/darkest-dark-theme



shell：
http://marketplace.eclipse.org/content/easyshell

ShellEd：使用zip包安装的方式
在http://sourceforge.net/projects/shelled/files/latest/download下载ShellEd的zip包
ShellEd依赖的：
name: man-page viewer
http://download.eclipse.org/technology/linuxtools/updates-nightly/
Name: Dynamic Languages Toolkit
http://download.eclipse.org/technology/dltk/updates-dev/4.0-nightly/ 。



## Python插件

www.python.org上进行下载
这里也主要分为底层语言支持的安装及eclipse插件的安装。
1、双击下载好的python-2.7.11.amd64.msi进行python的相关安装，有的时候可能双击后一闪而过，这可能是你下载的文件有问题重新下载应该就可以解决。
2、狂点下一步，直至安装完成。
3、将python的安装目录(这里为：D:\python)添加到环境变量，然后在命令行中输入"python -V"，即可看到相应的python版本号为2.7.11。

余下的部分就是安装eclipse的python相关插件，并对eclipse进行相关的配置。
打开eclipse，点击"Help" --> "Eclipse Marketplace"，输入"pydev"，点击"Find"
点击"Install"，安装完后会重启eclipse。


接下来就是配置PyDev的过程了。
点击eclipse的"Window" --> "Preferences" --> "PyDev" --> "Interpreters" --> "Python Interpreter" --> "New"
在弹出的菜单中点击"Browse"，选择前面安装python后所生成的python.exe文件。
至此，PyDev的配置已经完成


在Eclipse中安装pydev插件
启动Eclipse, 点击Help->Install New Software...   在弹出的对话框中，点Add 按钮。  Name中填:Pydev,  Location中填http://pydev.org/updates
然后一步一步装下去。  如果装的过程中，报错了。 就重新装。

配置pydev解释器
安装好pydev后， 需要配置Python解释器。
在Eclipse菜单栏中，点击Windows ->Preferences.   
在对话框中，点击pyDev->Interpreter - Python.  点击New按钮， 选择python.exe的路径, 打开后显示出一个包含很多复选框的窗口. 点OK
如果是Mac系统， 点击“Auto Config” 按钮

开始写代码
启动Eclipse,  创建一个新的项目,   File->New->Projects...   选择PyDev->PyDevProject 输入项目名称.
新建 pyDev Package.    就可以写代码了。
输入包名，这里输入Test1

https://www.cnblogs.com/Bonker/p/3584707.html

参考
http://blog.csdn.net/yuanguangyu1221/article/details/50571339





## Scala插件

http://www.scala-lang.org/
https://github.com/scala/scala

http://scala-ide.org/


首先，你需要去Scala的官网上载你需要的安装包
双击进行安装
输入scala -version，可以看到说明Scala已经安装完成，你可以直接输入scala以进入解释器模式。下面则用来配置eclipse的开发环境


eclipse scala插件安装
打开eclipse，并点击"Help"选择其中的"Eclipse Marketplace"，并输入scala，而后点击搜索
点击"Scala IDE 4.7.x"相对应的"Install"按钮，进行安装。

安装Maven-Scala插件
有两种方法：
一是从http://alchim31.free.fr/m2e-scala/update-site/下载，
二是通过Eclipse配置安装。

安装m2e-scala
http://alchim31.free.fr/m2e-scala/update-site/

通过Eclipse配置安装。
第一步：添加远程的原型或模板目录：http://repo1.maven.org/maven2/archetype-catalog.xml
第二步：新建Archetype，因为maven默认没有Group Id: net.alchim31.maven Artifact Id: scala-archetype-simple Version:1.6

创建maven项目适合选择Select an Archetype时候选择scala-archetype-simple类型

参考
http://blog.csdn.net/yuanguangyu1221/article/details/50889522







## SVN插件

https://github.com/subclipse

SVN:http://subversion.apache.org/

eclipse marketplace：
http://marketplace.eclipse.org/content/subversive-svn-team-provider
http://marketplace.eclipse.org/content/subclipse

https://www.eclipse.org/subversive/

TortoiseSVN网址：https://tortoisesvn.net/

subclipse插件网址：http://subclipse.tigris.org/
subclipse插件包下载: http://subclipse.tigris.org/servlets/ProjectDocumentList?folderID=2240

打开Eclipse 4.4，点击菜单Help—>Install New Software
进入安装窗体后，点击安装窗体的Add按钮，然后在弹出的窗体中输入插件安装地址
http://subclipse.trigris.org/update_1.8.x 对应TortoiseSVN 1.7.x 版本
http://subclipse.trigris.org/update_1.10.x 对应TortoiseSVN 1.8.x 版本
http://subclipse.tigris.org/update_1.12.x  对应TortoiseSVN 1.9.x 版本，为目前最高版本的SVN插件(截止到2017年1月20日)， 





