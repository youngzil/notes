操作系统级别
vim /etc/profile 添加
source /etc/profile

用户级别：ll -a 查看全部文件和目录
修改其个人用户主目录下的.bashrc文件
source /home/msgframe/.bashrc

shell级别：
直接执行export命令



临时性的：
打开Linux终端命令窗口，输入如下命令：
export PATH=$PATH:/usr/local/MATLAB/R2013b/bin
为了验证是否修改成功可以再继续输入命令eport进行查看。在下图中可以看到成功添加了matlab的环境变量。
上面修改后如果退出终端并重新打开再次查看环境变量时就会发现上面添加的环境变量又消失了。即这样只做到了临时性修改环境变量。

如果想要环境变量永久生效可以修改下面两个文件中的任何一个：
1 /etc/profile 
2 .bash_profile或者.bashrc文件
其中，/etc/profile是全局的环境变量，对所有用户生效，而.bash_profile只对当前用户起作用。
上面操作完成后需要注销Linux才能使刚才的环境变量设置生效。


注意：
2、linux下用冒号”:”来分隔路径
3. $PATH / $CLASSPATH / $JAVA_HOME 等是用来引用原来的环境变量的值在设置环境变量时特别要注意不能把原来的值给覆盖掉了。
4. CLASSPATH中当前目录”.”不能丢掉。
5. export是把这三个变量导出为全局变量。
6. 大小写必须严格区分。



Linux启动时~/.bash_profile等文件的执行过程：
在登录Linux时要执行文件的过程如下： 

在刚登录Linux时，首先启动 /etc/profile 文件，
然后再启动用户目录下的 ~/.bash_profile、 ~/.bash_login或 ~/.profile文件中的其中一个，
执行的顺序为：~/.bash_profile、 ~/.bash_login、 ~/.profile。
如果 ~/.bash_profile文件存在的话，一般还会执行 ~/.bashrc文件。因为在 ~/.bash_profile文件中一般会有下面的代码调用~/.bashrc文件，~/.bashrc会调用 /etc/bashrc文件
在退出shell时，还会执行 ~/.bash_logout文件。 

执行顺序为：/etc/profile -> (~/.bash_profile | ~/.bash_login | ~/.profile) -> ~/.bashrc -> /etc/bashrc -> ~/.bash_logout 




https://blog.csdn.net/tom555cat/article/details/45582851

在登录Linux时要执行文件的过程如下： 
在刚登录Linux时，首先启动 /etc/profile 文件，然后再启动用户目录下的 ~/.bash_profile、 ~/.bash_login或 ~/.profile文件中的其中一个，执行的顺序为：~/.bash_profile、 ~/.bash_login、 ~/.profile。如果 ~/.bash_profile文件存在的话，一般还会执行 ~/.bashrc文件。因为在 ~/.bash_profile文件中一般会有下面的代码： 

if [ -f ~/.bashrc ] ; then 

. ./bashrc 

fi 

~/.bashrc中，一般还会有以下代码： 

if [ -f /etc/bashrc ] ; then 

. /bashrc 

fi 

所以，~/.bashrc会调用 /etc/bashrc文件。最后，在退出shell时，还会执行 ~/.bash_logout文件。 

执行顺序为：/etc/profile -> (~/.bash_profile | ~/.bash_login | ~/.profile) -> ~/.bashrc -> /etc/bashrc -> ~/.bash_logout 

关于各个文件的作用域，在网上找到了以下说明： 

（1）/etc/profile： 此文件为系统的每个用户设置环境信息,当用户第一次登录时,该文件被执行. 并从/etc/profile.d目录的配置文件中搜集shell的设置。 

（2）/etc/bashrc: 为每一个运行bash shell的用户执行此文件.当bash shell被打开时,该文件被读取。 

（3）~/.bash_profile: 每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该文件仅仅执行一次!默认情况下,他设置一些环境变量,执行用户的.bashrc文件。 

（4）~/.bashrc: 该文件包含专用于你的bash shell的bash信息,当登录时以及每次打开新的shell时,该该文件被读取。 

（5）~/.bash_logout:当每次退出系统(退出bash shell)时,执行该文件. 另外,/etc/profile中设定的变量(全局)的可以作用于任何用户,而~/.bashrc等中设定的变量(局部)只能继承/etc /profile中的变量,他们是"父子"关系。 

（6）~/.bash_profile 是交互式、login 方式进入 bash 运行的~/.bashrc 是交互式 non-login 方式进入 bash 运行的通常二者设置大致相同，所以通常前者会调用后者。









总的来说profile是在登录后执行一次
bashrc每次打开新的shell时,该文件被读取


============
/etc/profile
============
此文件为系统的每个用户设置环境信息,当用户第一次登录时,该文件被执行.并从/etc/profile.d目录的配置文件中搜集shell的设置.

===========
/etc/bashrc
===========
为每一个运行bash shell的用户执行此文件.当bash shell被打开时,该文件被读取.

===============
~/.bash_profile
===============
每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该文件仅仅执行一次!默认情况下,他设置一些环境变量,执行用户的.bashrc文件.

=========
~/.bashrc
=========
该文件包含专用于你的bash shell的bash信息,当登录时以及每次打开新的shell时,该文件被读取.

==========
~/.profile
==========
在Debian中使用.profile文件代 替.bash_profile文件
.profile(由Bourne Shell和Korn Shell使用)和.login(由C Shell使用)两个文件是.bash_profile的同义词，目的是为了兼容其它Shell。在Debian中使用.profile文件代 替.bash_profile文件。

==============
~/.bash_logout
==============当每次退出系统(退出bash shell)时,执行该文件. 
--------------------- 
作者：JeanCheng 
来源：CSDN 
原文：https://blog.csdn.net/gatieme/article/details/45064705 
版权声明：本文为博主原创文章，转载请附上博文链接！




