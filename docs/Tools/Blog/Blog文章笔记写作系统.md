# Blog文章笔记写作系统



## 可选方案

GitBook + GitBook/GitHub + GitBook/Travis/Github Actions + GitBook/Github Pages

在 master 上写 `md`，然后 push 到 master， Travis 自动执行 `gitbook build`，并且把生成好的文档 push 到 `gh-pages`，好让 pages 服务生效。



其他的开源Blog框架：Hexo、WordPress、VuePress、Hugo、Solo、Halo 、Jekyll



[打造完美写作系统：Gitbook+Github Pages+Github Actions](https://blog.csdn.net/qq_40889820/article/details/110013310)

[使用 travis + gitbook + github pages 优雅地发布自己的书](https://segmentfault.com/a/1190000018002602)

[七大开源blog框架介绍](https://blog.csdn.net/weixin_42365530/article/details/107840934)



## 文件格式

可选文件格式

- [AsciiDoc](../fileformat/AsciiDoc.md)
- [Markdown](../fileformat/markdown/Markdown.md)
- HTML
- Word



GitBook默认使用Markdown语法，从 `2.0.0` 版本起，GitBook也能支持AsciiDoc作为输入的格式了。




## 文档站点生成器

- [Gitbook](https://www.gitbook.com/)
- [VuePress](https://github.com/vuejs/vuepress)

- [docsify](https://docsify.js.org)



[docsify 入坑指南与我放弃 Gitbook 的那些理由](https://zhuanlan.zhihu.com/p/70219397)


[使用Gitbook创建的云原生的书籍可供参考](https://jimmysong.io/kubernetes-handbook/)




## CI工具

- GitBook

- Travis

- Github Actions
- [mdBook使用](https://www.jianshu.com/p/cdde301edb36)


可以使用Travis构建然后推送到gh-pages，也可以使用GitHub Action


[gitbook-action.yml示例](https://github.com/ZanderZhao/gitbook-action/blob/master/.github/workflows/gitbook-action.yml)




## 一文多发平台

ArtiPub (Article Publisher 的简称，意为 "文章发布者") 是一款开源的一文多发平台

[ArtiPub一文多发平台](https://github.com/crawlab-team/artipub)





