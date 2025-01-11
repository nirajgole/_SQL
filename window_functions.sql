use redTech

-- SUBQUERY --
-- scaler subquery
SELECT *
FROM OnlineRetailSales
WHERE [Order Total] >=
    (SELECT AVG([Order Total])
FROM OnlineRetailSales)

-- multi-line subquery
SELECT [Speaker Name], [Session Name], [Start Date], [End Date], [Room Name]
FROM SessionInfo
WHERE [Speaker Name]
IN (SELECT [Name]
FROM [SpeakerInfo]
WHERE [Organization]='Two Trees Olive Oil')

SELECT [Speaker Name]
FROM SessionInfo as ses
    INNER JOIN (SELECT [Name]
    FROM SpeakerInfo
    WHERE Organization='Two Trees Olive Oil') as si
    ON ses.[Speaker Name]=si.[Name]

-- correlated subquery
SELECT [First name], [State]
FROM [ConventionAttendees] as c
WHERE NOT EXISTS (
    select [CustState]
FROM [OnlineRetailSales] as o
WHERE c.[State]=o.[CustName]
)

-- CTE --
-- note: select both WITH and SELECT statements and run.
WITH
    AverageTotal (AVG_TOTAL)
    AS
    (
        SELECT AVG([Order Total]) AS AVG_TOTAL
        FROM OnlineRetailSales
    )
SELECT *
FROM OnlineRetailSales, AverageTotal
WHERE [Order Total]>=AVG_TOTAL

-- recursive query
WITH
    DirectReports
    AS
    (
                    SELECT EmployeeID, [First Name], Manager
            FROM EmployeeDirectory
            WHERE EmployeeID=42
        UNION ALL
            SELECT e.EmployeeID, e.[First Name], e.Manager
            FROM EmployeeDirectory e
                INNER JOIN DirectReports AS d ON e.Manager=d.EmployeeID
    )
SELECT COUNT(*) as DirectReports
FROM DirectReports as d
WHERE d.EmployeeID!=42

WITH
    averageInStock (AVG_STOCK)
    as
    (
        SELECT AVG([In Stock])
        FROM Inventory
    )

SELECT ProdCategory, ProdNumber, ProdName
FROM Inventory, averageInStock
WHERE [In Stock]<=AVG_STOCK

-- WINDWOS FUNCTIONS
-- ROW NUMBER
WITH
    row_nnumber
    AS
    (
        SELECT OrderNum, OrderDate, CustName, ProdName, Quantity,
            ROW_NUMBER() OVER(PARTITION BY CustName ORDER BY OrderDate DESC) AS ROW_NUM
        FROM OnlineRetailSales
    )

SELECT TOP 20
    *
FROM row_nnumber
WHERE ROW_NUM=1

WITH
    ORDER_TOTALS
    AS
    (
        SELECT TOP 20
            OrderNum, OrderDate, ProdCategory, ProdName, [Order Total],
            ROW_NUMBER() OVER(PARTITION BY ProdCategory ORDER BY [Order Total] DESC) AS ROW_NUM
        FROM OnlineRetailSales
        WHERE CustName = 'Boehm Inc.'
    )

SELECT *
FROM ORDER_TOTALS
WHERE ROW_NUM <=3

-- LAG and LEAD
SELECT
    LAG([Session Name],1) OVER(ORDER BY [START DATE] ASC) AS PreviousSession,
    LAG([Start Date],1) OVER(Order BY [Start Date] ASC) AS PreviousDate,
    LEAD([Session Name],1) OVER(Order BY [Start Date] ASC) AS NextSession,
    LEAD([Start Date],1) OVER(Order BY [Start Date] ASC) AS NexrSessionStartTime
FROM SessionInfo;

WITH
    orderbydays
    as
    (
        SELECT orderdate, SUM(Quantity) as quantity_by_day
        from OnlineRetailSales
        WHERE ProdCategory='Drones'
        GROUP BY OrderDate
    )

SELECT OrderDate, quantity_by_day,
    LAG(quantity_by_day,1) OVER(order by orderdate asc) as LastDateQuantity_1,
    LAG(quantity_by_day,2) OVER(order by orderdate asc) as LastDateQuantity_2,
    LAG(quantity_by_day,3) OVER(order by orderdate asc) as LastDateQuantity_3,
    LAG(quantity_by_day,4) OVER(order by orderdate asc) as LastDateQuantity_4,
    LAG(quantity_by_day,5) OVER(order by orderdate asc) as LastDateQuantity_5
FROM orderbydays

create table lag_department
(
dept_id int,
sales_year date,
sales_amount float
);
truncate table lag_department;
insert into lag_department
values 
(1,'10-10-2024',1500.00),
(1,'10-10-2023',0.00),
(1,'10-10-2022',1200.00),
(2,'10-10-2021',800.00),
(2,'10-10-2020',500.00),
(3,'10-10-2019',3000.00),
(3,'10-10-2018',150.00),
(3,'10-10-2017',9999.00),
(4,'10-10-2016',7856.00),
(5,'10-10-2015',562.00)
;

select *
from lag_department;

-- with cte---
with cte as(
select 
	dept_id,
	sales_amount,
	lag(sales_amount,1) over(partition by dept_id order by sales_year desc) as prev_salary
from lag_department)

select * 
from cte
where sales_amount > prev_salary;

-- temp table---
DROP TABLE IF EXISTS t_ranked;
create temp table t_ranked as
select 
	dept_id,
	sales_amount,
	sales_year,
	lag(sales_amount,1,0) over(partition by dept_id order by sales_year desc) as prev_sales_amount
from lag_department;

select * 
from t_ranked
where sales_amount > prev_sales_amount;



-- Ranking
-- RANK and DENSE_RANK
SELECT [last name],
    RANK()OVER(order by [last name]) as Rank,
    DENSE_RANK() OVER(Order By [last name]) as Dense_Rank
FROM EmployeeDirectory;

WITH
    ranks
    as
    (
        SELECT
            DENSE_RANK() OVER(PARTITION by STATE ORDER by [Registration Date]) as AttendeesByState,
            *
        FROM ConventionAttendees
    )

SELECT *
FROM ranks
WHERE AttendeesByState in (1,2,3)
