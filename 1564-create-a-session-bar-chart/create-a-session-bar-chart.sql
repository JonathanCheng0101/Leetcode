# Write your MySQL query statement below
WITH original AS(
  SELECT '[0-5>' AS bin
          UNION ALL
          SELECT"[5-10>"
          UNION ALL
          SELECT "[10-15>"
          UNION ALL
          SELECT "15 or more"
    ),
t AS(
  SELECT CASE WHEN duration < 300 THEN '[0-5>' 
               WHEN duration BETWEEN 300 AND 599 THEN "[5-10>" 
               WHEN duration BETWEEN 600 AND 899 THEN "[10-15>" 
               WHEN duration  >= 900 THEN "15 or more"  END AS bin
  FROM Sessions
)
SELECT o.bin,
       IFNULL(COUNT(t.bin),0) AS total
FROM original o
LEFT JOIN t
ON o.bin = t.bin
GROUP BY o.bin;