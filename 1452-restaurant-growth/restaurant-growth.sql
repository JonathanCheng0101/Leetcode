# Write your MySQL query statement below
WITH t AS(
    SELECT visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
), b AS(
    SELECT visited_on,
       SUM(amount)OVER(ORDER BY visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
       ROUND(SUM(amount)OVER(ORDER BY visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)/ 7, 2) AS average_amount
    FROM t
)
SELECT *
FROM b
WHERE visited_on >= DATE_ADD((SELECT MIN(visited_on) FROM Customer), INTERVAL 6 DAY)
