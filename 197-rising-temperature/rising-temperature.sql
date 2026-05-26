WITH t AS(
    SELECT CASE WHEN TIMESTAMPDIFF(day,LAG(recordDate) OVER (ORDER BY recordDate ASC),recordDate) = 1 AND  temperature - LAG(temperature) OVER(ORDER BY recordDate ASC)> 0 THEN id
END AS id
FROM Weather
)
SELECT id
FROM t
WHERE id IS NOT NULL;
