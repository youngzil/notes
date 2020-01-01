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



