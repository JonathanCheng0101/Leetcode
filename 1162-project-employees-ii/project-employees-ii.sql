# Write your MySQL query statement below
SELECT project_id
FROM (
    SELECT project_id,
           DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
    FROM Project
    GROUP BY project_id
    ) t
WHERE rnk = 1;


