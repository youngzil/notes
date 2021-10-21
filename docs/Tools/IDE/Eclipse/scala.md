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





