
[iTerm2官网](https://iterm2.com/)  





iTerm2改变字体颜色
Preference －> Profiles -> Colors -> Foreground 里改 00c200(绿色Green)

iTerm2改变字体大小
Preference －> Profiles -> Text -> Font 里改 14


[iTerm2快速SSH连接并保存密码](https://juejin.cn/post/6844903842660745224)  
[iterm2保存ssh连接信息](https://www.dyxmq.cn/other/save-ssh-profile-in-iterm2.html)  



点击左下角的+新增一个配置项，在右边的command处输入ssh登录的命令：
ssh root@x.x.x.x -p xxxxx

然后把tab页面切换到Advanced，点击Edit进入触发器编辑页面：
在Triggers中点击Edit进入触发器编辑页面：
新弹框中新增一个触发器，触发器的作用是匹配终端输出的字符串然后执行相应动作。触发字符串是password:，Action选择Send Text，Parameters填入登录密码，密码最后以\n结束表示输完密码后换行：

或者
在Smart Selection中点击Edit进入触发器编辑页面：
ssh password password Very Low
然后选中新增的ssh password 这一行，点击Edit Actions新增
触发字符串是password:，Action选择Send Text，Parameters填入登录密码，密码，密码不需要\n结束

