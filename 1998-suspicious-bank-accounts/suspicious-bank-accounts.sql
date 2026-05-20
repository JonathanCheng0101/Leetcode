# Write your MySQL query statement below
WITH t AS(
    SELECT t.account_id,
       DATE_FORMAT(t.`day`, "%Y-%m")AS `month`,
       CASE WHEN SUM(t.amount) > (a.max_income) THEN 1 ELSE 0 END AS over_limit
    FROM Transactions t
    JOIN Accounts a
    ON t.account_id = a.account_id
    WHERE t.type = 'Creditor'
    GROUP BY t.account_id, DATE_FORMAT(t.`day`, "%Y-%m")
), a AS(
    SELECT account_id,
       CASE WHEN TIMESTAMPDIFF(month,LAG(CONCAT(`month`,"-01"))OVER(PARTITION BY account_id ORDER BY `month` ASC),CONCAT(`month`,"-01")) = 1 THEN 1 ELSE 0 END AS continuous_month 
    FROM t
    WHERE over_limit = 1
)
SELECT DISTINCT account_id
FROM a
WHERE continuous_month = 1;


