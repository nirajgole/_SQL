-- unique queries
-- number of employee
-- third quarter of 2023

with unique_queries as (
SELECT 
  employee_id,
  count(DISTINCT query_id) as unique_queries_count
FROM queries
WHERE query_starttime >= '2023-07-01T00:00:00Z'
  AND query_starttime < '2023-10-01T00:00:00Z'
GROUP BY employee_id
)

SELECT COALESCE(u.unique_queries_count,0) as unique_queries,
count(e.employee_id) as employee_count
FROM employees e
LEFT JOIN unique_queries u ON e.employee_id = u.employee_id
GROUP BY unique_queries
ORDER BY unique_queries
;
