# Gitbook

## Gitbook介绍

[Gitbook官网](https://www.gitbook.com/)

[Gitbook文档](https://docs.gitbook.com/)

[Gitbook Github地址](https://github.com/GitbookIO/gitbook)

[Gitbook CLI](https://github.com/GitbookIO/gitbook-cli)

[Gitbook插件](https://github.com/GitbookIO/plugin)

[GitBook文档（中文版）](https://chrisniael.gitbooks.io/gitbook-documentation/content/index.html)

[Setup and Installation of GitBook](https://github.com/GitbookIO/gitbook/blob/master/docs/setup.md)



## Gitbook使用


- 安装 GitBook：npm i gitbook-cli -g
- 初始化 GitBook 项目：gitbook init
- 安装 GitBook 依赖：gitbook install
- 打包 GitBook 项目：gitbook build
- 开启 GitBook 服务：gitbook serve
- GitBook 命令行查看：gitbook -help
- GitBook 版本查看：gitbook -V


我们在 终端 输入 gitbook serve 即可开启一个 localhost:4000 的服务，请在浏览器中输入 http://localhost:4000 即可访问服务。


生成电子书
```shell
GitBook 可以生成一个网站，但也可以输出内容作为电子书（ePub，Mobi，PDF）。

# Generate a PDF file
$ gitbook pdf ./ ./mybook.pdf

# Generate an ePub file
$ gitbook epub ./ ./mybook.epub

# Generate a Mobi file
$ gitbook mobi ./ ./mybook.mobi

```




## Gitbook配置

**book.json配置**

基本信息、links、plugins、pluginsConfig等



[book.json示例1](https://github.com/zhangjikai/gitbook-use/blob/master/book.json)

[book.json示例2](https://github.com/wiliam2015/gitbook-use/blob/master/book.json)



[GitBook相关配置及优化](https://segmentfault.com/a/1190000019664545)

[使用 Gitbook 打造你的电子书](https://zhuanlan.zhihu.com/p/34946169)

[gitbook使用教程](https://segmentfault.com/a/1190000017960359)  
[使用Git进行控制，并把项目托管到 GitBook.com（二）](https://blog.csdn.net/lydms/article/details/103067922)  
[GitBook 简明教程](https://www.chengweiyang.cn/gitbook/index.html)  

[gitbook简单使用](https://segmentfault.com/a/1190000021578701)

[GitBook插件整理](https://www.jianshu.com/p/427b8bb066e6)

[gitbook使用及book.json详细配置](https://segmentfault.com/a/1190000023323882)

[电子书制作利器：GitBook](https://book.crifan.com/books/ebook_system_gitbook/website/gitbook_intro/)

[GitBook - 快速打造可留言的博客](https://juejin.cn/post/6844903848914452488#heading-5)

[GitBook应用](https://zhilidali.github.io/gitbook/)

[Gitbook教程（小白入坑gitbook全过程）](https://www.jianshu.com/p/0388d8bb49a7)



book.json部分配置参考

```json
{
  "title": "Kubernetes",
  "description": "Kubernetes ",
  "language": "zh-hans",
  "author": "Jimmy",
  "plugins": [
    "page-toc-button",
    "back-to-top-button",
    "image-captions",
    "-lunr",
    "-search",
    "search-plus",
    "-highlight",
    "prism",
    "prism-themes",
    "sitemap-general"
  ],
  "pluginsConfig": {
    "image-captions": {
      "caption": "图 _PAGE_LEVEL_._PAGE_IMAGE_NUMBER_：_CAPTION_"
    },
    "prism": {
      "css": [
        "prism-themes/themes/prism-ghcolors.css"
      ]
    },
    "sitemap-general": {
      "prefix": "https://jimmysong.io/kubernetes-handbook/"
    }
  }
}
```



## Gitbook插件

可以在 [plugins.gitbook.com](https://szdastone.github.io/posts/2019/01/plugins.gitbook.com) 查找或者在 [NPM](https://www.npmjs.com/) 或者 [Github](https://github.com/GitbookIO/gitbook) 上找插件。

Gitbook 的插件在 NPM 上都是以 gitbook-plugin 开头的，很容易查找的。



[Gitbook插件官方Github](https://github.com/GitbookIO/plugin)

[Gitbook插件官方文档](https://docs.gitbook.com/resources/gitbook-legacy/v2-differences#plugins)

[gitbook 入门教程之小白都能看懂的 Gitbook 插件开发全流程](https://cloud.tencent.com/developer/article/1517301)



[GitBook v3.2.3 使用教程](https://www.bookstack.cn/read/gitbook-use-3.2.3/plugins.md)

[gitbook 入门教程之实用插件(新增3个插件)](https://juejin.cn/post/6844903813875236872)

[GitBook 插件](http://gitbook.zhangjikai.com/plugins.html)

[gitbook常用的插件](https://segmentfault.com/a/1190000019806829)

[GitBook插件整理 - book.json配置](https://www.cnblogs.com/mingyue5826/p/10307051.html)

[Gitbook详解（五）-插件的配置和使用详解](https://www.cnblogs.com/jiangming-blogs/p/14643147.html)

[GitBook 和它有趣的插件](http://jartto.wang/2020/02/02/about-gitbook/)

[gitbook 插件项目](https://snowdreams1006.github.io/opensource/gitbook/)

[Gitbook插件篇](https://lizh.gitbook.io/knowledge/frontend/gitbook/00gitbook-cha-jian-pian#donate-da-shang-cha-jian)

[推荐12个实用的gitbook插件](https://juejin.cn/post/6844903865146441741)

[Gitbook插件推荐](https://github.com/swapagarwal/awesome-gitbook-plugins)

[Gitbook 插件和主题](https://szdastone.github.io/posts/2019/01/4dd0f083.html)



