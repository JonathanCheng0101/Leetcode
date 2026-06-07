# Write your MySQL query statement below
WITH t AS(
    SELECT s.user_id,
        s.product_id,
        SUM(s.quantity * p.price) AS amount
    FROM Sales s
    JOIN Product p
    ON s.product_id = p.product_id
    GROUP BY s.user_id, s.product_id
)
, a AS(
    SELECT user_id,
       product_id,
       RANK()OVER(PARTITION BY user_id ORDER BY amount DESC) AS rn
FROM t
)
SELECT user_id,
       product_id
FROM a
WHERE rn = 1;