# Write your MySQL query statement below
SELECT DISTINCT l1.account_id
FROM LogInfo l1
JOIN LogInfo l2
ON l1.account_id = l2.account_id
WHERE l1.ip_address != l2.ip_address
      AND
      l1.login > l2.login # l1比較晚開始
      AND 
      TIMESTAMPDIFF(SECOND, l1.login , l2.logout) >= 0