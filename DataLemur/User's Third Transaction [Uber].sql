with cte as (
SELECT *, row_number() OVER(PARTITION BY user_id ORDER BY transaction_date) as rn
FROM transactions) SELECT user_id, spend, transaction_date FROM cte WHERE rn=3