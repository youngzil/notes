https://github.com/curl/curl
https://curl.haxx.se/


cURL是一个利用URL语法在命令行下工作的文件传输工具，1997年首次发行。它支持文件上传和下载，所以是综合传输工具，但按传统，习惯称cURL为下载工具。cURL还包含了用于程序开发的libcurl。

cURL支持的通信协议有FTP、FTPS、HTTP、HTTPS、TFTP、SFTP、Gopher、SCP、Telnet、DICT、FILE、LDAP、LDAPS、IMAP、POP3、SMTP和RTSP。

curl还支持SSL认证、HTTP POST、HTTP PUT、FTP上传, HTTP form based upload、proxies、HTTP/2、cookies、用户名+密码认证(Basic, Plain, Digest, CRAM-MD5, NTLM, Negotiate and Kerberos)、file transfer resume、proxy tunneling。


curl命令是一个利用URL规则在命令行下工作的文件传输工具。它支持文件的上传和下载。curl支持包括HTTP、HTTPS、ftp等众多协议，还支持POST、cookies、认证、从指定偏移处下载部分文件、用户代理字符串、限速、文件大小、进度条等特征。


curl是一种命令行工具，作用是发出网络请求，然后得到和提取数据，显示在"标准输出"（stdout）上面。

如果要把这个网页保存下来，可以使用`-o`参数，这就相当于使用wget命令了。
　　$ curl -o [文件名] www.sina.com


二、自动跳转
有的网址是自动跳转的。使用`-L`参数，curl就会跳转到新的网址。
　　$ curl -L www.sina.com
键入上面的命令，结果就自动跳转为www.sina.com.cn。


三、显示头信息
`-i`参数可以显示http response的头信息，连同网页代码一起。
　　$ curl -i www.sina.com
`-I`参数则是只显示http response的头信息。


四、显示通信过程
`-v`参数可以显示一次http通信的整个过程，包括端口连接和http request头信息。
　　$ curl -v www.sina.com

如果你觉得上面的信息还不够，那么下面的命令可以查看更详细的通信过程。
　　$ curl --trace output.txt www.sina.com
或者
　　$ curl --trace-ascii output.txt www.sina.com
运行后，请打开output.txt文件查看。


五、发送表单信息
发送表单信息有GET和POST两种方法。GET方法相对简单，只要把数据附在网址后面就行。
　　$ curl example.com/form.cgi?data=xxx
POST方法必须把数据和网址分开，curl就要用到--data参数。
　　$ curl -X POST --data "data=xxx" example.com/form.cgi
如果你的数据没有经过表单编码，还可以让curl为你编码，参数是`--data-urlencode`。
　　$ curl -X POST--data-urlencode "date=April 1" example.com/form.cgi


六、HTTP动词
curl默认的HTTP动词是GET，使用`-X`参数可以支持其他动词。
　　$ curl -X POST www.example.com
　　$ curl -X DELETE www.example.com



七、文件上传
假定文件上传的表单是下面这样：
　　<form method="POST" enctype='multipart/form-data' action="upload.cgi">
　　　　<input type=file name=upload>
　　　　<input type=submit name=press value="OK">
　　</form>
你可以用curl这样上传文件：
　　$ curl --form upload=@localfilename --form press=OK [URL]


八、Referer字段
有时你需要在http request头信息中，提供一个referer字段，表示你是从哪里跳转过来的。
　　$ curl --referer http://www.example.com http://www.example.com


九、User Agent字段
这个字段是用来表示客户端的设备信息。服务器有时会根据这个字段，针对不同设备，返回不同格式的网页，比如手机版和桌面版。
iPhone4的User Agent是
　　Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7

curl可以这样模拟：
　　$ curl --user-agent "[User Agent]" [URL]



十、cookie
使用`--cookie`参数，可以让curl发送cookie。
　　$ curl --cookie "name=xxx" www.example.com
至于具体的cookie的值，可以从http response头信息的`Set-Cookie`字段中得到。
`-c cookie-file`可以保存服务器返回的cookie到文件，`-b cookie-file`可以使用这个文件作为cookie信息，进行后续的请求。
　　$ curl -c cookies http://example.com
　　$ curl -b cookies http://example.com


十一、增加头信息
有时需要在http request之中，自行增加一个头信息。`--header`参数就可以起到这个作用。
　　$ curl --header "Content-Type:application/json" http://example.com


十二、HTTP认证
有些网域需要HTTP认证，这时curl需要用到`--user`参数。
　　$ curl --user name:password example.com


【参考资料】
http://www.ruanyifeng.com/blog/2011/09/curl.html


在进行web后台程序开发测试过程中，常常会需要发送url进行测试，使用curl可以方便地模拟出符合需求的url命令

假设目标url 为：127.0.0.1:8080/login

使用curl发送GET请求：curl protocol://address:port/url?args
curl http://127.0.0.1:8080/login?admin&passwd=12345678  

使用curl发送POST请求：curl -d "args" protocol://address:port/url
curl -d "user=admin&passwd=12345678" http://127.0.0.1:8080/login  

这种方法是参数直接在header里面的，如需将输出指定到文件可以通过重定向进行操作.
curl -H "Content-Type:application/json" -X POST -d 'json data' URL
curl -H "Content-Type:application/json" -X POST -d '{"user": "admin", "passwd":"12345678"}' http://127.0.0.1:8000/login  


如
1、curl --header "Content-Type: application/json" --request POST --data '{"appId":"appId"}' 'http://188.102.2.69:28180/admin?action=keypath_set'

3、curl --header "Content-Type: application/json" --request POST --data '[{"code":"A1","policy":"weight_polling","nodes":[{"host":"188.102.2.69","port":8091,"weight":2, "max_fails":2,"fail_timeout":1000},{"host":"188.102.2.70","port":8091,"weight":2, "max_fails":2,"fail_timeout":1000}]}]' 'http://188.102.2.69:28180/admin?action=slbupstream_set'

4、curl -i -H -H -X POST -d URL
curl -i -H "serialize-type: json" -H "csf_version: 1.0" -X POST 'http://10.70.137.94:30380/csf/hallCommon_IBusinessCSV_flowOrdScheduleSave?uuid=123456' -d '{"businessId":"500000020001","billId":"23456789"}'

