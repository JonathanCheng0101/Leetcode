# Write your MySQL query statement below
WITH t AS(
    SELECT *,
            DAYOFWEEK(purchase_date) AS day_num
    FROM Purchases
), a AS(
    SELECT purchase_date, SUM(amount_spend) AS total_amount
    FROM t
    WHERE day_num = 6
    GROUP BY purchase_date
)
SELECT CASE WHEN purchase_date = '2023-11-03' THEN 1
            WHEN purchase_date = '2023-11-10' THEN 2
            WHEN purchase_date = '2023-11-17' THEN 3
            WHEN purchase_date = '2023-11-24' THEN 4
            END AS week_of_month,
       purchase_date,
       total_amount
FROM a
ORDER BY week_of_month ASC;