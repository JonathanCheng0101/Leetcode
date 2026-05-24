# Write your MySQL query statement below
WITH c AS(
    SELECT DATE_FORMAT(c.trans_date, "%Y-%m") AS `month`,
       t.country,
       COUNT(*) AS chargeback_count,
       SUM(t.amount) AS chargeback_amount
       
    FROM Chargebacks c
    JOIN Transactions t
    ON c.trans_id = t.id
    GROUP BY `month`, t.country
), t AS(
    SELECT DATE_FORMAT(trans_date, "%Y-%m") AS `month`,
       country,
       COUNT(*) AS approved_count,
       SUM(amount) AS approved_amount  
    FROM Transactions
    WHERE state = 'approved'
    GROUP BY `month`, country
),tp AS(
    SELECT `month`, country 
    FROM t

    UNION 

    SELECT `month`, country 
    FROM c
)
SELECT tp.`month`,
        tp.country,
        IFNULL(t.approved_count, 0) AS approved_count,
        IFNULL(t.approved_amount, 0) AS approved_amount,
        IFNULL(c.chargeback_count, 0)AS chargeback_count,
        IFNULL(c.chargeback_amount, 0) AS chargeback_amount
FROM tp
LEFT JOIN t
ON t.`month` = tp.`month` AND t.country = tp.country
LEFT JOIN c
ON c.`month` = tp.`month`  AND c.country = tp.country


