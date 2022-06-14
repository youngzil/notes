# Redis端口由来和命令前缀PF由来


- [Redis端口由来](#Redis端口由来)
- [Redis的数据类型HyperLogLogd的命令为什么是PF开头](#Redis的数据类型HyperLogLogd的命令为什么是PF开头)

---------------------------------------------------------------------------------------------------------------------

## Redis端口由来


今天来聊一个有意思的话题：Redis 的默认端口为什么是 6379 呢?

Redis默认端口号的由来，Redis端口号为啥是6379？前几天Redis作者antirez同学在twitter上说将在下一篇博文中向大家解释为什么他选择6379作为默认端口号。而现在这篇博文出炉，在解释了Redis的LRU机制之后，如期向大家解释了采用6379作为默认端口的原因。

我之前也没有想过为什么Redis的默认端口是6379，估计是随便选的吧。然而今天偶然看到一篇帖子，原来不是随便选的，是有含义的。

[文章地址](http://oldblog.antirez.com/post/redis-as-LRU-cache.html)

Is it a coincidence that it sounds not random enough? Actually not ;) I selected 6379 because of MERZ, and not the other way around.

听起来不够随机是一个巧合吗？实际上不是;）因为MERZ，所以我选择了6379，而不是相反。


Redis端口号6379是电话键盘上（九宫格）的MERZ。

而Merz全名Alessia Merz，是意大利的一位广告女郎

在Antirez看来，这个名字是愚蠢的代名词，所以就选了这个6379。我觉得还是有点侮辱人啊。不过这位姑娘应该也不会关心IT技术圈的事，反而会被广大程序员知道了。



[Redis默认端口号的由来，Redis端口号为啥是6379？](https://panxu.net/article/8327.html)  



---------------------------------------------------------------------------------------------------------------------

## Redis的数据类型HyperLogLogd的命令为什么是PF开头

PFADD key element [element ...]
添加指定元素到 HyperLogLog 中。

PFCOUNT key [key ...]
返回给定 HyperLogLog 的基数估算值。

PFMERGE destkey sourcekey [sourcekey ...]
将多个 HyperLogLog 合并为一个 HyperLogLog



HyperLogLog其实是一种基数计数概率算法，并不是Redis特有的，Redis基于C语言实现了HyperLogLog并且提供了相关命令API入口。

Redis的作者Antirez为了纪念Philippe Flajolet对组合数学和基数计算算法分析的研究，所以在设计HyperLogLog命令的时候使用了Philippe Flajolet姓名的英文首字母PF作为前缀。

也就是说，Philippe Flajolet博士是HLL算法的重大贡献者，但是他其实并不是Redis中HyperLogLog数据类型的开发者。

遗憾的是Philippe Flajolet博士于2011年3月22日因病在巴黎辞世。这个是Philippe Flajolet博士的维基百科照片：


---------------------------------------------------------------------------------------------------------------------


