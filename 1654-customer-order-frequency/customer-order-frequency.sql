# Write your MySQL query statement below
WITH t AS(
    SELECT o.customer_id,
        DATE_FORMAT(o.order_date, "%Y-%m") AS `date`,
        p.price * o.quantity AS amount
    FROM Orders o
    JOIN Product p
    ON o.product_id = p.product_id
), a AS(
    SELECT customer_id,
       `date`,
       SUM(amount) AS amount
FROM t
WHERE `date` = '2020-06' OR `date` = '2020-07'
GROUP BY customer_id, `date`

), b AS(
    SELECT *,
        CASE WHEN (`date` = '2020-06' OR `date` = '2020-07') AND AMOUNT >=100 THEN 1 ELSE 0 END AS chk
FROM a
)
SELECT c.customer_id, c.name
FROM b
JOIN Customers c
ON b.customer_id = c.customer_id
GROUP BY b.customer_id
HAVING SUM(chk) = 2 