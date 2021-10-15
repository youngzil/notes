# Pandoc


## Pandoc介绍

Pandoc是使用Haskell语言编写的一款跨平台、自由开源及命令行界面的标记语言转换工具，可实现不同标记语言间的格式转换，堪称该领域中的“瑞士军刀”[3]。

[Pandoc官网](https://pandoc.org/)  
[Pandoc Github](https://github.com/jgm/pandoc)  

[Pandoc文档](https://github.com/jgm/pandoc/wiki/Pandoc-Extras)  
[Pandoc’s Markdown 語法中文翻譯](http://pages.tzengyuxio.me/pandoc/)  




## Pandoc的使用

Pandoc的基本指令格式是：

```
pandoc [options] [input-file] ...
```

简单的格式转换指令：

```
pandoc -o output.html input.md
```

其中-o ouput.html表示输出文件为output.html，input.md是输入文件。

Pandoc会根据文件的后缀名自动判断格式，用户也可以显式地指定输入文件和输出文件格式：

```
pandoc -f markdown -t html -o output.html input.md
```

其中-f markdown表示输入文件格式为Markdown，-t html表示输出文件格式为HTML。  
 --from and --to




[Pandoc wiki](https://zh.wikipedia.org/wiki/Pandoc)  
[Pandoc vs Multimarkdown](https://github.com/jgm/pandoc/wiki/Pandoc-vs-Multimarkdown)  
[]()  

