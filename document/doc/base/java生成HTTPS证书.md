<Connector port="20200" protocol="org.apache.coyote.http11.Http11Protocol"
      maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
      clientAuth="false" sslProtocol="TLS"
      keystoreFile="ssl/server.keystore" keystorePass="123456"/>
      

curl -i 'https://localhost:20200'

curl -i 'https://20.26.37.177:20200'


1、生成证书
keytool -genkey -dname "CN=localhost, OU=localhost, O=localhost, L=NJ, ST=JS, C=CN" -alias tomcat -keyalg RSA -keysize 1024 -keystore server.keystore -validity 36500 -storepass 123456 -keypass 123456

创建别名为tomcat的一条证书，它指定用 RSA 算法生成，且指定密钥长度为 1024，证书有效期为 100 年（注意：如果部署tomcat ssl的话，密钥库的keypass和storepass密码得相同，否则报java.io.IOException: Cannot recover key）

生成密钥库的参数说明：
	CN(Common Name名字与姓氏)
	OU(Organization Unit组织单位名称)
	O(Organization组织名称)
	L(Locality城市或区域名称)
	ST(State州或省份名称)
	C(Country国家名称)

生成密钥库(同一个库中可以包含多个不同alias的证书)


查看证书详情
keytool -list -v -keystore server.keystore -storepass 123456
查看密钥库中某个alias证书的详细
keytool -list -v -alias tomcat -keystore d:/keystore/test.keystore -storepass 123456

查看密钥库中的证书
keytool -list -keystore d:/keystore/test.keystore -storepass 654321


修改证书条目口令
Keytool -keypasswd -alias MYCA -keypass oldpasswd -new newpasswd -storepass storepasswd -keystore d:/keystore/test.keystore

 
删除密钥库中的证书
keytool -delete -alias MYCA -keystore d:/keystore/test.keystore -storepass 654321


从密钥库中导出证书
keytool -export -alias tomcat -storepass 123456 -file server.cer -keystore server.keystore
keytool -export -alias MYCA -file d:/keystore/MYCA.cer -keystore d:/keystore/test.keystore -storepass 654321


keytool -import -alias client-v -file client.cer -keystore tomcat.keystore

 
通过命令: keytool -printcert -file D:/keystore/MYCA.cer 可以查看证书文件的信息。 也可以在 Windows 资源管理器中双击产生的证书文件直接查看。





漏洞修复
1、SSL/TLS 服务器瞬时 Diffie-Hellman 公共密钥过弱【原理扫描】
<Connector port="20200" protocol="org.apache.coyote.http11.Http11NioProtocol"
      maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
      clientAuth="false" sslProtocol="TLS"
      keystoreFile="ssl/server.keystore" keystorePass="123456" 
      sslEnabledProtocols = "TLSv1,TLSv1.1,TLSv1.2" 
      ciphers="TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_DSS_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_128_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_SHA256,TLS_ECDHE_RSA_WITH_AES_128_SHA,TLS_ECDHE_ECDSA_WITH_AES_128_SHA,TLS_ECDHE_RSA_WITH_AES_256_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_SHA384,TLS_ECDHE_RSA_WITH_AES_256_SHA,TLS_ECDHE_ECDSA_WITH_AES_256_SHA,TLS_DHE_RSA_WITH_AES_128_SHA256,TLS_DHE_RSA_WITH_AES_128_SHA,TLS_DHE_DSS_WITH_AES_128_SHA256,TLS_DHE_RSA_WITH_AES_256_SHA256,TLS_DHE_DSS_WITH_AES_256_SHA,TLS_DHE_RSA_WITH_AES_256_SHA"
      />


2、服务器支持 TLS Client-initiated 重协商攻击(CVE-2011-1473)【原理扫描】，"使用SSL开启重协商的服务都会受该漏洞影响
参考
https://weakdh.org/sysadmin.html

Tomcat解决办法：
 使用NIO connector代替BIO connector，因为NIO不支持重协商，参考如下配置：
<Connector protocol="org.apache.coyote.http11.Http11NioProtocol">






