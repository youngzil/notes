要通过网络传输数据或其持久存储，您需要序列化数据。在Java 和 Hadoop 提供的序列化 API之前，我们有一个特殊的实用程序，称为Avro，这是一种基于模式的序列化技术。


Apache Avro 是一种语言中立的数据序列化系统。它是由 Hadoop 之父 Doug Cut 开发的。由于 Hadoop 可写类缺乏语言可移植性，Avro 变得非常有用，因为它处理可以由多种语言处理的数据格式。Avro 是在 Hadoop 中序列化数据的首选工具。

Avro 有一个基于模式的系统。独立于语言的模式与其读写操作相关联。Avro 序列化具有内置架构的数据。Avro 将数据序列化为紧凑的二进制格式，可以被任何应用程序反序列化。

Avro 使用 JSON 格式来声明数据结构。目前，它支持 Java、C、C++、C#、Python 和 Ruby 等语言。
