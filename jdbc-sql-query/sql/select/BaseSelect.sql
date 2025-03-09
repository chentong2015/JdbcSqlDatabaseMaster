 -- 取所有变化日期中的最大日期，作为最后的价格标准
select distinct product_id, new_price as price
from Products
where (product_id, change_date) in (
    -- 取某个ID的变化时间内的最大时间
    select product_id, max(change_date)
    from Products
    where change_date <= '2019-08-16'
    group by product_id
)
union
-- 取其它变化时间超过指定日期的默认数据
select product_id, 10 as price
from Products
group by product_id
having min(change_date) > '2019-08-16'