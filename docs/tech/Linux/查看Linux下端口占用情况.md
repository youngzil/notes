- [查看Linux下端口占用情况](#查看Linux下端口占用情况)
  - [使用netstat命令](#使用netstat命令)
  - [使用lsof命令](#使用lsof命令)
  - [使用示例](#使用示例)




# 查看Linux下端口占用情况



## 使用netstat命令

在Linux使用过程中，需要了解当前系统开放了哪些端口，并且要查看开放这些端口的具体进程和用户，可以通过netstat命令进行简单查询

netstat -tunlp 用于显示 tcp，udp 的端口和进程等相关情况。

Netstat 命令用于显示各种网络相关信息，如网络连接，路由表，接口状态 (Interface Statistics)，masquerade 连接，多播成员 (Multicast Memberships) 等等




netstat命令各个参数说明如下：
```
-t : 指明显示TCP端口
-u : 指明显示UDP端口
-n : 不进行DNS轮询，显示IP(可以加速操作)
-l : 仅显示监听套接字(所谓套接字就是使应用程序能够读写与收发通讯协议(protocol)与资料的程序)
-p : 显示进程标识符和程序名称，每一个套接字/端口都属于一个程序。


-t （tcp）仅显示tcp相关选项
-u (udp) 仅显示udp相关选项
-n 拒绝显示别名，能显示数字的全部转化为数字
-l 仅列出在Listen的服务状态
-p 显示建立相关链接的程序名


```

即可显示当前服务器上所有端口及进程服务，与grep结合可查看某个具体端口及服务情况··

netstat查看端口号占用方式：
```
netstat -tnlp   //查看当前所有tcp端口·
netstat -tunlp | grep 80   //查看所有80端口使用情况·
netstat -tunlp | grep 3306   //查看所有3306端口使用情况·

netstat -tunlp|grep 端口号  
netstat -anp|grep 端口号 
```


直接使用 netstat   -anp   |   grep  portno 即：netstat -anp|grep 8080

查看所有的进程和端口使用情况。发现下面的进程列表，其中最后一栏是PID/Program name

发现8080端口被PID为9658的Java进程占用

进一步使用命令：ps -aux | grep java，或者直接：ps -aux | grep pid 查看

就可以明确知道8080端口是被哪个程序占用了！然后判断是否使用KILL命令干掉！

netstat -anp|grep 8080 --> tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN      28500/java
ps -aux | grep 28500  --> r/local/tomcat9-jforum/tomcat




## 使用lsof命令

lsof(list open files)是一个列出当前系统打开文件的工具。

lsof 查看端口占用方式：
```
lsof -i:端口号
```

lsof -i 需要 root 用户的权限来执行


安装
yum install lsof

```
➜  ~ lsof -i:80

COMMAND  PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
WeChat  2649 lengfeng  280u  IPv4 0x21112d50800cb2b7      0t0  TCP 192.168.2.103:55418->101.91.37.18:http (ESTABLISHED)
WeChat  2649 lengfeng  281u  IPv4 0x21112d507f7b580f      0t0  TCP 172.16.144.244:56384->101.91.37.47:http (CLOSE_WAIT)
WeChat  2649 lengfeng  284u  IPv4 0x21112d507f7962b7      0t0  TCP 172.16.144.244:56385->101.91.37.47:http (CLOSED)
```

具体参数信息如下：
```
COMMAND:进程的名称 PID:进程标识符
USER:进程所有者
FD:文件描述符，应用程序通过文件描述符识别该文件。如cwd等
TYPE:文件类型
DEVICE:指定磁盘的名称
SIZE:文件的大小
NODE:索引节点（文件在磁盘上的标识）
NAME:打开文件的确切名称
```


更多 lsof 的命令如下：
```
lsof -i:8080 查看8080端口占用，显示所有打开8080端口的进程
lsof abc.txt 显示开启文件abc.txt的进程
lsof -c abc 显示abc进程现在打开的文件
lsof -c -p 1234 列出进程号为1234的进程所打开的文件
lsof -g gid 显示归属gid的进程情况
lsof +d /usr/local/ 显示目录下被进程开启的文件
lsof +D /usr/local/ 同上，但是会搜索目录下的目录，时间较长
lsof -d 4 显示使用fd为4的进程
lsof -i 用以显示符合条件的进程情况
lsof -i //显示所有打开的端口
lsof -i -U //显示所有打开的端口和UNIX domain文件

lsof -i[46] [protocol][@hostname|hostaddr][:service|port]
参数解释
46 --> IPv4 or IPv6
protocol --> TCP or UDP
hostname --> Internet host name
hostaddr --> IPv4地址
service --> /etc/service中的 service name (可以不止一个)
port --> 端口号 (可以不止一个)

```



## 使用示例

第一步：使用`lsof -i:3306` 或者 `netstat -tunlp | grep 3306` 查询端口占用的进程，找到pid
第二步：使用`ps -aux | grep 16422` 查看进程的详细信息
第三步：kill


```
[root@VM_39_230_centos bin]# lsof -i:3306
COMMAND   PID  USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
mysqld  16422 mysql   19u  IPv6 148794      0t0  TCP *:mysql (LISTEN)
mysqld  16422 mysql   39u  IPv6 643698      0t0  TCP localhost:mysql->localhost:36582 (ESTABLISHED)
mysqld  16422 mysql   45u  IPv6 643699      0t0  TCP localhost:mysql->localhost:36584 (ESTABLISHED)
mysqld  16422 mysql   46u  IPv6 643700      0t0  TCP localhost:mysql->localhost:36586 (ESTABLISHED)
mysqld  16422 mysql   47u  IPv6 643702      0t0  TCP localhost:mysql->localhost:36588 (ESTABLISHED)
mysqld  16422 mysql   48u  IPv6 643704      0t0  TCP localhost:mysql->localhost:36590 (ESTABLISHED)
java    17302  root  122u  IPv4 643695      0t0  TCP localhost:36582->localhost:mysql (ESTABLISHED)
java    17302  root  123u  IPv4 643701      0t0  TCP localhost:36588->localhost:mysql (ESTABLISHED)
java    17302  root  124u  IPv4 643696      0t0  TCP localhost:36586->localhost:mysql (ESTABLISHED)
java    17302  root  125u  IPv4 643697      0t0  TCP localhost:36584->localhost:mysql (ESTABLISHED)
java    17302  root  126u  IPv4 643703      0t0  TCP localhost:36590->localhost:mysql (ESTABLISHED)
```

或者

```
[root@VM_39_230_centos bin]# netstat -tunlp | grep 3306
tcp6       0      0 :::3306                 :::*                    LISTEN      16422/mysqld
```


找到pid  然后

```
[root@VM_39_230_centos bin]# ps -aux | grep 16422
mysql    16422  0.0 47.7 1340428 485944 ?      Sl   Jun29   1:46 /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib64/mysql/plugin --log-error=/var/lib/mysql/VM_39_230_centos.err --pid-file=/var/lib/mysql/VM_39_230_centos.pid
root     25713  0.0  0.0 112616   700 pts/0    R+   17:04   0:00 grep --color=auto 16422
```


