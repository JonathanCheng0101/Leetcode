WITH non_dup AS(
SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(*) = 1)

SELECT MAX(num) AS num
FROM non_dup;
