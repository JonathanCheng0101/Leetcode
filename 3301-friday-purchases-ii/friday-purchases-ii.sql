# Write your MySQL query statement below
WITH t AS(
    SELECT purchase_date, SUM(amount_spend) AS amount
    FROM Purchases
    WHERE DAYOFWEEK(purchase_date) = 6 AND DATE_FORMAT(purchase_date, "%Y-%m") = '2023-11'
    GROUP BY purchase_date
),
a AS(
    SELECT '2023-11-03' AS purchase_date,
          1 AS week_of_month
UNION ALL
SELECT '2023-11-10' ,
          2
UNION ALL
SELECT '2023-11-17' ,
          3
UNION ALL
SELECT '2023-11-24' ,
          4 
)

SELECT a.week_of_month, a.purchase_date, IFNULL(t.amount, 0) AS total_amount
FROM a
LEFT JOIN t
ON a.purchase_date = t.purchase_date