# Write your MySQL query statement below
WITH t AS(
    SELECT visited_on,
           SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
), a AS(
    SELECT *,
           SUM(amount)OVER(ORDER BY visited_on ASC) AS accum_amount
    FROM t
)
SELECT a2.visited_on,
       IFNULL((a2.accum_amount - LAG(a1.accum_amount)OVER(ORDER BY a1.visited_on)),a2.accum_amount)  AS amount,
       ROUND(IFNULL((a2.accum_amount - LAG(a1.accum_amount)OVER(ORDER BY a1.visited_on))/7,a2.accum_amount/7), 2) AS average_amount
FROM a a1
JOIN a a2
ON DATEDIFF(a2.visited_on, a1.visited_on) = 6
ORDER BY a1.visited_on ASC;

