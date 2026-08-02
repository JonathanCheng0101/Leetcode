WITH t AS(
    SELECT *,
        COUNT(policy_id) OVER(PARTITION BY state) AS total_number,
        RANK()OVER(PARTITION BY state ORDER BY fraud_score DESC) AS rn
    FROM Fraud
)
SELECT policy_id,
       state,
       fraud_score
FROM t
WHERE rn <= CEIL(total_number * 0.05)
ORDER BY state ASC, fraud_score DESC, policy_id ASC;
