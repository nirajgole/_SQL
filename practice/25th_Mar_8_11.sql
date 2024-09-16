CHARACTER 

a)-CHAR
b)-VARCHAR
c)-NVARCHAR

CREATE TABLE Character_TestData
(
FirstName Char(10)
)

INSERT INTO Character_TestData(FirstName) 
VALUES('Sahil')

SELECT * FROM Character_TestData
'Sahil'
'Sahil'

What is length of this column-->10
how many character we are passing for this column

SELECT 10-5

INSERT INTO Character_TestData(FirstName) 
VALUES('Amit')

'Amit'

CREATE TABLE Varchar_Test
(
FirstName VARCHAR(10)
)

INSERT INTO varchar_test(FirstName)VALUES('Sahil')

SELECT * FROM varchar_test
'Sahil'

CREATE TABLE Varchar_Max
(
FirstName VARCHAR(8001)
)


CREATE TABLE Varchar_Max
(
FirstName VARCHAR(MAX)
)
--================================
NVARCHAR

INSERT INTO varchar_test(FirstName)
SELECT '食物'


CREATE TABLE Nvarchar_Test
(
FirstName NVARCHAR(100)
)

INSERT INTO NVARCHAR_Test(FirstName)
VALUES (N'食物')

INSERT INTO NVARCHAR_Test(FirstName)
VALUES ('食物')


SELECT * FROM nvarchar_test

VARCHAR    CHAR    NVARCHAR


---===========================================================
---DATE
a)-DATE---will hold only date value
b)-DATETIME---->will hold date and time both
c)-TIME---->this will hold only time part

---
DATE FORMAT-->'yyyy-mm-dd'
CREATE TABLE DATE_TEST1
(
JoiningDate DATE
)

INSERT INTO DATE_TEST1(JoiningDate)VALUES('2023-03-25 15:12:22.797')

SELECT * FROM DATE_TEST1

CREATE TABLE DATETIME_TEST1
(
JoiningDate DATETIME
)

INSERT INTO DATETIME_TEST1(JoiningDate)VALUES('2023-03-25 15:12:22.797')

SELECT * FROM DATETIME_TEST1

--SELECT GETDATE()

--TIME 

Holds in format HH:MM:SS

CREATE TABLE TIME_TEST1
(
JoiningTime TIME
)

INSERT INTO TIME_TEST1(JoiningTime)VALUES('2023-03-25 15:12:22.797')

SELECT * FROM TIME_TEST1
SELECT * FROM DATETIME_TEST1
SELECT * FROM DATE_TEST1

---************************************************************************************
CONSTRAINTS:

CREATE TABLE VoterLists
(
VoterID INT,
FirstName VARCHAR(50),
lastName VARCHAR(50),
Age INT
)

INSERT INTO VoterLists(VoterID,FirstName,lastName,Age)
VALUES(1,'Sahil','Jaiswal',17)

CONSTRAINT TYPE:
a)-NOT NULL---> if we apply this constrain on the column then that column will not allo any null values
b)-UNIQUE
c)-DEFAULT
d)-PRIMARY KEY


CREATE TABLE NOTNULL_Check 
(
EmployeeID INT,
FirstName VARCHAR(100)
)

INSERT INTO NOTNULL_Check(EmployeeID,FirstName)
VALUES(NULL,'Sahil')




CREATE TABLE NOTNULL_Check1 
(
EmployeeID INT NOT NULL,
FirstName VARCHAR(100)
)


INSERT INTO NOTNULL_Check1(EmployeeID,FirstName)
VALUES(NULL,'Sahil')

--========================UNIQUE===========


CREATE TABLE UNIQUE_Check
(
EmployeeID INT,
FirstName VARCHAR(100)
)

INSERT INTO UNIQUE_Check(EmployeeID,FirstName)VALUES(1,'Sahil')
INSERT INTO UNIQUE_Check(EmployeeID,FirstName)VALUES(1,'Vishal')

CREATE TABLE UNIQUE_Check1
(
EmployeeID INT UNIQUE,
FirstName VARCHAR(100)
)

INSERT INTO UNIQUE_Check1(EmployeeID,FirstName)VALUES(1,'Sahil')
INSERT INTO UNIQUE_Check1(EmployeeID,FirstName)VALUES(2,'Vishal')


SELECT * FROM UNIQUE_Check1


--===========================================================================
DEFAULT

CREATE TABLE DEFAULT_CHECK
(
EmployeeID INT,
Firstname VARCHAR(100),
LastName VARCHAR(100),
CompanyName VARCHAR(100)
)

INSERT INTO DEFAULT_CHECK(EmployeeID,Firstname,LastName,CompanyName)
VALUES(1,'Sahil','Jaiswal','Intellipat')

INSERT INTO DEFAULT_CHECK(EmployeeID,Firstname,LastName)
VALUES(2,'Ankesh','Kumar')

