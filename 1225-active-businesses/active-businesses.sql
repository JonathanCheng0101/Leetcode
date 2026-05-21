WITH t AS(
    SELECT *,
           AVG(occurrences)OVER(PARTITION BY event_type) AS avg_occ
    FROM Events
),
 a AS(
    SELECT *,
           CASE WHEN occurrences > avg_occ THEN 1 ELSE 0 END AS cnt 
    FROM t 
)

SELECT business_id
FROM a
GROUP BY business_id
HAVING SUM(cnt) > 1 AND (COUNT(DISTINCT event_type) = COUNT(cnt));