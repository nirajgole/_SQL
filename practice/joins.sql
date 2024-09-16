-- JOIN/ INNER JOIN are same. INNER is optional in mysql.
SELECT order_id,o.customer_id,last_name
FROM orders as o
JOIN customers c ON o.customer_id = c.customer_id;

-- joining accross databases
SELECT *
FROM sql_store.order_items oi
JOIN sql_inventory.products p ON oi.product_id=p.product_id;

-- self join
USE sql_hr;

SELECT 
	e.employee_id,
    e.first_name,
    m.first_name as manager 
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id;
    
-- joining more than two tables
USE sql_store;

SELECT
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS status
FROM orders o
JOIN customers c
	ON o.customer_id=c.customer_id
JOIN order_statuses os
	ON o.status=os.order_status_id;
    
USE sql_invoicing;
SELECT 
	p.date,
    p.invoice_id,
    p.amount,
    c.name,
    pm.name
FROM payments p
JOIN clients c
	ON p.client_id=c.client_id
JOIN payment_methods pm
	ON p.payment_method=pm.payment_method_id;

-- compound join conditions
USE sql_store;
SELECT oi.order_id
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id=oin.order_Id
    AND oi.product_id=oin.product_id;
    
-- implicit join syntax
SELECT *
FROM orders o, customers c
WHERE o.customer_id=c.customer_id;
    