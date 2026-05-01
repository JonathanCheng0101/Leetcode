# Write your MySQL query statement below
SELECT (CASE WHEN ny.excellent_count > ca.excellent_count THEN 'New York University' 
            WHEN ny.excellent_count < ca.excellent_count THEN 'California University'
            ELSE 'No Winner' END) AS winner
FROM (
    SELECT COUNT(*) AS excellent_count
    FROM NewYork
    WHERE score >= 90
) ny
CROSS JOIN (
    SELECT COUNT(*) AS excellent_count
    FROM California 
    WHERE score >= 90
) ca;


