
WITH t AS(
    SELECT account_id,
        income,
        CASE WHEN income < 20000 THEN 'Low Salary'
                WHEN income > 50000 THEN 'High Salary'
                ELSE 'Average Salary' END AS category
    FROM Accounts
), a AS(
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary' AS category
    UNION ALL
    SELECT 'High Salary' AS category

)
SELECT a.category, IFNULL(COUNT(t.category), 0) AS accounts_count
FROM a
LEFT JOIN t
ON a.category = t.category
GROUP BY t.category
