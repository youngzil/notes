




---------------------------------------------------------------------------------------------------------------------

## 多因素认证（MFA) 及 谷歌身份验证器（Google Authenticator）实现原理

### 多因素认证MFA
多因素认证（Multi-factor authentication，缩写为 MFA）是一种安全系统，是为了验证一项交易的合理性而实行多种身份验证。MFA的目的是建立一个多层次的防御，使未经授权的人访问计算机系统或网络更加困难。

虚拟MFA 的英文是 Multi-Factor Authentication 的缩写，虚拟MFA是一种安全验证，虚拟MFA可以在用户名+密码登录方式额外再加一层安全验证。

Multi-Factor Authentication (MFA) 是一种简单有效的最佳安全实践方法，它能够在用户名和密码之外再额外增加一层安全保护。

Multi-Factor Authentication (MFA) 是一种非常简单的安全实践方法，它能够在用户名和密码之外再额外增加一层保护。启用MFA后，用户登录控制台时，系统将要求用户输入用户名和密码（第一安全要素），以及来自其MFA设备的验证码（第二安全要素）。这些多重要素结合起来将为您的账户和资源提供更高的安全保护。

MFA，Multi-FactorAuthentication，即多因子认证，是一种简单有效的安全认证方法。它可以在用户名和密码之外，再增加一层保护。


启用 MFA 后，用户登录阿里云网站时，系统将要求输入用户名和密码（第一安全要素），然后要求输入来自其 MFA 设备的动态验证码（第二安全要素），双因素的安全认证将为您的账户提供更高的安全保护



### 虚拟MFA设备
虚拟 MFA 设备是能产生 6 位数字认证码的应用程序，遵循基于时间的一次性密码 （TOTP）标准（RFC 6238）。此类应用程序可在移动硬件设备（包括智能手机）上运行。使用虚拟 MFA 应用非常方便，但您需要理解虚拟 MFA 应用程序所具有的安全水平与硬件 MFA 设备有所差异，因为虚拟 MFA 应用程序可以在安全性较差的设备上运行（例如智能手机）。

虚拟 MFA 设备是一个产生动态安全码的应用程序，它遵循基于时间的一次性密码（TOTP）标准（RFC 6238）。腾讯云的虚拟 MFA 设备由腾讯云助手小程序承载。

MFA 设备，又叫动态口令卡或 Token 卡，是提供这种安全认证方法的设备。目前腾讯云提供两种 MFA 设备：硬件 MFA 设备和虚拟 MFA 设备 。

MFA设备可以基于硬件也可以基于软件，目前阿里云官网支持基于软件的虚拟MFA。

虚拟MFA设备是能产生6位数字认证码的应用程序，遵循基于时间的一次性密码 （TOTP）标准。此类应用程序可在移动硬件设备（包括智能手机）上运行，非常方便。



### Google Authenticator的工作原理

HOTP和TOTP

Google的两步验证算法源自另一种名为HMAC-Based One-Time Password的算法，简称HOTP。

Time-based One-time Password（TOTP）也就容易理解了。TOTP将HOTP中的计数器C用当前时间T来替代，于是就得到了随着时间变化的一次性密码。





[多因素认证（MFA) 及 谷歌身份验证器（Google Authenticator）实现原理](https://www.itells.com/detail.html?uid=389d8b885ec04619bb226cd799f02f19)  
[什么是 MFA？](https://help.aliyun.com/document_detail/37215.html)  
[虚拟MFA](https://support.huaweicloud.com/usermanual-iam/iam_01_0031.html)  
[如何绑定虚拟MFA设备](https://support.huaweicloud.com/iam_faq/iam_01_0003.html)  
[MFA简介](https://cloud.tencent.com/document/product/378/37310)  
[启用虚拟 Multi-Factor Authentication (MFA) 设备（控制台）](https://docs.aws.amazon.com/zh_cn/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html)  
[获取IAM用户Token（使用密码+虚拟MFA）](https://github.com/huaweicloudDocs/iam/blob/master/cn.zh-cn/API%E5%8F%82%E8%80%83/%E8%8E%B7%E5%8F%96IAM%E7%94%A8%E6%88%B7Token%EF%BC%88%E4%BD%BF%E7%94%A8%E5%AF%86%E7%A0%81+%E8%99%9A%E6%8B%9FMFA%EF%BC%89.md)  



---------------------------------------------------------------------------------------------------------------------


