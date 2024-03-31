SELECT city, COUNT(*) as totoal_orders
FROM trades t
    INNER JOIN users u on t.user_id = u.user_id
WHERE
    status = 'Completed'
GROUP BY
    city
ORDER BY totoal_orders DESC
LIMIT 3;