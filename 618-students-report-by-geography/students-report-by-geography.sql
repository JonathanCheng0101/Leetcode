# Write your MySQL query statement below
WITH t AS(
    SELECT *,
           ROW_NUMBER()OVER(PARTITION BY continent ORDER BY name ASC) AS rn
    FROM Student
)
SELECT MAX(CASE WHEN continent = "America" THEN name END) AS America,
        MAX(CASE WHEN continent = "Asia" THEN name END) AS Asia,
       MAX(CASE WHEN continent = "Europe" THEN name END) AS Europe       
FROM t
GROUP BY rn

