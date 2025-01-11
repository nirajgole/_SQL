truncate table_1, table_2;

insert into table_2
    (val)
values
    (NULL),
    (0),
    (1),
    (2);

insert into table_1
    (val)
values
    (null),
    (null),
    (1),
    (1),
    (2),
    (3);

select *
from table_1;
select *
from table_2;

-- inner join--- 3 counts
-- nulls are removed in joins
select *
from table_1 t1
    join table_2 t2
    on t1.val=t2.val;

-- full join -- 8 counts
-- nulls will be kept in full join
select *
from table_1 t1
    full join table_2 t2
    on t1.val=t2.val;

-- right join 5 count
select *
from table_1 t1
    right join table_2 t2
    on t1.val = t2.val;

-- left join 6 count
select *
from table_1 t1
    left join table_2 t2
    on t1.val=t2.val;

-- left-anti
select t1.*
from table_1 t1
    left join table_2 t2 on t1.val=t2.val
where t2.val is null;

-- left-semi
select t1.*
from table_1 t1
    left join table_2 t2 on t1.val=t2.val
where t2.val is not null;

-- - 3 count
select *
from table_1 t1
where exists(
select *
from table_2 t2
where t1.val=t2.val
);

SELECT *
FROM table_1 t1
WHERE t1.val IN (SELECT val
FROM table_2);

-- aggregation
select
    count(*) as count_star,
    count(1) as count_1,
    count(val) as count_val, -- null ignored
    min(val) as min,
    max(val) as max,
    sum(val) as sum,
    avg(val) as avg
from table_1;

-- with group by
select
    count(*) as count_star,
    count(1) as count_1,
    count(val) as count_val, -- null ignored
    min(val) as min,
    max(val) as max,
    sum(val) as sum,
    avg(val) as avg
from table_1
group by val
order by val
;

-- distinct -- will keep null
select
    distinct *
from table_1;

-- 4 counts
select *
from table_1
where val is not null;

-- 4 counts
select count(val)
from table_1;

-- 6 counts
select count(*)
from table_1;

-- here distinct will keep null but ultimately count will ignore null
select count(distinct val) as cnt
from table_1;

