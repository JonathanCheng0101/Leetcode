# Write your MySQL query statement below
SELECT LEAST(c1.`X`, c1.`Y`) AS 'x', GREATEST(c1.`X`, c1.`Y`) AS 'y'
FROM Coordinates c1
JOIN Coordinates c2
ON c1.`X` = c2.`Y` AND c2.`X` = c1.`Y`
GROUP BY LEAST(c1.`X`, c1.`Y`), GREATEST(c1.`X`, c1.`Y`)
HAVING COUNT(*)>= 2
ORDER BY LEAST(c1.`X`, c1.`Y`) ASC, GREATEST(c1.`X`, c1.`Y`) ASC;