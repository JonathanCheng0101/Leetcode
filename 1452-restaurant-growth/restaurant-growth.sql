# Write your MySQL query statement below
WITH t AS(
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
), a AS(
    SELECT visited_on,
       SUM(amount)OVER(ORDER BY visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
       ROUND(SUM(amount)OVER(ORDER BY visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)/ 7, 2) AS average_amount
FROM t

)
SELECT *
FROM a
WHERE visited_on >= (SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY) FROM Customer) 