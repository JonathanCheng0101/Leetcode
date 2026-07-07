# | sale_date  | diff         |
WITH t AS(
    SELECT sale_date,
        CASE WHEN fruit = 'apples' THEN sold_num END AS 'apples',
        CASE WHEN fruit = 'oranges' THEN sold_num END AS 'oranges'
    FROM Sales
), a AS(
    SELECT sale_date, MAX(apples) AS apples, MAX(oranges) AS oranges
    FROM t
    GROUP BY sale_date
)
SELECT sale_date,
       (apples - oranges) AS diff
FROM a
ORDER BY sale_date ASC;

