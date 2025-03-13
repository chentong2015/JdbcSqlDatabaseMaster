-- UNION联合查询结果时必须保证字段一致
select id, name from tableA where id < 10
UNION
select id from tableA where id > 100;

-- 只统计离散数据的数量
select count(DISTINCT id) from tableA where status = 'updated';
