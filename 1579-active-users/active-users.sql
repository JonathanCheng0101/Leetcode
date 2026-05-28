# Write your MySQL query statement below
WITH t AS(
    SELECT *
    FROM Logins
    GROUP BY id, login_date
), a AS(
    SELECT *,
       ROW_NUMBER() OVER (PARTITION BY id ORDER BY login_date ASC) AS rn
    FROM t
), b AS(
    SELECT *,
       DATE_SUB(login_date, INTERVAL rn day) AS base_date
    FROM a
)
SELECT DISTINCT b.id,
       acc.name
FROM b
JOIN Accounts acc
ON b.id = acc.id
GROUP BY id, base_date
HAVING COUNT(*) >= 5
ORDER BY b.id ASC;


