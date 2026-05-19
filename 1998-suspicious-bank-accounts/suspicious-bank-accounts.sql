# Write your MySQL query statement below
WITH t AS(
    SELECT t.account_id,
            DATE_FORMAT(t.`day`, "%Y-%m") AS `month`,
          (CASE WHEN SUM(t.amount)> a.max_income THEN 1 ELSE 0 END) AS sus
    FROM Transactions t
    JOIN Accounts a
    ON t.account_id = a.account_id
    WHERE t.type = "Creditor"
    GROUP BY t.account_id, `month`
),
t2 AS (
    SELECT 
        account_id,
        `month`,
        CASE 
            WHEN (
                LAG(sus) OVER(PARTITION BY account_id ORDER BY `month`) + sus = 2
                AND TIMESTAMPDIFF(
                    MONTH,
                    STR_TO_DATE(CONCAT(LAG(`month`) OVER(PARTITION BY account_id ORDER BY `month`), '-01'), '%Y-%m-%d'),
                    STR_TO_DATE(CONCAT(`month`, '-01'), '%Y-%m-%d')
                ) = 1
            )
            THEN 1
        END AS prev_month_sus
    FROM t
)
SELECT DISTINCT account_id
FROM t2
WHERE prev_month_sus = 1;