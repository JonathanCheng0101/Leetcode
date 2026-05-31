WITH template AS(
    SELECT 'Low Salary' AS category
    UNION all
    SELECT 'High Salary'
    UNION all
    SELECT 'Average Salary'
), t AS(
    SELECT *,
       CASE WHEN income < 20000 THEN 1 ELSE 0 END AS Low_Salary,
       CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END AS Average_Salary,
       CASE WHEN income > 50000 THEN 1 ELSE 0 END AS High_Salary
    FROM Accounts
), a AS(
    SELECT SUM(Low_Salary) AS `Low Salary`,
       SUM(Average_Salary) AS `Average Salary`,
       SUM(High_Salary) AS `High Salary`
    FROM t
)
SELECT 'Low Salary' AS category,
       `Low Salary` AS accounts_count
FROM a

UNION ALL

SELECT 'Average Salary',
        `Average Salary`
FROM a

UNION ALL

SELECT 'High Salary',
       `High Salary`
FROM a
