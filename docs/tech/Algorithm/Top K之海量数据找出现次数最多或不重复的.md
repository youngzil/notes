# Top K之海量数据找出现次数最多或不重复的


1、海量数据 求最大的 K个数问题，如何解决？
2、海量数据求中位数，如何解决？
3、在海量数据中找出出现频率最高的前k个数
4、给40亿个不重复的unsigned int的整数，没排过序的，然后再给一个数，如何快速判断这个数是否在那40亿个数当中？

大概统计一下，海量数据求 TopK 的普遍方法

如何判断一个元素是否存在一个集合中？





---------------------------------------------------------------------------------------------------------------------
  
  
海量数据找出不重复的元素  
思路一：  
分治法 + HashMap (HashMap 不要局限在 Java 语言)  
  
思路二：  
位图法 Bitmap(一个 bit 仅会是 0 或 1)  
  
  
  
海量数据找出出现次数最多的  
  
思路一：  
分治法 + HashMap  
  
  
纯数字的可以考虑  
思路二：  
位图法 Bitmap  
  
  
参考  
https://juejin.im/post/5aa0ee9f518825557c010bc0  






---------------------------------------------------------------------------------------------------------------------  

海量数据 求最大的 K个数问题，如何解决？

1、按位划分区域，可以尽快的缩小范围，比如最高位 0 分一堆，1 分成一堆而且不用排序，这是第一选择。
2、最经典的方法当然是 堆 了，比如要求前1000个最大的数，那就直接建一个 1000 大小的小根堆，然后遍历，只要发现后面的数比小根堆的根节点大，就把根节点和该数交换，重新调整堆，遍历完之后，堆中的数自然就是最大的 1000 个数了；
3、当然能使用堆排序的前提是内存中要能够放得下这个 K，如果放不下呢？那就只能外部排序了，排序完之后拿到第 K 大的数即可，当然排序前可以和方法一搭配一下。
  
  
  
---------------------------------------------------------------------------------------------------------------------  
海量数据求中位数，如何解决？

1、可以按照位来分组，比如说最高位是0的一组，是 1 的一组，这样可以统计出那一组更少，这样就排除了一大半，然后继续这样排查，最终缩小范围后直接内部排序。
2、直接外部排序，然后取中间值，最笨的方法。

---------------------------------------------------------------------------------------------------------------------  

在海量数据中找出出现频率最高的前k个数

例如，在搜索引擎中，统计搜索最热门的10个查询词；在歌曲库中统计下载最高的前10首歌等。

1、如果重复率很高，可以采用前缀树，因为 trie 树适用于数据量大，重复多，但是数据种类小必须得可以放入内存；
2、按照 hash 进行分组，这样就能避免相同的数分到不同区域去了，导致不好统计。hash 分组完毕后，然后用前缀树 或者 hashmap 来计算每个组的前 k 个频率最高的数，最后对各个组的前 k 个数进行统计即可。





---------------------------------------------------------------------------------------------------------------------  

给40亿个不重复的unsigned int的整数，没排过序的，然后再给一个数，如何快速判断这个数是否在那40亿个数当中？


1、这里我们把40亿个数中的每一个用32位的二进制来表示 假设这40亿个数开始放在一个文件中。

2、然后将这40亿个数分成两类: 1.最高位为0 2.最高位为1 并将这两类分别写入到两个文件中，其中一个文件中数的个数<=20亿，而另一个>=20亿（这相当于折半了）；与要查找的数的最高位比较并接着进入相应的文件再查找

3、再然后把这个文件为又分成两类: 1.次最高位为0 2.次最高位为1

4、并将这两类分别写入到两个文件中，其中一个文件中数的个数<=10亿，而另一个>=10亿（这相当于折半了）；与要查找的数的次最高位比较并接着进入相应的文件再查找。……. 以此类推，就可以找到了,而且时间复杂度为O(logn)。



---------------------------------------------------------------------------------------------------------------------  

大概统计一下，海量数据求 TopK 的普遍方法：

1、最快的不需要排序就能排除一大堆的数据的方法就是看 “位”，比如最高位为 0 的分一块，为 1 的分一块，这样迅速就分出一大块不需要的了，尤其适合找中位数，等分的差不多了就可以进行内部排序了。

2、堆排序，适用于求海量数据最大 K or 最小的 K 个数；

3、分治hash，适用于那些内存很小，数据很大，但是又想求最大的 K 个众数的问题，可以先 hash 到很多个组，然后在组内部使用 hashmap 或者 前缀树 「google等字符」，取到组内前 K 个众数，最后进行组间比较久okay了；

4、当然不能忘了万能法，那就是外部排序，然后再进行相应的处理。




---------------------------------------------------------------------------------------------------------------------  

如何判断一个元素是否存在一个集合中？


先来看几个比较常见的例子
字处理软件中，需要检查一个英语单词是否拼写正确
在 FBI，一个嫌疑人的名字是否已经在嫌疑名单上
在网络爬虫里，一个网址是否被访问过
yahoo, gmail等邮箱垃圾邮件过滤功能



这几个例子有一个共同的特点： 如何判断一个元素是否存在一个集合中？

这里必须介绍一下 bitmap 这个方法了，例如我要从海量数据中找一个数是否出现过，就可以用位图的思路去做，如果数字是 7 ，那就在第 7 位 置 1，如果该位置已经是 1 了，那就代表出现过，不用更改。

如果问题变为从海量数据中找一个数是否出现过一次，那这个时候就得用 2 bitmap 来表示了，也就是一个数如果出现一次，置为 01 ，出现过两次，置为 10，然后再出现，都是10，这个时候如果我们只用一位，是不能表示出出现的次数的。

至于我们常说的布隆过滤器，其实也就是在bitmap之前进行一个hash，例如将字符串进行hash成数组，然后使用位图，解决这类问题。


