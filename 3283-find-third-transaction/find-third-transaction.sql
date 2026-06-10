# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        COUNT(user_id) OVER(PARTITION BY user_id) AS cnt,
        ROW_NUMBER()OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS rn        
    FROM Transactions
), a AS(
    SELECT *
    FROM t
    WHERE cnt >= 3 AND rn <=3
), b AS(SELECT *,
           LAG(spend)OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS prev_spend
    FROM a
)
, c AS(
    SELECT *,
       LAG(prev_spend)OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS prev2_spend
FROM b
) 
SELECT user_id,
       spend AS third_transaction_spend,
       transaction_date AS third_transaction_date
FROM c
WHERE rn = 3 AND spend > prev_spend AND spend > prev2_spend
ORDER BY user_id ASC;
