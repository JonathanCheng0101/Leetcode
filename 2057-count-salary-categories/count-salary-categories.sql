WITH t AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary' AS category
    UNION ALL
    SELECT 'High Salary' AS category
)
, a AS(
    SELECT *,
       CASE WHEN income < 20000 THEN 'Low Salary'
            WHEN income > 50000 THEN 'High Salary'
            ELSE 'Average Salary' END AS status
    FROM Accounts
), b AS(
    SELECT status, COUNT(status) AS accounts_count
    FROM a
    GROUP BY status
)
SELECT t.category,
       IFNULL(b.accounts_count, 0) AS accounts_count
FROM t
LEFT JOIN b
ON t.category = b.status;