# Bitmap介绍


- [Redis Bitmaps简介](#Redis-Bitmaps简介)
- [批量字节操作主要有三个命令：BITOP，BITCOUNT，BITPOS](#批量字节操作主要有三个命令：BITOP，BITCOUNT，BITPOS)



## Redis Bitmaps简介
Bitmaps并不是实际的数据类型，而是定义在String类型上的一个面向字节操作的集合。因为字符串是二进制安全的块，他们的最大长度是512M，最适合设置成2^32个不同字节。

字节操作可以分为两类：恒定时间的单个字节操作如将一个字节设置为1或者0、或者获取一个字节的值，和批量字节操作如在给定的字节范围内计算设置字节的数量。

bitmaps 的最大优势之一在存储信息时极其节约空间。例如，在一个以增量用户ID来标识不同用户的系统中，记录用户的四十亿的一个单独bit信息（例如，要知道用户是否想要接收最新的来信）仅仅使用512M内存。


最大长度是512M，最多2^32个不同字节
SETBIT key offset value
GETBIT key offset
BITCOUNT key [start end] # The number of bits set to 1.


我们可以使用SETBIT命令设置字节，使用GETBIT命令检索字节：

>setbit key 10 1
(integer) 1
>getbit key 10
(integer) 1
>getbit key 11
(integer) 0
SETBIT命令原型为：

SETBIT key offset value
注：如果key不存，则创建key(赋于默认字符串)。key对应的字符串值的长度是可以增加的，以确保字符串可以在offset位置持有一个bit位，offset参数必须大于等于0，小于2^32。当offset值大于key对应字符串值长度时，字符串值长度增加，SETBIT返回值为0。

GETBIT命令原型为：

>GETBIT key offset
如果指定offset没有设置bit值，则通常返回0。




## 批量字节操作主要有三个命令：BITOP，BITCOUNT，BITPOS

批量字节操作主要有三个命令：BITOP，BITCOUNT，BITPOS，详细参看[redis官方命令介绍](https://redis.io/commands/bitop)


BITOP

BITOP operation destkey key [key ...]

对一个或多个保存二进制位的字符串 key 进行位元操作，并将结果保存到 destkey 上。

operation 可以是 AND 、 OR 、 NOT 、 XOR 这四种操作中的任意一种：

BITOP AND destkey key [key ...] ，对一个或多个 key 求逻辑并，并将结果保存到 destkey 。
BITOP OR destkey key [key ...] ，对一个或多个 key 求逻辑或，并将结果保存到 destkey 。
BITOP XOR destkey key [key ...] ，对一个或多个 key 求逻辑异或，并将结果保存到 destkey 。
BITOP NOT destkey key ，对给定 key 求逻辑非，并将结果保存到 destkey 。




BITCOUNT

BITCOUNT key [start] [end]

计算给定字符串中，被设置为 1 的比特位的数量。




BITPOS

BITPOS key bit [start] [end]
可用版本： >= 2.8.7
时间复杂度： O(N)，其中 N 为位图包含的二进制位数量
返回位图中第一个值为 bit 的二进制位的位置。

BITPOS bits 0   第一个为0的位置

BITPOS bits 1   第一个为1的位置




[redis的高级特性：bit位操作](https://www.toutiao.com/i6767642839267410445)

