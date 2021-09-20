



---------------------------------------------------------------------------------------------------------------------


Fielding将他对互联网软件的架构原则，定名为REST，即Representational State Transfer的缩写。我对这个词组的翻译是"表现层状态转化"。

如果一个架构符合REST原则，就称它为RESTful架构。

REST的名称"表现层状态转化"中，省略了主语。"表现层"其实指的是"资源"（Resources）的"表现层"。

综合上面的解释，我们总结一下什么是RESTful架构：
　　（1）每一个URI代表一种资源；
　　（2）客户端和服务器之间，传递这种资源的某种表现层；
　　（3）客户端通过四个HTTP动词，对服务器端资源进行操作，实现"表现层状态转化"。


RESTful API 最佳实践
1、URL 设计：动词 + 宾语

动词通常就是五种 HTTP 方法，对应 CRUD 操作。
GET：读取（Read）
POST：新建（Create）
PUT：更新（Update）
PATCH：更新（Update），通常是部分更新
DELETE：删除（Delete）






参考
https://www.ruanyifeng.com/blog/2011/09/restful.html
http://www.ruanyifeng.com/blog/2018/10/restful-api-best-practices.html
https://www.zhihu.com/question/28557115
https://zhuanlan.zhihu.com/p/30396391

---------------------------------------------------------------------------------------------------------------------
























