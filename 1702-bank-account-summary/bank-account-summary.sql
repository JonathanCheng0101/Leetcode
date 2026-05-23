# Write your MySQL query statement below
WITH deduct AS(
    SELECT paid_by,
           SUM(amount) AS amount
    FROM Transactions
    GROUP BY paid_by
), adding AS(
    SELECT paid_to,
           SUM(amount) AS amount
    FROM Transactions
    GROUP BY paid_to
)
SELECT u.user_id,
       u.user_name,
       u.credit - IFNULL(d.amount, 0) + IFNULL(a.amount, 0) AS credit,
       CASE WHEN (u.credit - IFNULL(d.amount, 0) + IFNULL(a.amount, 0)) > 0 THEN "No" ELSE "Yes" END AS credit_limit_breached
FROM Users u
LEFT JOIN deduct d
ON u.user_id = d.paid_by
LEFT JOIN adding a
ON u.user_id = a.paid_to
