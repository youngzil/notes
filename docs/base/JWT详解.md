
---------------------------------------------------------------------------------------------------------------------

### JWT规范

Oauth2.0返回验证令牌使用了JWT格式：JSON Web Token（缩写 JWT）是目前最流行的跨域认证解决方案，JWT 的原理是，服务器认证以后，生成一个 JSON 对象，发回给用户。

JWT，JSON Web Token，作为一个开放的标准，通过紧凑（compact，快速传输，体积小）或者自包含（self-contained，payload中将包含用户所需的所有的信息，避免了对数据库的多次查询）的方式，定义了用于在各方之间发送的安全JSON对象。



### JWT的组成

JWT由三个部分组成，分别是：
- Header（头部）
- Claims（载荷Payload）
- Signature（签名）

它由三部分组成，每部分通过 .分隔开，分别是：
1、Header头部
2、Payload有效负荷
3、Signature签名




### JWT格式

完整JWT = 载荷.头部.签名

把 Header、Payload、Signature 三个部分用"点"（.）分割拼成一个字符串，就是最后的结果。

eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiY2FuZyB3dSIsImV4cCI6MTUxODA1MTE1NywidXNlcklkIjoiMTIzNDU2In0.IV4XZ0y0nMpmMX9orv0gqsEMOxXXNQOE680CKkkPQcs




### 生成流程

完整的头部就像下面这样的JSON：
{
'typ': 'JWT',
'alg': 'HS256'
}

然后将头部进行base64加密（该加密是可以对称解密的),构成了第一部分.
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9


定义一个payload:
{
"sub": "1234567890",
"name": "John Doe",
"admin": true
}

然后将其进行base64加密，得到Jwt的第二部分。
eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9


signature

jwt的第三部分是一个签证信息，这个签证信息由三部分组成：
- header (base64后的)
- payload (base64后的)
- secret

这个部分需要base64加密后的header和base64加密后的payload使用.连接组成的字符串，然后通过header中声明的加密方式进行加盐secret组合加密，然后就构成了jwt的第三部分。
// javascript
var encodedString = base64UrlEncode(header) + '.' + base64UrlEncode(payload);
var signature = HMACSHA256(encodedString, 'secret'); // TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ

将这三部分用.连接成一个完整的字符串,构成了最终的jwt:
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9.TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ

注意：secret是保存在服务器端的，jwt的签发生成也是在服务器端的，secret就是用来进行jwt的签发和jwt的验证，所以，它就是你服务端的私钥，在任何场景都不应该流露出去。一旦客户端得知这个secret, 那就意味着客户端是可以自我签发jwt了。







五、JWT 的几个特点

（1）JWT 默认是不加密，但也是可以加密的。生成原始 Token 以后，可以用密钥再加密一次。

（2）JWT 不加密的情况下，不能将秘密数据写入 JWT。

（3）JWT 不仅可以用于认证，也可以用于交换信息。有效使用 JWT，可以降低服务器查询数据库的次数。

（4）JWT 的最大缺点是，由于服务器不保存 session 状态，因此无法在使用过程中废止某个 token，或者更改 token 的权限。也就是说，一旦 JWT 签发了，在到期之前就会始终有效，除非服务器部署额外的逻辑。

（5）JWT 本身包含了认证信息，一旦泄露，任何人都可以获得该令牌的所有权限。为了减少盗用，JWT 的有效期应该设置得比较短。对于一些比较重要的权限，使用时应该再次对用户进行认证。

（6）为了减少盗用，JWT 不应该使用 HTTP 协议明码传输，要使用 HTTPS 协议传输。



[什么是 JWT -- JSON WEB TOKEN](https://www.jianshu.com/p/576dbf44b2ae)  
[JSON Web Token 入门教程](http://www.ruanyifeng.com/blog/2018/07/json_web_token-tutorial.html)  
[五分钟带你了解啥是JWT](https://zhuanlan.zhihu.com/p/86937325)  
[10分钟了解JSON Web令牌（JWT）](https://baijiahao.baidu.com/s?id=1608021814182894637&wfr=spider&for=pc)  



