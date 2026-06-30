# Write your MySQL query statement below
# user_id, user_name, credit, credit_limit_breached

WITH deduct AS(
    SELECT paid_by AS user_id,
       SUM(amount) AS amount
    FROM Transactions
    GROUP BY paid_by
), ad AS(
    SELECT paid_to AS user_id,
       SUM(amount) AS amount
    FROM Transactions
    GROUP BY paid_to
)
SELECT u.user_id,
       u.user_name,
      (u.credit - IFNULL(deduct.amount, 0) + IFNULL(ad.amount, 0)) AS credit,
      CASE WHEN (u.credit - IFNULL(deduct.amount, 0) + IFNULL(ad.amount, 0)) < 0 THEN 'Yes' ELSE 'No' END AS credit_limit_breached
FROM Users u
LEFT JOIN deduct
ON u.user_id = deduct.user_id
LEFT JOIN ad
ON u.user_id = ad.user_id