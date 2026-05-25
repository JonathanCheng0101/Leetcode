# Write your MySQL query statement below
WITH t AS(
    SELECT activity,
           COUNT(id) AS cnt
    FROM Friends
    GROUP BY activity
),b AS(
    SELECT activity,
        IFNULL(t.cnt, 0) AS total_cnt
    FROM Activities a
    LEFT JOIN t
    ON a.name = t.activity
)
SELECT activity
FROM b
WHERE total_cnt NOT IN(SELECT MIN(total_cnt)FROM b) 
      AND 
      total_cnt NOT IN(SELECT MAX(total_cnt)FROM b)






