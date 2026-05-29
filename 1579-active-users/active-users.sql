WITH t AS(
    SELECT DISTINCT login_date,
        id
FROM Logins
), b AS(
    SELECT login_date,
           id,
           ROW_NUMBER()OVER(PARTITION BY id ORDER BY login_date ASC) AS rn
    FROM t
)
SELECT DISTINCT b.id,
    a.name
FROM b
JOIN Accounts a
ON b.id = a.id
GROUP BY b.id, DATE_SUB(b.login_date, INTERVAL b.rn - 1 day)
HAVING COUNT(b.id) >= 5
ORDER BY b.id ASC;




