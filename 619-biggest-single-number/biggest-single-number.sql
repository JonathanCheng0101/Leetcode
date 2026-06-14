WITH t AS(
    SELECT num AS num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
)
SELECT max(num) AS num
FROM t