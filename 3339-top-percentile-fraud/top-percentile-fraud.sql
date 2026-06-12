# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        RANK()OVER(PARTITION BY state ORDER BY fraud_score DESC) AS rn,
        COUNT(fraud_score)OVER(PARTITION BY state) AS cnt
    FROM Fraud
)
SELECT policy_id, state, fraud_score
FROM t
WHERE rn <= CEIL(cnt * 0.05)
ORDER BY state ASC, fraud_score DESC, policy_id ASC;