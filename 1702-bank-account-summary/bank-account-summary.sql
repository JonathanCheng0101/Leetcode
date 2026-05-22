# Write your MySQL query statement below
with d AS(
    SELECT paid_by,
       IFNULL(SUM(amount),0) AS deduct
    FROM Transactions
    GROUP BY paid_by
), a AS(
    SELECT paid_to,
       IFNULL(SUM(amount),0) AS adding
    FROM Transactions
    GROUP BY paid_to
)
SELECT u.user_id,
       u.user_name,
       u.credit - IFNULL(d.deduct,0) + IFNULL(a.adding,0) AS credit,
       (CASE WHEN u.credit - IFNULL(d.deduct,0) + IFNULL(a.adding,0) > 0 THEN 'No' ELSE 'Yes' END) AS credit_limit_breached
FROM Users u
LEFT JOIN d
ON d.paid_by = u.user_id
LEFT JOIN a 
ON u.user_id = a.paid_to;
