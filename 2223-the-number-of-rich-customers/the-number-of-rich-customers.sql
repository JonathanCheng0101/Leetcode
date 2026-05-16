WITH t AS(
    SELECT DISTINCT customer_id
    FROM Store
    WHERE amount > 500 
)
SELECT COUNT(customer_id) AS rich_count
FROM t;