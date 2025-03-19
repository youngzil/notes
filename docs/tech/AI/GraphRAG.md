
一般而言，RAG 使用向量相似性作为搜索，称之为 Baseline RAG（基准RAG）。但 Baseline RAG 在某些情况下表现并不完美。

GraphRAG = 知识图谱 + RAG

我相信 GraphRAG 将取代仅向量 RAG，成为大多数用例的默认 RAG 架构。

典型 RAG 的核心是向量搜索，也就是根据输入的文本块从候选的书面材料中找到并返回概念相似的文本。这种自动化很好用，基本的搜索都大有用途。


GraphRAG 方法可以归结为：利用大型语言模型 (LLMs) 从数据来源中提取知识图谱；将此图谱聚类成不同粒度级别的相关实体社区；对于 RAG 操作，遍历所有社区以创建“社区答案”，并进行缩减以创建最终答案。




https://juejin.cn/post/7392115478561325083

https://www.jiqizhixin.com/articles/2024-07-15-13


https://www.53ai.com/news/qianyanjishu/2024070997368.html
