# Write your MySQL query statement below
WITH t AS(
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
), a AS(
    SELECT *,
           SUM(amount)OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount1
    FROM t
)
SELECT visited_on,
       ROUND(amount1, 2) AS amount,
       ROUND(amount1/ 7 , 2)AS average_amount
FROM a
WHERE visited_on >= (
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
    FROM Customer
)

ORDER BY visited_on ASC