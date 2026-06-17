# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        ROW_NUMBER()OVER()AS rn,
        CASE WHEN drink IS NULL THEN 1 ELSE 0 END AS null_chk
    FROM Coffeeshop
), a AS(
    SELECT *,
       SUM(null_chk)OVER(ORDER BY rn) AS null_sum
FROM t
), b AS(
    SELECT id, rn, drink, rn - null_sum AS grp
    FROM a
)
SELECT id, MAX(drink) OVER(PARTITION BY grp) AS drink
FROM b
ORDER BY rn ASC