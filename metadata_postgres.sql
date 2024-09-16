-- get table indexes
SELECT * FROM pg_indexes WHERE schemaname = 'public';

-- explain plans or can use pg_admin IDE explain
explain
select asset_id, count(*) as no_of_assets
from assets
group by
    asset_id
limit 10;

-- index scan
select * from orders where order_id = 2;

-- sequence scan
select count(*) from order_items where order_item_order_id = 2;

-- index scan, index only scan
-- sequence scan (i.e. full table scan)
-- hash inner join, bitmap nested loop join

-- generally, adding indexes improves performance while reading but might affect writing operations.

-- in vs exists