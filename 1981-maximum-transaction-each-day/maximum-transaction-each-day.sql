# Write your MySQL query statement below
WITH t AS(
    SELECT *,
       DENSE_RANK() OVER(PARTITION BY DATE_FORMAT(day, "%Y-%m-%d") ORDER BY amount DESC) AS rn
    FROM Transactions
)
SELECT transaction_id
FROM t
WHERE rn = 1
ORDER BY transaction_id ASC;
