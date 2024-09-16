TEMPORARY TABLE:

Type of Tables:
a)-Permanent Table: those table whose permanently save into our database
b)-Temporary Table:


SELECT * FROM EmployeeDetails


Temporary table name will always start with #

EmployeeDetails
#employeeDetails

CREATE TABLE #StudentDetails
(
ID INT,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Age INT
)


SELECT * FROM #StudentDetails



One query-->one store procedure--->To display the Sales data to the user

FROMDATE
TODATE
Sales-->SaleDate,Amount,Qty,ProductID,CustomerID--->50000 RECORD
AFTER THE FILTER(FROMDATE,TODATE)--5000 RECORD

5000 RECORD--->TEMP TABLE

TEMP TABLE--->Product,Customer 
----========================================================================================================
FUNCTION:

SUM()
AVG
MONTH

a)-USER DEFINED FUNCTION 
b)-SYSTEM DEFINED FUNCTION

---********************************************************************************************

SYSTEM DEFINED FUNCTION:

STRING/CHARACTER FUNCTION:

LTRIM()--->This will remove the extra blank space from Left side
RTRIM()
TRIM()--->it will remove the space from both the side
REPLACE()
UPPER()
LOWER()
REVERSE()
SUBSTRING()


SELECT 
LTRIM(FirstName) AS WithLtrim  ,
FirstName AS WithOutLtrim
FROM 
EmployeeDetails
WHERE EmployeeID=3

SELECT 
RTRIM(FirstName) AS WithRtrim,
FirstName WithOutRtrim
FROM 
EmployeeDetails
WHERE EmployeeID=4

SELECT TRIM(FirstName) AS WithTrim,FirstName AS WithOutTrim FROM EmployeeDetails
WHERE EmployeeID=6

'Rohit'
'    Rohit        '
'Rohit'
'    Rohit'

'    Rohit        '
'AFTAB'
'AFTAB                       '
'AFTAB                       '
'AFTAB                       '

SELECT REPLACE('Sahil','A','B')

SELECT 
REPLACE(FirstName,'I','A'),
FirstName
FROM 
EmployeeDetails
WHERE EmployeeID=3


select replace('Sahil Jaiswal',' ','')


select replace('12345','2','6')

select replace(12345,2,6)

---========================
UPPER-->it will convert all the value into the UPPER CASE


SELECT 
UPPER(FirstName) 
FROM 
EmployeeDetails

SELECT * FROM EmployeeDEtails
--======================================
LOWER--->it will convert all the data into the lower case

SELECT 
LOWER(FirstName),
FirstName
FROM 
EmployeeDetails
--================================================
REVERSE()

SELECT REVERSE('Abhinav')

SELECT 
REVERSE(FirstName),
FirstName
FROM 
EmployeeDetails 
---===================================================
SUBSTRING-->it will take three parameter
1)-STRING VALUE
2)-STARTING INDEX
3)-How many character you want to display


SELECT SUBSTRING('Sahil',1,3)

Write a query to display first three character from FirstName Column?


SELECT 
SUBSTRING(TRIM(FirstName),1,3),
FirstName
FROM 
EmployeeDetails


--****************************************************************
SELECT CHARINDEX('A','Sahil')


--****************************************************************

DATE FUNCTION


MONTH()-----
YEAR()
DAY()
DATEADD()
DATEDIFF()
GETDATE()

--FORMAT-->YYYY-MM-DD

SELECT 
DOB ,
MONTH(DOB) AS MonthNo
FROM 
EmployeeDetails


SELECT 
DOB ,
YEAR(DOB) AS YearNo
FROM 
EmployeeDetails


SELECT 
DOB ,
DAY(DOB) AS DayNo
FROM 
EmployeeDetails


SELECT DATENAME(WeekDay,GETDATE())

SELECT DATENAME(mm,GETDATE())

SELECT 
DOB,
DATENAME(mm,DOB) AS MonthName,
DATENAME(Weekday,DOB) AS DayNames
FROM 
EmployeeDetails


DATEADD--->
will take three parameter
a)-interval
b)-number 
c)-Date

dd----->day
mm----->month
yy----->year

SELECT DATEADD(dd,5,'2023-01-01')

SELECT DATEADD(mm,3,'2023-01-01')


SELECT DATEADD(mm,3,'2023-11-01')

SELECT DATEADD(yy,3,'2023-11-01')
--******************************************************************

DATEDIFF--->this function will take three parameter
a)-Interval

dd----->day
mm----->month
yy----->year

b)-STARTDATE
c)-ENDDATE


SELECT DATEDIFF(d,'2023-01-01','2023-01-10')

SELECT DATEDIFF(mm,'2023-01-01','2024-01-10')

SELECT DATEDIFF(yy,'2023-01-01','2024-01-10')

SELECT DATEDIFF(yyyy,'2023-12-31','2020-01-01')

SELECT DATEDIFF(yyyy,'2023-01-31','2023-11-01')

SELECT 
DATEDIFF(dd,'2023-01-01','2023-01-10'),
DATEDIFF(mm,'2023-01-01','2024-01-10'),
DATEDIFF(yy,'2023-01-01','2024-01-10')

---==================================================================================
Aggregate Function:


SUM()
MAX()
MIN()
COUNT()
AVG()

Write a query to display total salary from employeedetails table?

SELECT 
SUM(Salary) 
FROM 
EmployeeDetails

write a query to display the how many empployee are working in our org?

SELECT 
COUNT(*)
FROM 
EmployeeDetails

Write a query to display the maximum salary value?

SELECT 
MAX(Salary) 
FROM 
EmployeeDetails



Write a query to display the employee count department wise?

SELECT * FROM EmployeeDEtails

SELECT 
DepartmentID,
COUNT(*) 
FROM 
EmployeeDetails 
GROUP BY DepartmentID

SELECT
D.DepartmentName,
COUNT(*)
FROM 
EmployeeDetails AS ED 
LEFT JOIN Department AS D ON ED.DepartmentID=D.DepartmentID
GROUP BY D.Departmentname



SELECT
Department.DepartmentName,
COUNT(*)
FROM 
EmployeeDetails 
LEFT JOIN Department ON EmployeeDetails.DepartmentID=Department.DepartmentID
GROUP BY Department.Departmentname

--**********************************************************************
SELECT * FROM EmployeeDetails 
SELECT * FROM Department
SELECT * FROM Client

1)-write a query to display those employee who born in June Month?
2)-Write a query to display the expreince of the  employee 
Note-->Expreince will be display in no of month?

3)-write a query to display the one new column which contains first three letter from the firstname 
and lastThree letter from lastname? SAHIL JAISWAL---->SAHWAL

4)-write a query to display the FirstName but first character will be in Capital case and 
rest of the character in small case? SAHIL --->Sahil

5)-Write a query to display Dayname and Monthname for the DOB and DOJ column?
6)- write a query to display departmentname wise EmployeeCount--->DepartmentName,EmployeeCount
7)-Write a query to display the maximum salary departmentname?
8)-Write a query to display the Avg Salary ClientWise?-->ClientName,AvgSalary
9)-Write a query to display the maximum salary DepartmentWise?
--********************************************************************** 






















































































































