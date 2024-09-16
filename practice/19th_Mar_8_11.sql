TOOL-->SSMS--->SQL SERVER MANAGEMENT STUDIO


SQL--->Structure Query Language

DATABASE--->Database is a kind of container where we can store our 
information/data.

DATA ANALYST
DATA SCIENCE
DATA Engineer

ANSI SQL--->JOIN
SELECT * FROM <tableName>

1)-ORACLE(PL/SQL)
2)-MSSQL(Microsoft sql server)/T-SQL(Transact SQL)
3)-MYSQL
4)-Postgre-SQL
5)-SQLLite
----===========================================================
MSSQL--->Microsoft sql server

How to Create database?

Command Categories:

DDL Command---> DATA DEFINATION LANGUAGE

a)-CREATE-->if we want to create any object(Table/view/function) in a database we have to use create command
b)-ALTER--->ALTER Command is used to add/remove any column or we can say this command is used to modify the existing Object
c)-DROP---->DROP Command will used to remove any object from our database.


how to create a table:

INT-->INTEGER

CREATE TABLE EmployeeInformation
(
EmplopyeeID int,
FirstName VARCHAR(20)
)

ALTER TABLE EmployeeInformation ADD LastName VARCHAR(20)

DROP TABLE EmployeeInformation



--************************************************************************************
1)-Write a query to developed a student table which have a below mentioned attributes:
a)-StudentID (INT)
b)-StudentName (VARCHAR(50))
c)-Fathername (VARCHAR(50))
d)-DOB DATE


2)-Write a query to add a MotherName in a Student Table


CREATE TABLE STUDENT(StudentId INT, Student Name VARCHAR(50)Father Name VARCHAR(50)DOBDATE INT)ALTER TABLE Student ADD MotherName VARCHAR(50)
 15 MIN BREAK

--************************************************************************************

DQL--->DATA QUERY LANGUAGE

a)-SELECT

SELECT * FROM <TableName>

SELECT * FROM EmployeeInformation

SELECT * FROM EmployeeDetails

SELECT 
EmployeeID,
FirstName,
LastName
FROM EmployeeDetails
--======================================================================
DML--->DATA MANIPULATION LANGUAGE

a)-INSERT--->INSERT COMMAND WILL USED TO INSERT THE DATA INTO THE TABLE
b)-UPDATE--->When we want to change the existing data in our table then we can use update statement.
c)-DELETE--->When we want to remove the data from the tables then we can use delete command

INSERT--->

SELECT * FROM EmployeeDetails
ORDER BY 1 asc


--STRING/DATE VALUE WILL BE ALWAYS CAME WITH INVERETED COMMA

INSERT INTO EmployeeDetails(EmployeeID,FirstName,LastName,DepartmentID,ClientID,DOB,DOJ,Salary,Gender)
VALUES(8,'Vijay','Kumar',4,2,'1999-01-01','2023-03-18',80000,'M')


INSERT INTO EmployeeDEtails
VALUES(9,'Gaurav','Kumar',4,2,'1999-01-01','2023-03-18',80000,'M')

INSERT INTO EmployeeDetails(EmployeeID,FirstName,LastName)
VALUES(10,'Sachin','Kumar')

INSERT INTO EmployeeDetails(EmployeeID,FirstName,LastName)
VALUES(11,'Sachin','Kumar')
----===============================================================================================
SELECT * FROM EmployeeDEtails

DATE--->'YYYY-MM-DD'
UPDATE EmployeeDetails SET DOJ='2023-03-19'

Write a query to modify the DOJ Column for EmployeeID 11 New DOJ Will be 2023-03-20?

UPDATE EmployeeDetails SET DOJ='2023-03-20' WHERE EmployeeID=11

SELECT * FROM EmployeeDetails WHERE EmployeeID=10


SELECT * FROM EmployeeInformation


DELETE FROM EmployeeInformation

DELETE FROM EmployeeInformation WHERE EmplopyeeID=2

INSERT INTO EmployeeInformation(EmplopyeeID,FirstName)
VALUES(1,'Sahil')


INSERT INTO EmployeeInformation(EmplopyeeID,FirstName)
VALUES(2,'Vikash')


INSERT INTO EmployeeInformation(EmplopyeeID,FirstName)
VALUES(3,'Gaurav')


DROP is a DDL Command, it's mean it will work on the structure of the table,
When we run DROP command so will remove the table from the database.'

DELETE-->Delete is a DML Command it will just remove the data it will make any changes table structure level.


--================================================================================
DCL-->DATA CONTROL LANGUAGE

a)-GRANT 
b)-REVOKE
--**********************************************************************************

NUMERICAL DATATYPE:


TINYINT---will hold the value between 0 to 255  Memory--->1 Byte
SMALLINT-- -32768 to 32767                      Memory--->2 Byte
INT-------                                      Memory--->4 byte
BIGINT---                                       Memory--->8 byte

DECIMAL

CREATE TABLE TinyIntTest
(
ID TINYINT
)

INSERT INTO TinyIntTest(ID)
VALUES(10)


INSERT INTO TinyIntTest(ID)
VALUES(255)


INSERT INTO TinyIntTest(ID)
VALUES(256)


INSERT INTO TinyIntTest(ID)
VALUES(-1)


SELECT * FROM TinyIntTest
---*******************************************
CREATE TABLE SmallIntTest
(
ID SMALLINT
)

INSERT INTO SmallIntTest(ID)
VALUES(1000)

INSERT INTO SmallIntTest(ID)
VALUES(-40000)

SELECT * FROM SmallIntTest
---*******************************************
CREATE TABLE VoterList
(
VoterID INT,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Age TinyINT
)

let's assume we have 10000 voter in our tables'
TinyInt------>10000*1=10000 Byte
SmallInt----->10000*2=20000 Byte
Int---------->10000*4=40000 Byte
BIGINT------->10000*8=80000 Byte

DECIMAL(10,2)--->

6-2=4

5-3=2
DECLARE @Percentage DECIMAL(5,3)=25.12178678678686788
SELECT @Percentage


CREATE TABLE DecimalTest
(
ID INT,
Percentages DEcimal(4,2)
)

INSERT INTO DecimalTest(ID,Percentages)
SELECT 1,12.43
--*****************************************************************************






















































