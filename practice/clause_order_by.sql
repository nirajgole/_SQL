SELECT *
FROM customers
ORDER BY first_name DESC, state DESC;

SELECT first_name, last_name, 10 AS points
FROM customers
ORDER BY points, first_name;

SELECT *, quantity*unit_price AS total_price
FROM order_items
WHERE order_id=2
ORDER BY total_price DESC;

-- LIMIT offset(pagination), no. of records
SELECT *
FROM customers
LIMIT 6,3;

-- get the top 3 loyal customers
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;