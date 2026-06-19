# Write your MySQL query statement below
WITH t AS(
    SELECT e.employee_id, e.name , p.review_id, p.review_date, p.rating
    FROM employees e
    JOIN performance_reviews p
    ON e.employee_id = p.employee_id
), a AS(
    SELECT *,
       COUNT(*) OVER(PARTITION BY employee_id) AS cnt,
       ROW_NUMBER()OVER(PARTITION BY employee_id ORDER BY review_date DESC) AS rn
    FROM t
), b AS(
    SELECT employee_id,
           name,
           rating,
           rn,
           CASE WHEN LEAD(rating)OVER(PARTITION BY employee_id ORDER BY rn ASC) < rating THEN 1 ELSE 0 END AS chk, 
           CASE WHEN rn = 1 THEN rating 
                WHEN rn = 3 THEN -rating
                ELSE 0 END AS improvement_score
FROM a
WHERE cnt >= 3 AND rn <= 3
)
SELECT employee_id, name, SUM(improvement_score) AS improvement_score
FROM b
GROUP BY employee_id, name
HAVING COUNT(employee_id) = SUM(chk)+ 1
ORDER BY SUM(improvement_score) DESC, name ASC;
