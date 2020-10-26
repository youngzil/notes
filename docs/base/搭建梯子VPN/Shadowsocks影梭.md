- [shadowsocks官网地址](#shadowsocks官网地址)
- [VPS搭建Shadowsocks（ss）教程](#VPS搭建Shadowsocks)

---------------------------------------------------------------------------------------------------------------------
## shadowsocks官网地址  

[shadowsocks官网](https://shadowsocks.org/en/index.html)  
[shadowsocks Github](https://github.com/shadowsocks)  


客户端下载链接（GitHub）：  
[Mac客户端](https://github.com/shadowsocks/ShadowsocksX-NG)  
[Win客户端](https://github.com/shadowsocks/shadowsocks-windows)  
[Android客户端](https://github.com/shadowsocks/shadowsocks-android)  

---------------------------------------------------------------------------------------------------------------------
## VPS搭建Shadowsocks


VPS搭建Shadowsocks（ss）教程


科学上网：Vultr VPS 搭建 Shadowsocks（ss）教程（新手向）

搭建shadowsocks连接上之后，就可以开始搭建了。

1.安装锐速 / 谷歌 BBR 加速优化

1.2、谷歌 BBR

推荐装这个，执行下面命令安装谷歌BBR：

wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh
显示 “Press any key to start…” 按回车确认。回车后会出现一列内核版本让我们选择，输入序号 61 并回车开始安装。

然后开始选择内核版本
安装完后，按提示重启 VPS，输入 Y 回车重启。稍候 1min 等待重启完成，再重新连接 Xshell。

重启后输入 lsmod | grep bbr ，出现 tcp_bbr 即说明 BBR 已经启动。




2.安装SS
依次运行下面三行命令，如下图所示按要求输入相应信息。（建议：端口选择大于 1000 的。）

下载脚本：
wget — no-check-certificate -O shadowsocks.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks.sh

更改权限：
chmod +x shadowsocks.sh

运行脚本，开始安装：
./shadowsocks.sh 2>&1 | tee shadowsocks.log


安装完成，把标红的连接信息记录下来，就可以关闭 xshell 了。（出现这几行就说明安装成功）
服务端搭建完成！(*^▽^*)




3.多用户配置
强烈不建议小白操作此步！自己用的话不需要配置这一步，因为不熟悉操作的话，很容易在这一步出问题，大概率失败！

如果想和一两个亲友一起用的话，可以继续本步。先说注意事项：
输入法切英文
核对正确在保存不要漏
配置好后重启shadowsocks才会生效


首先，我们把配置信息准备好（# 开头的是注释，不要复制进去），把下面的代码复制到记事本中，按要求把 "port_password"{……} 中的端口和密码改为自己需要的。

```
# 1.先设置好端口和对应的密码
# 2.添加或删除的用户都在 "port_password"{……} 中
# 3.用户信息格式，注意末尾的英文逗号："端口"："密码",  如 "8006": "123456",
# 4."method" 为加密方式，可修改，默认也可以，客户端的加密方式也是这个
```

{
    "server":"0.0.0.0",
    "local_address":"127.0.0.1",
    "local_port":1080,
    "port_password":{
         "8989":"password0",
         "9001":"password1",
         "9002":"password2",
         "9003":"password3",
         "9004":"password4"
    },
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}

然后，在 /etc 下新建 shadowsocks.json 配置文件：

# 创建配置文件
vi /etc/shadowsocks.json

出现一列波浪线即进入 vim。
注意，敲黑板了！！！下面的操作很重要：
按 a ，然后把刚才准备好的 “配置信息” 粘贴进去，检查无误；
再按 Esc，输入 :wq 保存退出。
比如下面这个配置，设置了 3 个用户，分别使用 8000,8001,8002 端口，后面是对应的密码。


重启 shadowsocks 生效：
/etc/init.d/shadowsocks restart
多用户配置完成！




4.其他命令

卸载：
./shadowsocks.sh uninstall

控制：
/etc/init.d/shadowsocks start      # 启动
/etc/init.d/shadowsocks stop       # 停止
/etc/init.d/shadowsocks restart    # 重启
/etc/init.d/shadowsocks status     # 状态




四、使用
下面只要下载客户端连接就行了。包含 win、mac 和 安卓客户端。（IOS 需要在商店中安装）

客户端下载链接（GitHub）：  
[Mac客户端](https://github.com/shadowsocks/ShadowsocksX-NG)  
[Win客户端](https://github.com/shadowsocks/shadowsocks-windows)  
[Android客户端](https://github.com/shadowsocks/shadowsocks-android)  





参考[Vultr VPS 搭建 Shadowsocks（ss）教程（新手向）](https://medium.com/@jackme256/%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91-vultr-vps-%E6%90%AD%E5%BB%BA-shadowsocks-ss-%E6%95%99%E7%A8%8B-%E6%96%B0%E6%89%8B%E5%90%91-968613081aae)  

---------------------------------------------------------------------------------------------------------------------
