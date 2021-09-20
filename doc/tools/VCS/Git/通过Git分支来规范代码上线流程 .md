通过Git分支来规范代码上线流程




Git分支管理规范：Git-flow方式
Git-flow工具：Sourcetree、IDEA插件（Git Flow Integration、GitToolBox、Git Commit Template）
Git提交注释规范：<type>(<scope>): <subject> // 提交消息头Message header 





Git提交注释日志规范
细节见：https://www.jianshu.com/p/d0ba3c2b678d
最广泛的 angular 规范 ，大家可以瞻仰下：  https://github.com/angular/angular/commits/master



![通过Git分支来规范代码上线流程](../../../../docs/images/git上线流程.jpg "ReferencePicture")

或者

Git工作流: 主干开发tag上线

使用git的朋友应该都熟悉一些常见的工作流，比如主干开发分支上线和分支开发主干上线。
前者是指在master分支永远是开发版的最新代码，而分支上则是当前线上部署的代码，后者反之。
这里给大家介绍一个我个人非常习惯的流程：主干开发，Tag上线。


只用master分支，上线打tag
所谓Tag上线是指我们全程都只有一个master分支，所有代码都向master提交，当上线的时候我们会在当前版本上打一个tag, tag名就是版本号，比如v1.0.xxxx。
版本号可以根据一个简单的规则来定，v.主版本号.副版本号.HHmm。其中后面的HHmm表示上线时的小时和分钟，
例如今天下午17点的第一次上线可以叫v1.0.1700, 
如果发现有问题18点又进行了一次上线，可以打一个名为v1.0.1800, 
如果明天晚上又上线了一次，可以将版本号改为v1.1.2015。
使用这种打tag的方式上线有一个好处，那就是可以保留你所有的上线代码版本，你可以随时退回到任意一次上线的代码库，这样就比分支上线方便一些。


修复线上bug  
下面来看一个常见的场景，如果线上遇到bug需要修复而master分支已经提交了新开发的代码了该怎么办呢？
非常简单，使用checkout命令，直接退回到最近一次上线的tag位置，然后以此为基准创建一个新的fix分支:
git checkout fix-bug v1.1.2015

执行完以后就已经在新创建的fix-bug分支了，而且代码已经回到了最近一次上线的状态。
完成修复以后直接commit并打上新的tag, 比如v1.2.xxxx, 最后切回master分支，将fix-bug合并到master即可：
git commit '修复xxx问题'
git tag v1.2.xxxx
git checkout master
git merge v1.2.xxxx
非常简单，而且免除了一个代码库有众多分支难以管理的困扰。



参考  
https://blog.csdn.net/phpwww/article/details/44339647  
http://www.ruanyifeng.com/blog/2012/07/git.html  



