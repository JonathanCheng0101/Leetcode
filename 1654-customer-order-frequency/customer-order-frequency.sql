# Write your MySQL query statement below
WITH t AS(
    SELECT o.customer_id, o.product_id, DATE_FORMAT(o.order_date, "%Y-%m") AS order_date, o.quantity, p.price
    FROM Orders o
    JOIN Product p
    On p.product_id = o.product_id
), a AS(
    SELECT customer_id, order_date, SUM(quantity * price) AS total_spend
    FROM t
    GROUP BY customer_id, order_date
    HAVING order_date = '2020-06' OR order_date = '2020-07'
), b AS(
    SELECT customer_id, CASE WHEN total_spend >= 100 THEN 1 ELSE 0 END AS chk
    FROM a
), c AS(
    SELECT customer_id
FROM b
GROUP BY customer_id
HAVING SUM(chk)= 2

)
SELECT c.customer_id, cu.name
FROM c
JOIN Customers cu
ON c.customer_id = cu.customer_id;