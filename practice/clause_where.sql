SELECT *
FROM customers
WHERE points > 3000;

-- comparison operators <,>,<=,>=,!=,<> 
SELECT first_name,state
FROM customers
WHERE state <> 'va';

SELECT first_name
FROM customers
WHERE 'birth_date' > '1990-01-01';

SELECT *
FROM orders
WHERE order_date = (SELECT max(order_date) FROM orders);

SELECT *
FROM order_items
WHERE order_id=6 AND (unit_price*quantity)>30;

SELECT *
FROM customers
WHERE state IN('VA','FL','GA');

SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72);

SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-1-1' AND '2000-1-1';

SELECT *
FROM customers
WHERE (address LIKE '%trail%' OR address LIKE '%avenue%') OR (phone LIKE '%9');

-- first names with ELKA and AMBUR
SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR';

-- last name ends wtih EY or ON
SELECT *
FROM customers
WHERE last_name REGEXP 'EY|ON$';

-- last names start with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP '^MY|SE';

-- last names contain B followed by R and U
SELECT *
FROM customers
WHERE last_name REGEXP 'B[RU]';

SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- get the orders that are not shipped
SELECT *
FROM orders
WHERE shipped_date IS NULL;
