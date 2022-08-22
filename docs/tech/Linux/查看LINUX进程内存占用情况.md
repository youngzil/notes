# 查看LINUX进程内存占用情况



查看下大致情况

可以看到总的62G，已经占用了57G

```
$ free -g
             total       used       free     shared    buffers     cached
Mem:            62         61          1          0          0          4
-/+ buffers/cache:         57          5
Swap:            7          0          7
```


然后再看下，好像没什么有作用的信息，最大的是一个java进程，但是占用不大，而且不知道是什么进程

可以使用 `ps -ef | grep java` 查看java进程

```
$ top
top - 14:22:44 up 2224 days, 20:38,  1 user,  load average: 4.94, 2.92, 2.53
Tasks: 260 total,   1 running, 259 sleeping,   0 stopped,   0 zombie
Cpu0  : 12.5%us,  0.0%sy,  0.0%ni, 87.5%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu1  : 25.0%us,  0.0%sy,  0.0%ni, 75.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu2  : 12.5%us,  0.0%sy,  0.0%ni, 87.5%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu3  :  6.2%us,  0.0%sy,  0.0%ni, 93.8%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu4  :  0.0%us,  6.2%sy,  0.0%ni, 93.8%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu5  :  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu6  : 12.5%us,  0.0%sy,  0.0%ni, 87.5%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu7  :  6.7%us,  6.7%sy,  0.0%ni, 86.7%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu8  :  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu9  :  6.7%us,  0.0%sy,  0.0%ni, 93.3%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu10 : 11.8%us,  5.9%sy,  0.0%ni, 76.5%id,  0.0%wa,  0.0%hi,  5.9%si,  0.0%st
Cpu11 : 12.5%us,  0.0%sy,  0.0%ni, 87.5%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:  65851056k total, 64071568k used,  1779488k free,    18484k buffers
Swap:  8388604k total,        0k used,  8388604k free,  4131116k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
 8675 appweb    20   0 43.6g  16g  21m S 137.5 25.9  16674,01 java
20293 appweb    20   0 15168 1364  928 R  6.3  0.0   0:00.35 top
    1 root      20   0 19232  980  688 S  0.0  0.0   0:09.52 init
    2 root      20   0     0    0    0 S  0.0  0.0   0:00.01 kthreadd
    3 root      RT   0     0    0    0 S  0.0  0.0 117:04.43 migration/0
    4 root      20   0     0    0    0 S  0.0  0.0 254:01.12 ksoftirqd/0
    5 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 stopper/0
    6 root      RT   0     0    0    0 S  0.0  0.0   2:48.04 watchdog/0
    7 root      RT   0     0    0    0 S  0.0  0.0 136:09.68 migration/1
    8 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 stopper/1
    9 root      20   0     0    0    0 S  0.0  0.0 154:14.58 ksoftirqd/1
   10 root      RT   0     0    0    0 S  0.0  0.0   2:28.93 watchdog/1
   11 root      RT   0     0    0    0 S  0.0  0.0 139:15.16 migration/2
   12 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 stopper/2
   13 root      20   0     0    0    0 S  0.0  0.0 128:35.83 ksoftirqd/2
   14 root      RT   0     0    0    0 S  0.0  0.0   2:44.47 watchdog/2
   15 root      RT   0     0    0    0 S  0.0  0.0 145:29.92 migration/3
   16 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 stopper/3
   17 root      20   0     0    0    0 S  0.0  0.0 108:00.74 ksoftirqd/3
   18 root      RT   0     0    0    0 S  0.0  0.0   2:54.11 watchdog/3
   19 root      RT   0     0    0    0 S  0.0  0.0 155:30.92 migration/4
   20 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 stopper/4

```

然后再网上搜到了下面这个命令，rsz就是占用的内存

可以看到占用最大的一个进程是kafka_exporter这个进程占用了大概41G


