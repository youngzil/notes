# Linux Java(Spring) Java(Quartz) 定时任务表达式格式说明，对比

## Cron表达式

CRON表达式是一个字符串，包含五个到七个由空格分隔的字段（每种软件不一样），表示一组时间，通常作为执行某个程序的时间表。

注释以注释标记#开始，并且必须单独在一行上

参考 [Cron在线工具](https://tool.lu/crontab/)





## Java(Spring)与Java(Quartz)

根据crontab，Java语言有两种，区别：

1. Quartz支持7位，第7位可选；
2. 第6位，只支持1-7；而Spring支持0-7，0和7都表示sun；
3. 

## Linux Cron

```
例子：
    # 每月的最后1天
    0 0 L * * *

    说明：
    Linux
    *    *    *    *    *
    -    -    -    -    -
    |    |    |    |    |
    |    |    |    |    +----- day of week (0 - 7) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
    |    |    |    +---------- month (1 - 12) OR jan,feb,mar,apr ...
    |    |    +--------------- day of month (1 - 31)
    |    +-------------------- hour (0 - 23)
    +------------------------- minute (0 - 59)
```



```
* * * * * command(s)
^ ^ ^ ^ ^
| | | | |     allowed values
| | | | |     -------
| | | | ----- Day of week (0 - 7) (Sunday=0 or 7)
| | | ------- Month (1 - 12)
| | --------- Day of month (1 - 31)
| ----------- Hour (0 - 23)
------------- Minute (0 - 59)

```



[Cron作业](https://www.myfreax.com/cron-jobs-every-5-10-15-minutes/)

## Java(Spring)

```
例子：
    # 每月的最后1天
    @Scheduled(cron = "0 0 18 28-31 * ?")
    public void doAtLastDayOfMonth() {
        final Calendar calendar = Calendar.getInstance();
        if (c.get(Calendar.DATE) == c.getActualMaximum(Calendar.DATE)) {
            // do something here...
        }
    }

    说明：
    Java(Spring)
    *    *    *    *    *    *
    -    -    -    -    -    -
    |    |    |    |    |    |
    |    |    |    |    |    +----- day of week (0 - 7) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
    |    |    |    |    +---------- month (1 - 12) OR jan,feb,mar,apr ...
    |    |    |    +--------------- day of month (1 - 31)
    |    |    +-------------------- hour (0 - 23)
    |    +------------------------- min (0 - 59)
    +------------------------------ second (0 - 59)
```

## Java(Quartz)

```
例子：
    # 每月的最后1天
    @Scheduled(cron = "0 0 18 L * ?")
    public void doAtLastDayOfMonth() {
        // do something here...
    }

    说明：
    Java(Quartz)
    *    *    *    *    *    *    *
    -    -    -    -    -    -    -
    |    |    |    |    |    |    |
    |    |    |    |    |    |    + year [optional]
    |    |    |    |    |    +----- day of week (1 - 7) sun,mon,tue,wed,thu,fri,sat
    |    |    |    |    +---------- month (1 - 12) OR jan,feb,mar,apr ...
    |    |    |    +--------------- day of month (1 - 31)
    |    |    +-------------------- hour (0 - 23)
    |    +------------------------- min (0 - 59)
    +------------------------------ second (0 - 59)
```

| 字段         | 是否必填 | 允许值          | 允许特殊字符       | 备注                                                         |
| :----------- | :------- | :-------------- | :----------------- | :----------------------------------------------------------- |
| Seconds      | 是       | 0–59            | `*``,``-`          | 标准实现不支持此字段。                                       |
| Minutes      | 是       | 0–59            | `*``,``-`          |                                                              |
| Hours        | 是       | 0–23            | `*``,``-`          |                                                              |
| Day of month | 是       | 1–31            | `*``,``-``?``L``W` | `?``L``W`只有部分软件实现了                                  |
| Month        | 是       | 1–12 or JAN–DEC | `*``,``-`          |                                                              |
| Day of week  | 是       | 0–7 or SUN–SAT  | `*``,``-``?``L``#` | `?``L``#`只有部分软件实现了 Linux和Spring的允许值为0-7，0和7为周日 Quartz的允许值为1-7，1为周日 |
| Year         | 否       | 1970–2099       | `*``,``-`          | 标准实现不支持此字段。                                       |



#### 标准字段

**逗号**用于分隔列表。例如，在第5个字段(星期几)中使用 `MON,WED,FRI` 表示周一、周三和周五。

**连字符**定义范围。例如，`2000-2010` 表示2000年至2010年期间的每年，包括2000年和2010年。

除非用反斜杠(\)转义，否则命令中的**百分号(%)**会被替换成换行符，第一个百分号后面的所有数据都会作为标准输入发送给命令。

#### 非标准字段

**“L”**代表“Last”。当在星期几字段中使用的时候，可以指定给定月份的结构，例如“最后一个星期五”(`5L`)。在月日字段中，可以指定一个月的最后一天。

“day of month”字段可以使用**“W”**字符。指定最接近给定日期的工作日（星期一-星期五）。例如，`15W`，意思是：“最接近该月15日的工作日。”；所以，如果15号是星期六，触发器在14号星期五触发。如果15日是星期天，触发器在16日星期一触发。如果15号是星期二，那么它在15号星期二触发。“1W”，如果这个月的第一天是星期六，不会跨到上个月，触发器会在这个月的第三天（也就是星期一）触发。只有指定一天（不能是范围或列表）的时候，才能指定“W”字符。

星期几字段可以使用**“#”**，后面必须跟一个介于1和5之间的数字。例如，`5#3`表示每个月的第三个星期五。

在某些实现中，**“?”**用来代替“*”以将月中的某一天或周中的某一天留空。其他cron的实现是替换**“?”**为cron守护进程的启动时间，例如：？？* * * *，如果cron在上午8:25启动，将更新为25 8 * * * *并在每天的这个时间运行，直到再次重新启动。

分钟字段设置 `***/**5`表示每5分钟一次，注意：这里指的是能被5整除的分钟数。





## QuartZ Cron表达式

### CronTrigger

CronTriggers往往比SimpleTrigger更有用，如果您需要基于日历的概念，而非SimpleTrigger完全指定的时间间隔，复发的发射工作的时间表。

### Cron Expressions

cron的表达式被用来配置CronTrigger实例。 cron的表达式是字符串，实际上是由七子表达式，描述个别细节的时间表。这些子表达式是分开的空白，代表：

1.        Seconds
2.        Minutes
3.        Hours
4.        Day-of-Month
5.        Month
6.        Day-of-Week
7.        Year (可选字段)



例  "0 0 12 ? * WED" 在每星期三下午12:00 执行,

个别子表达式可以包含范围, 例如，在前面的例子里("WED")可以替换成 "MON-FRI", "MON, WED, FRI"甚至"MON-WED,SAT".

“*” 代表整个时间段.

每一个字段都有一套可以指定有效值，如

**Seconds** (秒)     ：可以用数字0－59 表示，

**Minutes(**分)     ：可以用数字0－59 表示，

**Hours(**时)       ：可以用数字0-23表示,

**Day-of-Month(**天) ：可以用数字1-31 中的任一一个值，但要注意一些特别的月份

**Month(**月)      ：可以用0-11 或用字符串  “JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV and DEC” 表示

**Day-of-Week(****每周****)****：**可以用数字1-7表示（1 ＝ 星期日）或用字符口串“SUN, MON, TUE, WED, THU, FRI and SAT”表示

“/”：为特别单位，表示为“每”如“0/15”表示每隔15分钟执行一次,“0”表示为从“0”分开始, “3/20”表示表示每隔20分钟执行一次，“3”表示从第3分钟开始执行

“?”：表示每月的某一天，或第周的某一天

“L”：用于每月，或每周，表示为每月的最后一天，或每个月的最后星期几如“6L”表示“每月的最后一个星期五”

“W”：表示为最近工作日，如“15W”放在每月（day-of-month）字段上表示为“到本月15日最近的工作日”

““#”：是用来指定“的”每月第n个工作日,例 在每周（day-of-week）这个字段中内容为"6#3" or "FRI#3" 则表示“每月第三个星期五”



1）Cron表达式的格式：秒 分 时 日 月 周 年(可选)。

​        字段名         允许的值            允许的特殊字符 
​        秒             0-59                , - * / 
​        分             0-59                , - * / 
​        小时           0-23                , - * / 
​        日             1-31                , - * ? / L W C 
​        月             1-12 or JAN-DEC     , - * / 
​        周几           1-7 or SUN-SAT      , - * ? / L C # 
​        年 (可选字段)   empty, 1970-2099   , - * /

 

​        “?”字符：表示不确定的值

​        “,”字符：指定数个值

​        “-”字符：指定一个值的范围

​        “/”字符：指定一个值的增加幅度。n/m表示从n开始，每次增加m

​        “L”字符：用在日表示一个月中的最后一天，用在周表示该月最后一个星期X

​        “W”字符：指定离给定日期最近的工作日(周一到周五)

​        “#”字符：表示该月第几个周X。6#3表示该月第3个周五



​     2）Cron表达式范例：

​         每隔5秒执行一次：*/5 * * * * ?

​         每隔1分钟执行一次：0 */1 * * * ?

​         每天23点执行一次：0 0 23 * * ?

​         每天凌晨1点执行一次：0 0 1 * * ?

​         每月1号凌晨1点执行一次：0 0 1 1 * ?

​         每月最后一天23点执行一次：0 0 23 L * ?

​         每周星期天凌晨1点实行一次：0 0 1 ? * L

​         在26分、29分、33分执行一次：0 26,29,33 * * * ?

​         每天的0点、13点、18点、21点都执行一次：0 0 0,13,18,21 * * ?



[Quartz-SimpleTrigger解读](https://bbs.huaweicloud.com/blogs/299312)

[Quartz定时任务框架(三)SimpleTrigger和CronTrigger、最详细的Cron表达式范例](https://blog.csdn.net/Ditto_zhou/article/details/81329566)



## Java解析cron表达式

### 在线工具
很多，推荐使用第一个，因为cron表达式有各种不同的类型，不同类型直接还是有一些细微的差别。
https://tool.lu/crontab
https://cron.qqe2.com/
https://www.bejson.com/othertools/cron/
https://www.bejson.com/othertools/cronvalidate/

### spring scheduling
在spring-context artifact的springframework.scheduling包下面，CronSequenceGenerator

### quartz
org.quartz.CronExpression

### cron-utils
官网：http://cron-parser.com/
GitHub https://github.com/jmrozanec/cron-utils
GitHub-examples https://github.com/jmrozanec/cron-utils-examples
https://awesomeopensource.com/project/jmrozanec/cron-utils
https://www.openhub.net/p/cron-utils

```
<dependency>
    <groupId>com.cronutils</groupId>
    <artifactId>cron-utils</artifactId>
    <version>9.1.5</version>
</dependency>

```



### cron-parser

[GitHub](https://github.com/FrancescoSerra/cron-parser)
https://suhasjavablog.wordpress.com/2014/04/01/how-to-generate-a-cron-expression-from-a-date-object/





参考

[Java解析cron表达式](https://blog.csdn.net/lonelymanontheway/article/details/108391851)