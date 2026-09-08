WITH t AS(
    SELECT employee_id,
        rating,
        COUNT(*) OVER(PARTITION BY employee_id) AS cnt,
        ROW_NUMBER()OVER(PARTITION BY employee_id ORDER BY review_date DESC) AS rn
    FROM performance_reviews 
), a AS(
    SELECT employee_id,
        rating,
        cnt,
        rn,
        LEAD(rating) OVER(PARTITION BY employee_id ORDER BY rn ASC) AS prev_rating,
        LEAD(rating, 2) OVER(PARTITION BY employee_id ORDER BY rn ASC) AS prev_2_rating
    FROM t
    WHERE cnt >= 3
), b AS(
    SELECT employee_id, rating - prev_2_rating AS improvement_score
    FROM a
    WHERE rn = 1 AND rating - prev_2_rating > 0  AND prev_rating - prev_2_rating > 0
)
SELECT b.employee_id, e.name, b.improvement_score
FROM b
JOIN employees e
ON b.employee_id = e.employee_id
ORDER BY b.improvement_score DESC, e.name ASC;

