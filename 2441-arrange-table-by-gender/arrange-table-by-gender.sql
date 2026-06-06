# Write your MySQL query statement below
WITH t AS(
    SELECT user_id,
       gender,
       ROW_NUMBER() OVER(PARTITION BY gender ORDER BY user_id) AS rn
    FROM Genders
)
SELECT user_id,
       gender
FROM t
ORDER BY rn ASC, gender 

