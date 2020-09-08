SVN常用命令之checkout、export







---------------------------------------------------------------------------------------------------------------------

SVN常用命令之checkout、export

svn checkout (co) — 从版本库取出一个工作副本。


关于export命令
导出一个干净的不带.svn文件夹的目录树
一般默认下载最新的代码！

如果你想要下载指定版本的工程的话用：
svn export -r 2232 http://10.11.22.11/svn/project001




svn co svn://20.26.20.144/products/runtime-config-center/runtime-config-prodaz/config-aifgw-zjosb-cache/resources-sandun-static --username=yangzl --password=mypassword --no-auth-cache

svn export --force --username yangzl --password mypassword http://10.11.20.81/svn/AIOPENPLATFORM/aifgateway/aifgw-backend-parent/  aifgw-backend-parent





参考  
https://blog.csdn.net/gengxiaoming7/article/details/50512195  
http://svnbook.red-bean.com/zh/1.6/svn.ref.svn.c.checkout.html  

SVN官方命令参考地址：http://www.subversion.org.cn/svnbook/nightly/svn.ref.html  




---------------------------------------------------------------------------------------------------------------------









