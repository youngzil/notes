https://draveness.me/dsl
领域专用语言(DSL)和通用编程语言(GPL)：
领域专用语言（Domain Specific Language/DSL）
通用编程语言（General Purpose Language/GPL）


DSL解释
领域专用语言（Domain Specific Language/DSL）
DSL 通过在表达能力上做的妥协换取在某一领域内的高效(世界级软件开发大师 Martin Fowler 对于DSL的解释)

DSL相对应的GPL
 通用编程语言（General Purpose Language/GPL）
 通用编程语言指被设计为各种应用领域服务的编程语言。通常通用编程语言不含有为特定应用领域设计的结构。就是我们非常熟悉的 Objective-C、Java、Python 以及 C 语言等等 

DSL介绍
 1.QueryDSL仅仅是一个通用的查询框架，专注于通过Java API构建类型安全的SQL查询
 2.QueryDSL可以通过一组通用的查询API为用户构建出适合不同类型ORM框架或者是SQL的查询语句，也就是说QueryDSL是基于各种ORM框架以及SQL之上的一个通用的查询框架
 3.借助QueryDSL可以在任何支持的ORM框架或者SQL平台上以一种通用的API方式来构建查询。目前QueryDSL支持的平台包括JPA,JDO,SQL,Java Collections,Lucene,Mongodb等。

DSL官网
 http://www.querydsl.com/ 

案例：
基本查询
List<Person> persons = queryFactory.selectFrom(person)
  .where(
    person.firstName.eq("John"),
    person.lastName.eq("Doe"))
  .fetch();
排序       
List<Person> persons = queryFactory.selectFrom(person)
  .orderBy(person.lastName.asc(), 
           person.firstName.desc())
  .fetch();
子查询
List<Person> persons = queryFactory.selectFrom(person)
  .where(person.children.size().eq(
    JPAExpressions.select(parent.children.size().max())
                  .from(parent)))
  .fetch();
  
元组映射
List<Tuple> tuples = queryFactory.select(
    person.lastName, person.firstName, person.yearOfBirth)
  .from(person)
  .fetch();
  
  
  
  
  