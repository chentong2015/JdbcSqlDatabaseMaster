-- 分析以下SQL的执行顺序
-- Having操作(筛选)分组后的结果
select cat_id, count(order_id) as sales
  from t_tab
  where cat_id <> "c666"
  group by cat_id
  having count(order_id) > 10
  order by count(order_id) desc
  limit 100;

-- UNION联合查询结果时必须保证字段一致
Select id, name from tableA where id < 10
  UNION
  Select id from tableA where id > 100;

-- 只统计离散数据的数量
Select count(DISTINCT id)
  from tableA
  where status = 'updated';

-- 选择重复信息的列
Select name, email count(*) as nums
  from users
  group by name, email
  having count(*) > 1;

Select alter_id
  from records
  group by alter_id
  having count(alter_id) > 1;
