package com.mysql.main.index;

// HW索引的基本规范 ==> 对应到底层数据结构的实现 !!
// 1. 表必须有主键
// 2. 禁止创建冗余索引, 避免索引的隐式转换
//    > 不要在已经为表主键的列集合上再创建索引
//    > 合理创建联合索引(a,b,c)相当于(a)、(a,b)、(a,b,c)
// 3. 创建索引必须有明确的使用目的，必须确保会被经常访问，不允许创建无用的索引
//    > 索引的存储需要占用空间，更新索引也需要耗用资源
// 4. 不要在选择性较低的或者包含默认值的字段上建立索引m
// 5. 不要在索引列进行数学运算或函数运算
// 6. 单张表中索引数量不超过5个，联合索引的字段数不超过5个
// 7. 尽量不要在长字符串的字段上建立索引，如char(1000)、varchar(1000)等
public class IndexSpecification {

    // 针对慢SQL查询的优化: 添加索引(对用户不可见)
    // Index基本操作指令
    // > CREATE INDEX index_name ON table_name (col1);
    // > Show index from table_name;

    // TODO: 常见的索引失效问题 ==> 索引优化策略
    // 1. 不在索引列上做任何操作(计算、函数、类型转换)，会导致索引失效而转向全表扫描
    // 2. mysql在使用不等于(！=或者<>)的时候无法使用索引会导致全表扫描
    // 3. is null，is not null无法使用索引
    // 4. like以通配符开头（“%abc..…）mysql索引失效会变成全表扫描的操作
    // 5. 字符串不加单引号索引失效
    // 6. 少用or，用它来连接时会索引失效
}