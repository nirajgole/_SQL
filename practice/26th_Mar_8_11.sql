LIKE OPERATOR--->

Write a query to display those employee whose first name is 'sahil'

SELECT * FROM EmployeeDetails WHERE FirstName='Sahil'

Write a query to display those employee whose first name is start with 'S'


LIKE 

SELECT * FROM EmployeeDetails WHERE FirstName LIKE 'S%'


SELECT * FROM EmployeeDetails WHERE EmployeeID LIKE '%2'


SELECT * FROM EmployeeDetails WHERE FirstName LIKE '%a%'


Write a query to display those employee whose First name is end with 't'

SELECT * FROM EmployeeDetails WHERE FirstName LIKE '%t'

_  ----> one character
__   --> two character

Write a query to display those employee whose firtsname have a 'R' Character on 2nd position?


SELECT * FROM EmployeeDetails WHERE FirstName LIKE '_R%'


Write a query to display those employee whose firtsname have a 'C' Character on 3rd position?

SELECT * FROM EmployeeDetails WHERE FirstName LIKE '__C%'

---=============================
INSERT INTO EmployeeDetails(EmployeeID,FirstName,LastName,DepartmentID,ClientID,DOB,DOJ,Salary,Gender)
VALUES(13,'Suraj','Singh',1,1,'2021-01-01','2023-02-02',10000,'M')
Suraj
Sahil
Sanjiv
soni
--========================================================================================================
JOIN
Type of join 

a)-INNER JOIN--------->inner join will return those data which are present in both the table
b)-LEFT JOIN 
c)-RIGHT JOIN
d)-CROSS JOIN 
e)-FULL OUTER JOIN


SELECT 
EmployeeID,FirstName,LastName,DepartmentName 
FROM 
EmployeeDetails 
INNER JOIN Department ON EmployeeDetails.DepartmentID=Department.DepartmentID

SELECT 
* 
FROM 
Department
INNER JOIN EmployeeDetails  ON Department.DepartmentID=EmployeeDetails.DepartmentID


SELECT * FROM EmployeeDetails

SELECT * FROM Department


---=======================================================================================
--LEFT JOIN--

SELECT 
EmployeeID,FirstName,LastName,DepartmentName 
FROM 
EmployeeDetails ----->LEFT TABLE
LEFT JOIN Department ON EmployeeDetails.DepartmentID=Department.DepartmentID---RIGHT TABLE


SELECT 
*
FROM 
EmployeeDetails ----->LEFT TABLE
LEFT JOIN Department ON EmployeeDetails.DepartmentID=Department.DepartmentID---RIGHT TABLE
---=======================================================================================
--RIGHT JOIN

SELECT 
EmployeeID,FirstName,LastName,DepartmentName 
FROM 
EmployeeDetails ----->LEFT TABLE
RIGHT JOIN Department ON EmployeeDetails.DepartmentID=Department.DepartmentID---RIGHT TABLE

--=-============================================================================================
CROSS JOIN--> we did not need any join condition

SELECT 
* 
FROM 
EmployeeDetails 
CROSS JOIN Department





SELECT 
EmployeeID,
FirstName,
LastName,
Date
FROM 
EmployeeDetails 
CROSS JOIN DimDate

SELECT * FROM DimDate



CREATE TABLE Sales1
(
OrderID INT,
OrderQty INT,
EmployeeID INT,
Amount INT
)
--***************************************************************************************
FULL OUTER JOIN /FULL JOIN(LEFT JOIN + RIGHT JOIN)

SELECT 
* 
FROM 
EmployeeDetails 
FULL JOIN Department ON EmployeeDetails.DepartmentID=Department.DepartmentID


SELECT 
* 
FROM 
EmployeeDetails 
JOIN Department ON EmployeeDetails.DepartmentID=Department.DepartmentID
JOIN Client ON Client.ClientID=EmployeeDetails.ClientID





































