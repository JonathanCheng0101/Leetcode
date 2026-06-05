# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        ROW_NUMBER()OVER(ORDER BY first_col ASC) AS first_rn
    FROM Data
    ORDER BY first_rn
), a AS(
    SELECT *,
        ROW_NUMBER()OVER(ORDER BY second_col DESC) AS second_rn
    FROM Data
    ORDER BY second_rn

)
SELECT t.first_col,a.second_col
FROM t
JOIN a
ON t.first_rn = a.second_rn