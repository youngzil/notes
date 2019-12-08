Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas 

https://github.com/alibaba/arthas

https://alibaba.github.io/arthas/
https://github.com/alibaba/arthas/blob/master/README_CN.md


使用as.sh脚本需要安装telnet


arthas要先attach之后，才会暴露端口。 在ali内部是有专门的工具可以到机器上执行脚本，然后attach jvm的。我觉得你们可以在运维上考虑一下类似的支持。
比如用 ansible自动化登陆，列出java进程，再让用户选择attach。 web界面调用ansible。
docker映射的端口要先预留好。


给你下个must done的任务，把arthas集成到 aigw-backend运行态，bin下面可以执行起来监控aigw-backend的运行时动态

