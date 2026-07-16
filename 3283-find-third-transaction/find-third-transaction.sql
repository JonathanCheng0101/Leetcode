# Write your MySQL query statement below
# user_id | third_transaction_spend | third_transaction_date 
WITH t AS(
    SELECT *,
            ROW_NUMBER()OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS rn
    FROM Transactions            
)
, a AS(
    SELECT *
FROM t
WHERE rn <= 3
), b AS(
    SELECT *,
       ROW_NUMBER()OVER(PARTITION BY user_id ORDER BY spend DESC) AS rn_spend
    FROM a

)
SELECT user_id, spend AS third_transaction_spend, transaction_date AS third_transaction_date
FROM b
WHERE rn = 3 AND rn_spend = 1
ORDER BY user_id ASC;