SELECT * FROM DEFAULT_CHECK


CREATE TABLE DEFAULT_CHECK1
(
EmployeeID INT,
Firstname VARCHAR(100),
LastName VARCHAR(100),
CompanyName VARCHAR(100) DEFAULT('Intellipat')
)

INSERT INTO DEFAULT_CHECK1(EmployeeID,Firstname,LastName)VALUES(1,'Sahil','Jaiswal')


INSERT INTO DEFAULT_CHECK1(EmployeeID,Firstname,LastName,CompanyName)VALUES(2,'Saran','V','Microsoft')

SELECT * FROM DEFAULT_CHECK1
--=====================================================================
PRIMARY KEY--> we can use the primary key column to uniquely identify the record
(NOT NULL + UNIQUE)

primary key will not allow any null values and also it will store only unqiue records
SELECT * FROM EmployeeDEtails


CREATE TABLE PRIMARY_KEY_TEST
(
EmployeeID INT,
FirstName VARCHAR(100),
LastName VARCHAR(100)
)

INSERT INTO PRIMARY_KEY_TEST(EmployeeID,FirstName,LastName)VALUES(2,'Sahil','Jaiswal')
INSERT INTO PRIMARY_KEY_TEST(EmployeeID,FirstName,LastName)VALUES(1,'Saurabh','singh')
INSERT INTO PRIMARY_KEY_TEST(EmployeeID,FirstName,LastName)VALUES(3,'Rajat','Gupta')

INSERT INTO PRIMARY_KEY_TEST(EmployeeID,FirstName,LastName)VALUES(3,'Amit','Gupta')

CREATE TABLE PRIMARY_KEY_TEST1
(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(100),
LastName VARCHAR(100)
)

INSERT INTO PRIMARY_KEY_TEST1(EmployeeID,FirstName,LastName)VALUES(2,'Sahil','Jaiswal')
INSERT INTO PRIMARY_KEY_TEST1(EmployeeID,FirstName,LastName)VALUES(1,'Saurabh','singh')
INSERT INTO PRIMARY_KEY_TEST1(EmployeeID,FirstName,LastName)VALUES(3,'Rajat','Gupta')

INSERT INTO PRIMARY_KEY_TEST1(EmployeeID,FirstName,LastName)VALUES(3,'Rajat','Gupta')

SELECT * FROM PRIMARY_KEY_TEST1
--=================================================================================
OPERATOR

a)-AND 

SELECT * FROM EmployeeDetails WHERE FirstName='Sachin' AND EmployeeID=10


SELECT * FROM EmployeeDetails WHERE DepartmentID=4 AND FirstName='Vijay' 

--==============================================================
OR


SELECT * FROM EmployeeDetails WHERE FirstName='Vijay' OR DepartmentID=2

--===============================================

WRITE a query to display all the employee details from Employee table but we need to exclude those employee
who are working with DepartmentID 2?



SELECT 
* 
FROM 
EmployeeDetails 
WHERE DepartmentID<>2

write a query to display those employee who are working with departmentID 1?

SELECT * FROM EmployeeDetails WHERE DepartmentID=1

write a query to display those employee who are working with departmentID 2,3?

IN Operator

SELECT * FROM EmployeeDetails WHERE DepartmentID IN (2,3)


SELECT * FROM EmployeeDetails WHERE DepartmentID =2 OR DepartmentID=3
--WHERE FIRSTNAME='SAHIL' AND FirstNAME='Amit'
---============

NOT IN
 
 we have to display the employee data but need to exclude departmentID 2,3


 SELECT * FROM EmployeeDetails WHERE DepartmentID NOT IN (2,3)


----============================================================
-- BETWEEN 

SELECT 
* 
FROM 
EmployeeDetails
WHERE Salary BETWEEN 50000 AND 70000

--***************************************************************************************************************
1)-Write a query to display those employee who are working with clientID 1?

SELECT * FROM  EmployeeDEtails WHERE ClientID=1

2)-Write a query to display those employee who are working with clientID 1 and departmentID 2?

SELECT * FROM EmployeeDEtails WHERE ClientID=1 AND DepartmentID=2

3)-write a query to display those employee who are working with DepartmentID 3,4 and getting the salary more than 60k?

SELECT * FROM EmployeeDetails WHERE DepartmentID IN (3,4) AND Salary>60000

Select * from  Employeedetails Where salary>60000 AND  DepartmentID IN (3,4)


4)-write a query to display those employee whose firstname is vijay and working with departmentID 4?

SELECT * FROM EmployeeDetails WHERE FirstName='Vijay' AND DepartmentID=4
5)-write a query to display those employee whose firstname is sahil and lastname is jaiswal?

SELECT * FROM EmployeeDetails WHERE FirstName='Sahil' AND LastName='Jaiswal'



















































