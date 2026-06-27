# month   | country | approved_count | approved_amount | chargeback_count | chargeback_amount 
-- create cross table
WITH c AS(
        SELECT DATE_FORMAT(trans_date, "%Y-%m") AS `month`,
       country, 
       SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_amount
FROM Transactions
WHERE state = 'approved'
GROUP BY country, DATE_FORMAT(trans_date, "%Y-%m")
),
 d AS(
    SELECT DATE_FORMAT(c.trans_date, "%Y-%m") AS `month`,
         t.country,
       COUNT(t.amount) AS chargeback_count,
       SUM(t.amount) AS chargeback_amount
FROM Chargebacks c
JOIN Transactions t
ON c.trans_id = t.id
GROUP BY t.country, DATE_FORMAT(c.trans_date, "%Y-%m")
), a AS(
    SELECT `month`, country
FROM c
UNION 
SELECT `month`, country
FROM d
), e AS(
SELECT a.`month`, a.country, IFNULL(c.approved_count, 0) AS approved_count, IFNULL(c.approved_amount, 0) AS approved_amount, IFNULL(d.chargeback_count, 0) AS chargeback_count, IFNULL(d.chargeback_amount, 0) AS chargeback_amount
FROM a
LEFT JOIN c
ON (a.`month` = c.`month`) AND  (a.country = c.country)
LEFT JOIN d
ON (a.`month` = d.`month`) AND  (a.country = d.country)
)

SELECT *
FROM e
WHERE approved_count IS NOT NULL AND chargeback_amount IS NOT NULL
