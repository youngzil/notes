- [BT和PT](#BT和PT)
- [BitTorrent协议](#BitTorrent协议)
- [BitTorrent软件和BitTorrent公司](#BitTorrent软件和BitTorrent公司)
- [BitTorrent客户端](#BitTorrent客户端)
- [BT名词和原则](#BT名词和原则)
- [](#)



P2P的精神就是我为人人，人人为我。


名词：
BT下载、BT论坛、BT协议、BT软件、Torrent种子、
- Tracker：收集下载者信息的服务器，并将此信息提供给其他下载者，使下载者们相互连接起来，传输数据。
- 种子：指一个下载任务中所有文件都被某下载者完整的下载，此时下载者成为一个种子。发布者本身发布的文件就是原始种子。
- 做种：发布者提供下载任务的全部内容的行为；下载者下载完成后继续提供给他人下载的行为。
- 死种：
- 吸血驴：也称吸血骡。是指在eMule/eDonkey等一些P2P网络软件中通过其他用户下载完毕资源后而不再上传或只上传非常少的资源的用户。




---------------------------------------------------------------------------------------------------------------------

### BT和PT

迅雷属于著名的leech（只下载不上传）

迅雷有自己的资源服务器
BT靠自觉
PT靠考核


BitTorrent协议（简称BT，俗称比特洪流、BT下载）是用在对等网络中文件分享的网络协议程序。
和点对点（point-to-point）的协议程序不同，它是用户群对用户群（peer-to-peer），而且用户越多，下载同一文件的人越多，下载该文件的速度越快。且下载后，继续维持上传的状态，就可以“分享”，成为其用户端节点下载的种子文件（.torrent），同时上传及下载。

PT（英语：Private Tracker）是一种改良自BitTorrent协议的P2P下载方式，“Private Tracker”指私有种子服务器。与BT最大的不同点为：可进行私密范围下载，并且记录每一个用户的详细数据。


P2P可以指：
- 对等网络（peer-to-peer），一种网络技术和网络拓扑结构。文件分享，常利用点对点技术。
- 点对点协议（Point-to-Point Protocol），拨号上网计算，通常缩写PPP。
- 网络借贷（Peer-to-Peer Lending），又称P2P借贷，在中国大陆也被称为网络借贷、P2P理财。
- 收费服务模式（pay to play）。


BitTorrent可以指：
- BitTorrent (协议)，一个流行的P2P网络协议。
- BitTorrent (软件)，第一款基于BitTorrent协议的P2P文件分享客户端软件。
- BitTorrent (公司)，一家美国商业公司，软件BitTorrent的母公司，其致力于开发基于BitTorrent协议技术。
- BitTorrent客户端，指所有利用BitTorrent协议进行文件传输的客户端软件。




### BitTorrent协议

BitTorrent协议（简称BT，俗称比特洪流、BT下载）是用在对等网络中文件分享的网络协议程序。
和点对点（point-to-point）的协议程序不同，它是用户群对用户群（peer-to-peer），而且用户越多，下载同一文件的人越多，下载该文件的速度越快。且下载后，继续维持上传的状态，就可以“分享”，成为其用户端节点下载的种子文件（.torrent），同时上传及下载。


- Tracker：收集下载者信息的服务器，并将此信息提供给其他下载者，使下载者们相互连接起来，传输数据。
- 种子：指一个下载任务中所有文件都被某下载者完整的下载，此时下载者成为一个种子。发布者本身发布的文件就是原始种子。
- 做种：发布者提供下载任务的全部内容的行为；下载者下载完成后继续提供给他人下载的行为。




### BitTorrent软件和BitTorrent公司

BitTorrent是由布莱姆·科亨与BitTorrent公司开发，是全球第一套基于BitTorrent协议的点对点文件上载/下载软件（也就是BitTorrent客户端），由于源自官方而被昵称为“主流”（Mainline）。




### BitTorrent客户端

BitTorrent客户端，有时也可称BT客户端、BitTorrent软件、BT软件等，指所有利用BitTorrent协议进行文件传输的客户端软件。

BitTorrent是一款布莱姆·科亨与BitTorrent开发的点对点 计算机程序。它被用来通过BitTorrent协议上传和下载文件。BitTorrent的首个客户端就是为该协议编写。开发者常将其称为Mainline，表示这是官方的主线版本。从6.0版本开始，BitTorrent客户端已经是µTorrent的一个更名版本。因此而言，它不再是开源软件并且可用于Microsoft Windows和Mac OS X。

µTorrent（或称uTorrent；常被缩写为"µT"或"uT"）是一款免费、 闭源的BitTorrent客户端，由BitTorrent公司所有。它是在除中国以外使用最广泛的BitTorrent客户端。



常用P2P软件：
uTorrent／qBittorrent／BitComet(比特彗星)


[BitTorrent网站](https://www.bittorrent.com/)  
[µTorrent网站](https://www.utorrent.com/)  
[qBittorrent网站](https://www.qbittorrent.org/)  






### BT名词和原则

简单科普一下

当很多主机（host）想要从一个服务器（server）获得同一个大文件（视频等），这个时候用到P2P。每一个peer在收到一部分数据(chunk)的时候都会同时地分享给别人，所以就很快，这个你应该知道。

这些参与下载的host我们又称作peer。每个peer向别的Peer下载一个固定的等大小的chunk(256KB)。这些chunk就是想要下载的文件的一部分。所以逐步每个peer会有很多chunk积累起来，大家下载地也就越来越快。

每一个资源都有一个tracker，可以理解为服务器, 用来记录了所有参与这个资源下载的peer的IP地址，新加入的成员会获得一部分peer，称作他的邻居。

种子文件(Torrent）就是tracker信息和文件的集合体！

那么每一个peer如何知道他下一个应该索取哪一个chunk?又应该向谁索取新的chunk?给谁提供chunk? 这可不是随机乱来的。




两个原则：
1、rarest first, 在这个peer周围的邻居中最稀少的chunk就是他索取的chunk
2、trading algorithm,谁给自己提供的chunk最快就把自己有的chunk发送给谁

遵循这个原则，如果自己的上传速度太慢（或者你限制了上传速度），也就是没办法给别人很快的提供chunk, 那么自己就很容易也收不到别人的chunk，这个时候我们称之为choke，也就是你卡死了，所以p2p的精神就是我为人人，人人为我。



可能有些人只下载，不上传，或者自己不做种
目前没法解决，所以才会有所谓死种、吸血驴的说法。
吸血驴，又称吸血骡，通常指在连接eDonkey网络的文件共享客户端软件之中，只下载资源数据不上传或上传下载比例很小的，或者有其他不良行为的软件。
吸血驴被认为违背了网络资源共享道德与精神，也损害了P2P网络的秩序与其他P2P用户的利益（详见：后果）。但至今依然有一定数量的用户。

诸如盗版电影之类的基本只能靠自觉，部分公司通过BT做软件/游戏的分发，此时他们的目的仅仅是减少带宽投入，那么能省一点是一点，省不了就老老实实用自己的服务器分发，所以这种时候一般这类公司会保证自己的服务器一直在线做种。

稍微好一点的办法就是所谓的PT，即配合类似于论坛积分的形式鼓励做种和上传。
但是PT实质上是引入了一定的中心化机制，算是一种折中。

理论上可以通过类似于比特币的形式完成完全去中心化、鼓励上传的网络，但是实际开发起来会有很多问题，且并不具有迫切性。





参考
https://zh.wikipedia.org/wiki/%E5%90%B8%E8%A1%80%E9%A9%B4
https://zh.wikipedia.org/wiki/BitTorrent_(%E5%8D%8F%E8%AE%AE)
https://zh.wikipedia.org/wiki/PT%E4%B8%8B%E8%BC%89

---------------------------------------------------------------------------------------------------------------------




