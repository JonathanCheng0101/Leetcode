# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        RANK()OVER(PARTITION BY state ORDER BY fraud_score DESC) AS rn,
        CEIL(COUNT(state)OVER(PARTITION BY state) * 0.05) AS cnt
    FROM Fraud
)
SELECT policy_id, state, fraud_score
FROM t
WHERE rn <= cnt
ORDER BY state ASC, fraud_score DESC, policy_id ASC;
