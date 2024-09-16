USE SQL_PRACTICE
CREATE DATABASE SQL_PRACTICE

--1) CREATE --> if we want to create a object (table/view/function) in a database
--2) ALTER --> used to add/remove any column or we can say this command is used to modify the existing object
--3) DROP --> delete table


-- how to create a table

CREATE TABLE EmployeeInformation
(
employeed_id int UNIQUE,
first_name varchar(20)
)

DELETE EmployeeInformation
ALTER TABLE EmployeeInformation ADD employeed_id int UNIQUE

CREATE TABLE STUDENT
(
StudentID int UNIQUE,
StudentName varchar(50),
FatherName varchar(50),
DOB date
)

ALTER TABLE STUDENT ADD MotherName varchar(50)

-- DQL - data query language

SELECT * FROM EmployeeInformation

INSERT INTO EmployeeInformation VALUES('1','Neeraj')
INSERT INTO EmployeeInformation VALUES('2','Dheeraj')
INSERT INTO EmployeeInformation VALUES('3','Miraj')

