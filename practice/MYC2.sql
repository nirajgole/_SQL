CREATE DATABASE CASESTUDY2

CREATE TABLE LOCATION (LOCATION_ID INT,CITY VARCHAR(10))

INSERT INTO LOCATION VALUES(122,'New York'),
(123, 'Dallas'),
(124,'Chicago'),
(167,'Boston')

SELECT * FROM LOCATION

CREATE TABLE DEPARTMENT (DEPARTMENT_ID INT, NAME VARCHAR(20), LOCATION_ID INT)

INSERT INTO DEPARTMENT VALUES(10,'Accounting',122),
(20,'Sales',124),
(30,'Research',123),
(40,'Operations',167)

SELECT * FROM DEPARTMENT;

CREATE TABLE JOB(JOB_ID INT,DESIGNATION VARCHAR(20))

INSERT INTO JOB VALUES (667,'Clerk'),
(668,'Staff'),
(669,'Analyst'),
(670,'Sales Person'),
(671,'Manager'),
(672,'President')

SELECT * FROM JOB;

CREATE TABLE EMPLOYEE (Employee_ID INT, Last_Name VARCHAR(20), First_Name VARCHAR(20), Middle_Name VARCHAR(20), 
Job_ID INT, Manager_ID INT, Hire_Date DATE,Salary MONEY, Comm INT,Department_ID INT)

INSERT INTO EMPLOYEE VALUES
(7369, 'SMITH', 'JOHN', 'Q', 667, 7902, '17-DEC-84', 800, NULL, 20),
(7499, 'ALLEN', 'KEVIN', 'J', 670, 7698, '20-FEB-85', 1600, 300, 30),
(7505, 'DOYLE', 'JEAN', 'K', 671, 7839, '04-APR-85', 2850, NULL, 30),
(7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '15-MAY-85', 2750, NULL, 30),
(7507, 'BAKER', 'LESLIE', 'D', 671, 7839, '10-JUN-85', 2200, NULL, 40),
(7521, 'WARK', 'CYNTHIA', 'D', 670, 7698, '22-FEB-85', 1250, 500, 30)

SELECT * FROM EMPLOYEE;
SELECT * FROM LOCATION
SELECT * FROM DEPARTMENT
SELECT * FROM JOB

--SIMPLE QUERIES:


1. LIST ALL THE EMPLOYEE DETAILS.

SELECT * FROM EMPLOYEE


2. LIST ALL THE DEPARTMENT DETAILS

SELECT * FROM DEPARTMENT

3. LIST ALL JOB DETAILS.

SELECT * FROM JOB


4. LIST ALL THE LOCATIONS.

SELECT * FROM LOCATION


5. LIST OUT THE FIRSTNAME, LASTNAME, SALARY, COMMISSION FOR ALL EMPLOYEES.

SELECT FIRST_NAME , LAST_NAME ,SALARY,COMM FROM EMPLOYEE


6. LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS
EMPLOYEEID AS "ID OF THE EMPLOYEE", LAST NAME AS "NAME OF THE EMPLOYEE",
DEPARTMENTID AS "DEP_ID".


ALIAS -> AS , "" , _

SELECT EMPLOYEE_ID AS "ID OF THE EMPLOYEE" , LAST_NAME  "NAME OF THE EMPLOYEE" , DEPARTMENT_ID AS DEP_ID FROM EMPLOYEE




7. LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.SELECT FIRST_NAME , SALARY*12 AS ANNUAL_SALARY FROM EMPLOYEESELECT FIRST_NAME + '  '+MIDDLE_NAME+'  '+LAST_NAME AS FULL_NAME, SALARY*12 AS ANNUAL_SALARY FROM EMPLOYEE WHERE CONDITION:


1. LIST THE DETAILS ABOUT "SMITH"


SELECT * FROM EMPLOYEE WHERE FIRST_NAME='SMITH'

SELECT * FROM EMPLOYEE WHERE LAST_NAME='SMITH'


SELECT * FROM EMPLOYEE WHERE 'SMITH' IN (FIRST_NAME,LAST_NAME)

SELECT * FROM EMPLOYEE WHERE FIRST_NAME = 'SMITH' OR LAST_NAME = 'SMITH';


2. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20.


SELECT * FROM EMPLOYEE WHERE Department_ID=20


3. LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 3000 AND 4500.


SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 3000 AND 4500



4. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.


SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID IN(10,20) 

SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID =10 OR Department_ID=20

5. FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30.


SELECT * FROM EMPLOYEE WHERE Department_ID NOT IN (10,30)


6. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'.

LIKE  ( _ ,%)
_ ->REPRESTATION OF SINGLE CHAR
% -> REPRESENTATION OF MULTIPLE CHAR


SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE 'S%'


7. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'.

SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE 'S%H'


8. LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'.

SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE 'S%' AND LEN(FIRST_NAME)=4


9. LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE

SALARIES MORE THAN 3500.


SELECT * FROM EMPLOYEE WHERE Department_ID=10 AND SALARY>3500

10. LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION.

SELECT * FROM EMPLOYEE WHERE COMM IS NULL

ORDER BY CLAUSE:


1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.

ASC 1-10
DESC 10-1

SELECT EMPLOYEE_ID  ,LAST_NAME FROM EMPLOYEE ORDER BY EMPLOYEE_ID ASC


2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.

SELECT EMPLOYEE_ID , FIRST_NAME ,SALARY FROM EMPLOYEE ORDER BY SALARY DESC



3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER


SELECT * FROM EMPLOYEE ORDER BY LAST_NAME ASC

4. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND
THEN ON DEPARTMENT_ID IN DESCENDING ORDER.SELECT * FROM EMPLOYEE ORDER BY LAST_NAME  ASC,Department_ID DESC--GROUP BY & HAVING CLAUSE

---DIFFERENT-PARTICULAR-ALL-WISE



1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION.


SELECT DEPARTMENT_ID , COUNT(*) AS COUNT_EMP FROM EMPLOYEE GROUP BY Department_ID


SELECT DEPARTMENT_ID , COUNT(Employee_ID) AS COUNT_EMP FROM EMPLOYEE GROUP BY Department_ID


2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF
THE EMPLOYEES.


SELECT DEPARTMENT_ID,MAX(SALARY) AS MAX_SALARY , MIN(SALARY) AS MIN_SALARY , AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE GROUP BY Department_ID

3. LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE
EMPLOYEES.

SELECT JOB_ID,MAX(SALARY) AS MAX_SALARY , MIN(SALARY) AS MIN_SALARY , AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE GROUP BY Job_ID



4. LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER.


SELECT COUNT(Employee_ID) AS COUNT , MONTH(HIRE_DATE) AS MONTH FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE) ORDER BY MONTH(HIRE_DATE)



5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING
ORDER BASED ON THE YEAR, MONTH.


SELECT COUNT(*) AS COUNT, MONTH(HIRE_DATE) AS MONTH ,YEAR(HIRE_DATE) AS YEAR FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE) ,YEAR(HIRE_DATE)  ORDER BY MONTH(HIRE_DATE) ,YEAR(HIRE_DATE) ASC



6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.

SELECT DEPARTMENT_ID FROM EMPLOYEE GROUP BY DEPARTMENT_ID HAVING COUNT(DEPARTMENT_ID)>=4

7. HOW MANY EMPLOYEES JOINED IN JANUARY MONTH.

SELECT COUNT(*) AS COUNT, MONTH(HIRE_DATE) AS MONTH FROM EMPLOYEE GROUP BY MONTH(HIRE_DATE) HAVING MONTH(HIRE_DATE)=1

8. HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH.

SELECT COUNT(*) AS COUNT, MONTH(HIRE_DATE) AS MONTH FROM EMPLOYEE GROUP BY MONTH(HIRE_DATE) HAVING MONTH(HIRE_DATE) IN (9,1)

9. HOW MANY EMPLOYEES WERE JOINED IN 1985?

SELECT YEAR(HIRE_DATE) AS YEAR ,COUNT(*) AS COUNT FROM EMPLOYEE GROUP BY YEAR(HIRE_DATE) HAVING YEAR(HIRE_DATE)=1985

10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.

SELECT YEAR(HIRE_DATE) AS YEAR ,MONTH(HIRE_DATE) AS MONTH ,COUNT(*) AS COUNT FROM EMPLOYEE 
GROUP BY YEAR(HIRE_DATE) ,MONTH(HIRE_DATE) HAVING YEAR(HIRE_DATE)=1985

11. HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?

SELECT YEAR(HIRE_DATE) AS YEAR ,MONTH(HIRE_DATE) AS MONTH ,COUNT(*) AS COUNT FROM EMPLOYEE 
GROUP BY YEAR(HIRE_DATE) ,MONTH(HIRE_DATE) HAVING YEAR(HIRE_DATE)=1985 AND MONTH(HIRE_DATE)=3

12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN
APRIL 1985?

SELECT DEPARTMENT_ID FROM EMPLOYEE  
GROUP BY YEAR(HIRE_DATE),MONTH(HIRE_DATE) ,DEPARTMENT_ID HAVING YEAR(HIRE_DATE)=1985 AND MONTH(HIRE_DATE)=4 AND COUNT(*)>=3