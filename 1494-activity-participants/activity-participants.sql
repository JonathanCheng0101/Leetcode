WITH t AS(
    SELECT activity,
           COUNT(*) AS cnt
    FROM Friends
    GROUP BY activity
)
SELECT a.name AS activity
FROM Activities a
LEFT JOIN t
ON t.activity = a.name
WHERE cnt NOT IN(SELECT MAX(cnt) FROM t) AND cnt NOT IN (SELECT MIN(cnt) FROM t)
