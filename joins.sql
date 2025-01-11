-- 1. self
-- 2. inner, left-semi
-- 3. outer, left, right, left-anti
-- 4. full
-- 5. cross

truncate if exists t1;
create table t1(
    id int
)
insert into t1
values
(1),
(1),
(1),
(2),
(4),
(5)

select * from t1;

insert into t2
values
(1),
(1),
(2),
(2),
(3),
(6)

select *
from t1
join t2 on t1.v=t2.v;

select *
from t1
left join t2 on t1.v=t2.v;

select *
from t1
right join t2 on t1.v=t2.v;

select *
from t1
full join t2 on t1.v=t2.v;

select *
from t1
left join t2 on t1.v=t2.v
where t2.v is null
;

select *
from t1
left join t2 on t1.v=t2.v
where t2.v is not null
;

select *
from t1
full join t2 on t1.v = t2.v;

select *
from t1
cross join t2;

select *
from t1 as t11
join t1 as t12 on t11.v=t12.v;
