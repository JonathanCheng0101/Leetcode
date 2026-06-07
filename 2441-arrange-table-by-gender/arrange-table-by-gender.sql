# Write your MySQL query statement below
WITH t AS(
    SELECT *,
            CASE WHEN gender = 'female' THEN 1
                WHEN gender = 'other' THEN 2
                WHEN gender = 'male' THEN 3 END AS gender_chk,
            ROW_NUMBER()OVER(PARTITION BY gender ORDER BY user_id ASC) AS rn
    FROM Genders
)
SELECT user_id,
       gender
FROM t
ORDER BY rn ASC, gender_chk ASC;