```
$ ps -e -o 'pid,comm,args,pcpu,rsz,vsz,stime,user,uid' |  sort -nrk5
28887 kafka_exporter  /data/program/kafka/kafka_e  1.9 41362200 42096296 2021 appweb 500
 8675 java            /data/program/java/bin/java  219 17027528 45709020 2021 appweb 500
17447 java            /data/program/java/bin/java  0.0 505416 8212604 2021 appweb    500
31061 filebeat        /usr/share/filebeat/bin/fil  0.9 30420  43872  2019 root         0
23595 wsm-agent       /data/program/wsm-agent/bin  0.2 25012 115628  2020 root         0
21653 SecAgent        /opt/SecAgent/SecAgent       0.2 16280 988760  2019 root         0

```

然后查看kafka相关的进程

可以看到就是这个pid为28887的进程kafka_exporter

于是 $ kill 28887

再次查看$ ps -ef| grep kafka

发现进程不存在了


```
$ ps -ef | grep kafka
appweb   21516 19509  0 14:24 pts/0    00:00:00 grep kafka
appweb   28887     1  1  2021 ?        6-03:26:55 /data/program/kafka/kafka_exporter-1.3.1.linux-amd64/kafka_exporter --kafka.server=10.1.120.6:9094


```

再次查看进程占用情况

发现free已经是45G了，比最开始多了40G

```
$ free -g
             total       used       free     shared    buffers     cached
Mem:            62         21         41          0          0          4
-/+ buffers/cache:         17         45
Swap:            7          0          7
```


再次查看，发现占用进程也不在了


```
$ ps -e -o 'pid,comm,args,pcpu,rsz,vsz,stime,user,uid' |  sort -nrk5
 8675 java            /data/program/java/bin/java  219 17029296 45746180 2021 appweb 500
17447 java            /data/program/java/bin/java  0.0 505412 8212604 2021 appweb    500
31061 filebeat        /usr/share/filebeat/bin/fil  0.9 30460  43872  2019 root         0
23595 wsm-agent       /data/program/wsm-agent/bin  0.2 25016 115628  2020 root         0
21653 SecAgent        /opt/SecAgent/SecAgent       0.2 16280 988760  2019 root         0
19509 bash            -bash                        0.0  1908 108472 14:18 appweb     500
 2395 crond           crond                        0.0  1272 116892  2016 root         0
 8445 sshd            /usr/sbin/sshd               0.0  1124  66224  2016 root         0
    1 init            /sbin/init                   0.0  1040  19232  2016 root         0
31060 filebeat-god    /usr/share/filebeat/bin/fil  0.0    72  11388  2019 root         0
15463 sh              sh socket.sh                 0.1  1636 106492  2018 appweb     500
  PID COMMAND         COMMAND                     %CPU   RSZ    VSZ STIME USER       UID
    9 ksoftirqd/1     [ksoftirqd/1]                0.0     0      0  2016 root         0
   99 cgroup          [cgroup]                     0.0     0      0  2016 root         0
  993 ext4-dio-unwrit [ext4-dio-unwrit]            0.0     0      0  2016 root         0
```



[centos6 free 和 centos 7的free 的差异与对比](https://www.cnblogs.com/operationhome/p/10362776.html)  
[解决Linux系统buff/cache过大的问题 ](https://blog.51cto.com/u_15060546/3995582)  
[Linux命令free -h解释](https://www.cnblogs.com/smlile-you-me/p/15641086.html)  

[【linux】free命令中cached和buffers的区别 ](https://www.cnblogs.com/chenpingzhao/p/5161844.html)

[Linux- 技术专题 -buffer/cache 理解](https://xie.infoq.cn/article/44d5534939ae3411e2558dd9e)  
[Linux 内存 Buffer 和 Cache](https://blog.crazytaxii.com/posts/buffer_and_cache/)  
[Linux中Buffer和Cache的区别](https://blog.51cto.com/ixdba/2045129)  
[Linux内存buffer和cache的区别](https://cloud.tencent.com/developer/article/1375108)  
[Buffer和Cache的区别(转)](https://www.cnblogs.com/ggjucheng/archive/2012/11/14/2770723.html)  


