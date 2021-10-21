





---------------------------------------------------------------------------------------------------------------------
## VCS介绍

Version Control Systems


版本控制是指对某些（通常是基于文本的）文档的修订编目。虽然术语“版本控制”通常与程序员相关，但它同样适用于作家、记者甚至大学生。自动跟踪文档修订和版本的常见服务示例包括 Google Docs 和 Dropbox。

试试看！在 Google Docs 中，只需点击“文件”->“查看修订历史”。在 Dropbox 中，只需右键单击已修改的文件，然后单击“查看以前的版本”。



Below is a list of these VCS, categorized by generation:

1. First Generation
- SCCS (Source Code Control System)
- RCS (Revision Control System)

2. Second Generation
- CVS (Concurrent Versions System)
- SVN (Apache Subversion)
- Perforce Helix Core

3. Third Generation
- Git
- Mercurial
- BitKeeper
- Darcs (Darcs Advanced Revision Control System)
- Monotone
- Bazaar
- Fossil
- Pijul


参考  
[he Evolution Of Version Control System (VCS) Internals](https://initialcommit.com/blog/Technical-Guide-VCS-Internals)  







Subversion (SVN)、Git、Mercurial 和 Bazaar 都是积极开发的版本控制软件解决方案  
目前IDEA支持Subversion (SVN)、Git、Mercurial
Git, GitHub, SVN, Mercurial, Perforce


Git vs Mercurial vs SVN(Subversion)


SVN 与 Git 和 Mercurial 不同，因为它是一个所有用户都必须拉取和提交的单一存储库。

Git 和 Mercurial 有一个分布式模型。这意味着每台计算机上都有一个存储库，并且通常有一个“官方”存储库，人们会选择向其提交更改并从中提取。

Git 和 Mercurial 非常相似。我更喜欢 Mercurial，因为我发现它更易于使用。对于 2 人团队，我会推荐 Mercurial，但这只是我的意见。如果您不熟悉版本控制，那么您仍然需要花时间学习使用任何选项，但 Mercurial 对我来说似乎是最简单的。

要启动 Mercurial 存储库，您所要做的就是打开一个 shell 并 cd 到您想要进行版本控制的目录，然后输入hg init. 这将创建存储库。要将文件夹中的所有内容添加到存储库，请键入hg add .。  
以下是一些其他的各种命令：  
- 要提交本地更改： hg commit -m "Descriptions of changes"
- 从服务器拉取到最新版本： hg pull
- 要推送本地更改： hg push


首先，它们是用什么语言编写的。我使用 Git 和 Mercurial 的经历非常相似，但我知道如果我想调整 Mercurial，我可以做到，因为它是用 Python 编写的。Git 至少有点用 C 语言，我不太熟悉。

Git 和 Mercurial 就是所谓的分布式。每个副本都是平等的，它们可以在临时基础上相互推送和拉取（使用该术语）更改。另一方面，Subversion 由一个单一的中央存储库组成，每个工作副本都是该中央服务器的从属，推拉（在这种情况下是提交和更新）来自它和它本身的更改。

为几个人安装 Git 或 Mercurial 包括获得对同一服务器的 SSH 访问权限并安装几个软件包。而对于 SVN，据我所知，您需要在 Apache 下配置和运行一个实际的服务器应用程序，然后使用 SSL 证书和 .htaccess 等来保护它。

对于我所有的个人项目，我使用 Mercurial 或 Git。如果我与一个大型团队一起工作，我可能会选择 Subversion，因为您可以获得集中式身份验证和托管。但是对于两个人，我会选择分布式的一个，因为这样您就不必搞乱集中式身份验证和托管。:-)



Git 和 Mercurial 非常相似（但足够不同以保证谨慎）。另一方面，SVN 则完全不同：前两个是分布式 VCS，因此它们不需要中央服务器，而 SVN 则需要。一般来说，许多项目都在向分布式系统发展。

对于您的小项目，使用 Git 或 Mercurial 可能会更好。你选择哪一个本质上是一个品味问题，尽管我自己更喜欢 Git（并且更熟悉它）。您根本不需要设置服务器：您可以通过 SSH 推送/拉取更改，甚至可以通过电子邮件向彼此发送补丁（这可以直接从 VCS 完成，但有点麻烦）。您可以随时设置中央服务器，所有更改都将在那里。您可以使用例如 GitHub 或 Gitorious 来托管您的项目（如果您使用 Git，我不了解 Mercurial）。


参考  
[Git vs Mercurial vs SVN](https://stackoverflow.com/questions/3183064/git-vs-mercurial-vs-svn)  
[2020 Version Control Software Comparison: SVN, Git, Mercurial](https://biz30.timedoctor.com/git-mecurial-and-cvs-comparison-of-svn-software/)  
[Git vs Mercurial vs SVN (Subversion)](https://stackshare.io/stackups/git-vs-mercurial-vs-svn)  
[Git vs. SVN: Which version control system is right for you?](https://backlog.com/blog/git-vs-svn-version-control-system/)  
[Mercurial vs. Git: How Are They Different?](https://www.perforce.com/blog/vcs/mercurial-vs-git-how-are-they-different)  
[version-control-systems-keep-your-code-in-order](https://webinerds.com/version-control-systems-keep-your-code-in-order/)  
[]()  
[]()  


---------------------------------------------------------------------------------------------------------------------



Github
Github于2008年上线，目前，除了Git代码仓库托管及基本的Web管理界面以外，还提供了订阅、讨论组、文本渲染、在线文件编辑器、协作图谱（报表）、代码片段分享（Gist）等功能。


Bitbucket
Bitbucket 是一家源代码托管网站，采用Mercurial和Git作为分布式版本控制系统，同时提供商业计划和免费账户。


Coding
Coding.net 为软件开发者提供基于云计算技术的软件开发平台，包括项目管理，代码托管，运行空间和质量控制等等。

GitLab
GitLab 提供丰富的 Git 代码管理功能，是目前主流的企业内部 Git 代码仓库解决方案。






