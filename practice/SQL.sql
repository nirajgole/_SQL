-- JOINS
-- AGGREGATE functions
-- RANKS-OVER
-- NESTED SELECTS
-- PARTITIONS
-- CASE-WHEN-THEN-ELSE-END
-- OPERATORS
-- CASTING (::)

SELECT C.customer_id, C.email, COUNT(P.customer_id) as payments_count , CAST(SUM(P.amount) AS FLOAT(10)) as total_amount
FROM payment P JOIN customer C ON C.customer_id = P.customer_id
GROUP BY C.customer_id
ORDER BY total_amount DESC
LIMIT 10

CREATE VIEW EMPSALARY AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY
FROM EMPLOYEES;

SELECT * FROM EMPSALARY;

CREATE OR REPLACE VIEW EMPSALARY  AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

SELECT * FROM EMPSALARY;

DROP VIEW EMPSALARY;

SELECT * FROM PETSALE;

--#SET TERMINATOR @
CREATE PROCEDURE RETRIEVE_ALL       -- Name of this stored procedure routine

LANGUAGE SQL                        -- Language used in this routine
READS SQL DATA                      -- This routine will only read data from the table

DYNAMIC RESULT SETS 1               -- Maximum possible number of result-sets to be returned to the caller query

BEGIN

    DECLARE C1 CURSOR               -- CURSOR C1 will handle the result-set by retrieving records row by row from the table
    WITH RETURN FOR                 -- This routine will return retrieved records as a result-set to the caller query

    SELECT * FROM PETSALE;          -- Query to retrieve all the records from the table

    OPEN C1;                        -- Keeping the CURSOR C1 open so that result-set can be returned to the caller query

END
@                                   -- Routine termination character

CALL RETRIEVE_ALL      -- Caller query

DROP PROCEDURE RETRIEVE_ALL
CALL RETRIEVE_ALL

--#SET TERMINATOR @
CREATE PROCEDURE UPDATE_SALEPRICE (
    IN Animal_ID INTEGER, IN Animal_Health VARCHAR(5) )     -- ( { IN/OUT type } { parameter-name } { data-type }, ... )

LANGUAGE SQL                                                -- Language used in this routine
MODIFIES SQL DATA                                           -- This routine will only write/modify data in the table

BEGIN

    IF Animal_Health = 'BAD' THEN                           -- Start of conditional statement
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.25)
        WHERE ID = Animal_ID;

    ELSEIF Animal_Health = 'WORSE' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.5)
        WHERE ID = Animal_ID;

    ELSE
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE
        WHERE ID = Animal_ID;

    END IF;                                                 -- End of conditional statement

END
@                                                           -- Routine termination character

CALL RETRIEVE_ALL

CALL UPDATE_SALEPRICE(1, 'BAD')       -- Caller query

CALL RETRIEVE_ALL

DROP PROCEDURE UPDATE_SALEPRICE;


select E.F_NAME,E.L_NAME, JH.START_DATE
from EMPLOYEES as E
INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID
where E.DEP_ID ='5';

select e.f_name, e.l_name, j.job_title
from employees e
left join jobs j on e.job_id = j.JOB_IDENT
where DEP_ID=5;

--select E.F_NAME,E.L_NAME, JH.START_DATE, J.JOB_TITLE
--from EMPLOYEES as E
--INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID
--INNER JOIN JOBS as J on E.JOB_ID=J.JOB_IDENT
--where E.DEP_ID ='5';

select e.EMP_ID, e.L_NAME, e.DEP_ID, d.DEP_NAME
from employees e
left outer join departments as d on e.dep_id = d.DEPT_ID_DEP
where year(e.B_DATE) < 1980;

select e.EMP_ID, e.L_NAME, e.DEP_ID, d.DEP_NAME
from employees e
left outer join departments as d on e.dep_id = d.DEPT_ID_DEP
and year(e.B_DATE) < 1980;

select E.F_NAME,E.L_NAME,D.DEP_NAME
from EMPLOYEES AS E
FULL OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP;

select E.F_NAME,E.L_NAME,D.DEPT_ID_DEP, D.DEP_NAME
from EMPLOYEES AS E
FULL OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M';


SELECT
  RANK() OVER (ORDER BY SUM(points) DESC) AS rank,
  COALESCE(NULLIF(clan,''), '[no clan specified]') AS clan,
  SUM(points) AS total_points,
  COUNT(name) AS total_people
FROM people
GROUP BY clan;