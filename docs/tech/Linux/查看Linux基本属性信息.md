- [查看Linux基本属性信息](#查看Linux基本属性信息)
  - [系统](#系统)
  - [资源](#资源)
  - [磁盘和分区](#磁盘和分区)
  - [网络](#网络)
  - [进程](#进程)
  - [用户](#用户)
  - [服务](#服务)
  - [程序](#程序)
  - [查看机器所有硬件信息](#查看机器所有硬件信息)
  - [Linux版本信息](#Linux版本信息)
    - [查看centos版本号](#查看centos版本号)
    - [查看系统信息](#查看系统信息)
  - [查看Linux是64位还是32位](#查看Linux是64位还是32位)
  - [查看CPU信息](#查看CPU信息)
  - [查看Mem内存信息](#查看Mem内存信息)
  - [查看磁盘信息](#查看磁盘信息)
  - [查看网卡信息](#查看网卡信息)
  - [查看ip,hostname,cpu,memory,disk](#查看ip,hostname,cpu,memory,disk)



# 查看Linux基本属性信息


## 系统

```
# uname -a # 查看内核/操作系统/CPU信息
# head -n 1 /etc/issue # 查看操作系统版本
# cat /proc/cpuinfo # 查看CPU信息
# cat /proc/version # 查看操作系统详情信息
# hostname # 查看计算机名
# lspci -tv # 列出所有PCI设备
# lsusb -tv # 列出所有USB设备
# lsmod # 列出加载的内核模块
# env # 查看环境变量
```



## 资源

```
# free -m # 查看内存使用量和交换区使用量
# df -h # 查看各分区使用情况
# du -sh <目录名> # 查看指定目录的大小
# grep MemTotal /proc/meminfo # 查看内存总量
# grep MemFree /proc/meminfo # 查看空闲内存量
# uptime # 查看系统运行时间、用户数、负载
# cat /proc/loadavg # 查看系统负载
```


## 磁盘和分区

```
# mount | column -t # 查看挂接的分区状态
# fdisk -l # 查看所有分区
# swapon -s # 查看所有交换分区
# hdparm -i /dev/hda # 查看磁盘参数(仅适用于IDE设备)
# dmesg | grep IDE # 查看启动时IDE设备检测状况
```


## 网络

```
# ifconfig # 查看所有网络接口的属性
# iptables -L # 查看防火墙设置
# route -n # 查看路由表
# netstat -lntp # 查看所有监听端口
# netstat -antp # 查看所有已经建立的连接
# netstat -s # 查看网络统计信息
```


## 进程

```
# ps -ef # 查看所有进程
# top # 实时显示进程状态
```


## 用户

```
# w # 查看活动用户
# id <用户名> # 查看指定用户信息
# last # 查看用户登录日志
# cut -d: -f1 /etc/passwd # 查看系统所有用户
# cut -d: -f1 /etc/group # 查看系统所有组
# crontab -l # 查看当前用户的计划任务
```

## 服务

```
# chkconfig --list # 列出所有系统服务
# chkconfig --list | grep on # 列出所有启动的系统服务
```

## 程序

```
# rpm -qa # 查看所有安装的软件包
```


## 查看机器所有硬件信息

这2个命令出来的信息都非常多,所以建议后面使用"|more"便于查看
```
dmidecode |more

dmesg |more

5、显示主板序列号 
# dmidecode | grep 'Serial Number'   


# cat /etc/issue | grep Linux
Red Hat Enterprise Linux AS release 4 (Nahant Update 5)
(查看当前操作系统发行版信息)

查看机器型号
# dmidecode | grep "Product Name"

```



## Linux版本信息

### 查看centos版本号

两种方式：
```
cat /etc/redhat-release
cat /etc/issue

head -n 1 /etc/issue # 查看操作系统版本，是数字1不是字母L
```

### 查看系统信息
```
# uname -a
Linux euis1 2.6.9-55.ELsmp #1 SMP Fri Apr 20 17:03:35 EDT 2007 i686 i686 i386 GNU/Linux
(查看当前操作系统内核信息)

uname -a # 查看内核/操作系统/CPU信息的linux系统信息命令

uname --help
-a, --all                print all information, in the following order,
except omit -p and -i if unknown:
-s, --kernel-name        print the kernel name
-n, --nodename           print the network node hostname
-r, --kernel-release     print the kernel release
-v, --kernel-version     print the kernel version
-m, --machine            print the machine hardware name
-p, --processor          print the processor type or "unknown"
-i, --hardware-platform  print the hardware platform or "unknown"
-o, --operating-system   print the operating system
--help     display this help and exit
--version  output version information and exit
```

## 查看Linux是64位还是32位

五种方式：
```
getconf LONG_BIT
 
uname -m
 
arch
 
file /sbin/init
 
#结果大于1就是64位，否则32位
cat /proc/cpuinfo | grep flags | grep ' lm ' | wc -l 

查看CPU的位数:
getconf LONG_BIT

# getconf LONG_BIT
32
(说明当前 CPU 运行在 32bit 模式下，但不代表 CPU 不支持 64bit)

# cat /proc/cpuinfo | grep flags | grep ' lm ' | wc -l
8
(结果大于 0, 说明支持 64bit 计算. lm 指 long mode, 支持 lm 则是 64bit)


```


## 查看CPU信息
```
lscpu

cat /proc/cpuinfo  查看cpu 

cat /proc/meminfo  查看内存

# cpu核心数计算
# 总核数 = 物理CPU个数 X 每颗物理CPU的核数 
# 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数

# 查看物理CPU个数
cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l

# 查看每个物理CPU中core的个数(即核数)
cat /proc/cpuinfo| grep "cpu cores"| uniq

# 查看逻辑CPU的个数
cat /proc/cpuinfo| grep "processor"| wc -l


2. cpu型号查看：model name

# 查看CPU信息（型号）
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c #uniq:去除重复行 -c参数：在输出行前面加上每行在输入文件中出现的次数


查看 CPU 信息（型号）
# cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
      8  Intel(R) Xeon(R) CPU            E5410   @ 2.33GHz
(看到有 8 个逻辑 CPU, 也知道了 CPU 型号)

# cat /proc/cpuinfo | grep physical | uniq -c
      4 physical id      : 0
      4 physical id      : 1
(说明实际上是两颗 4 核的 CPU)


再完整看 cpu 详细信息，不过大部分我们都不关心而已.
# dmidecode | grep 'Processor Information'


方法一:
Linux下CPU相关的参数保存在 /proc/cpuinfo 文件里
cat /proc/cpuinfo |more

方法二:
采用命令 dmesg | grep CPU 可以查看到相关CPU的启动信息
   
查看CPU的位数:
getconf LONG_BIT

# getconf LONG_BIT
32
(说明当前 CPU 运行在 32bit 模式下，但不代表 CPU 不支持 64bit)

# cat /proc/cpuinfo | grep flags | grep ' lm ' | wc -l
8
(结果大于 0, 说明支持 64bit 计算. lm 指 long mode, 支持 lm 则是 64bit)



```



## 查看Mem内存信息
```
free -h
 
free -m

top

cat /proc/cpuinfo  查看cpu 

cat /proc/meminfo  查看内存

cat /proc/meminfo |more （注意输出信息的最后一行:MachineMem:   41932272 kB）


内存大小
cat /proc/meminfo |grep MemTotal
```

## 查看磁盘信息
```
df -h

du -sh <目录名> # 查看指定目录的大小

测试没权限
fdisk -l 可以看到系统上的磁盘(包括U盘)的分区以及大小相关信息。

直接查看
cat /proc/partitions


3、查看硬盘型号          
# more /proc/scsi/scsi |grep -i model  
# cat  /proc/scsi/scsi |grep -i model  

硬盘大小
fdisk -l |grep Disk


```

## 查看网卡信息

```
查看网卡信息
# dmesg | grep -i eth


4. 显示有几块物理网卡
# lspci | grep Eth | wc -l     

```

## 查看ip,hostname,cpu,memory,disk

```
ip a
ip=`ifconfig|egrep -o "\<(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\>"|head -1`
echo ip=$ip
 
hostname=`hostname`
echo "主机名=$hostname"

cores=`cat /proc/cpuinfo| grep "processor"| wc -l`
echo "逻辑cpu个数=$cores"
 
memory=`free -h|awk 'NR==2{print $2}'`
echo "内存大小=$memory"

disk=`lsblk -db|awk 'NR>1{sum+=$4} END {print sum/1024/1024/1024}'`
echo "磁盘总大小=${disk}G"

```





参考

[linux查看硬件配置命令的方法示例](https://cloud.tencent.com/developer/article/1722058)

[如何查看Linux 硬件配置信息](https://www.cnblogs.com/zjiizj/archive/2010/02/25/1673503.html)

[查看linux系统常用的命令，Linux查看系统配置常用命令](https://blog.51cto.com/u_12826294/3092638)

