USE SQL_PRACTICE;

SELECT *
FROM EmployeeDetails;
SELECT *
FROM Client;
SELECT *
FROM Department;


-- 1
SELECT *
FROM EmployeeDetails
WHERE DATENAME(MM, DOB) = 'March';


-- SELECT DATENAME(MM,GETDATE())

-- 2
SELECT DATEDIFF(MONTH, DOJ, GETDATE()) AS EXPERIENCE
FROM EmployeeDetails;

-- 3
SELECT CONCAT(SUBSTRING(firstname, 1, 3), SUBSTRING(lastname, 1, 3)) AS SHORT_NAME
FROM EmployeeDetails;

-- 4
SELECT CONCAT(UPPER(SUBSTRING(firstname, 1, 1)), LOWER(SUBSTRING(firstname, 2, LEN(firstname)))) AS UPPER_NAME
FROM EmployeeDetails;

--5 
SELECT DATENAME(WEEKDAY, DOB) AS Birth_Day,
       DATENAME(MM, DOB) AS Birth_Month,
       DATENAME(WEEKDAY, DOJ) AS Join_Day,
       DATENAME(MM, DOB) AS Join_Month
FROM EmployeeDetails;

-- 6
SELECT d.DepartmentName,
       COUNT(*) AS EmployeeCount
FROM EmployeeDetails e
    JOIN Department d
        ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 7
SELECT TOP (1)
       MAX(e.Salary) AS MAX_SAL,
       d.DepartmentName
FROM EmployeeDetails e
    JOIN Department d
        ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY MAX_SAL DESC;

SELECT d.DepartmentName AS MAX_SAL_DEPT
FROM Department d
WHERE d.DepartmentID =
(
    SELECT e.DepartmentID
    FROM EmployeeDetails e
    WHERE e.Salary =
    (
        SELECT MAX(Salary)FROM EmployeeDetails
    )
);


-- when to use subqueries or joins
-- in this case we only want department name, so can this be acheive using joins

-- 8
SELECT c.ClientName,
       AVG(e.Salary) AS AvgSalary
FROM EmployeeDetails e
    JOIN Client c
        ON e.ClientID = c.ClientID
GROUP BY c.ClientName

-- 9
SELECT MAX(e.Salary) MAX_SAL,
       d.DepartmentName
FROM EmployeeDetails e
    JOIN Department d
        ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName