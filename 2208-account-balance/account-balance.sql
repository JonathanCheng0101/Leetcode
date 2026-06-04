# Write your MySQL query statement below
WITH t AS(
    SELECT account_id,
       `day`,
       type,
       CASE WHEN type = 'Deposit' THEN amount ELSE -amount END AS amount
    FROM Transactions
)
SELECT account_id,
       `day`,
        SUM(amount)OVER(PARTITION BY account_id ORDER BY `day`) AS balance
FROM t
ORDER BY account_id ASC, `day` ASC;
