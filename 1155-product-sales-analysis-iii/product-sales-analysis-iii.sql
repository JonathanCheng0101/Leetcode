WITH t AS(
    SELECT *,
        RANK()OVER(PARTITION BY product_id ORDER BY `year` ASC) AS rn
    FROM Sales
)
SELECT product_id,
       `year` AS first_year,
       SUM(quantity) AS quantity,
       price
FROM t
WHERE rn = 1
GROUP BY product_id, `year`, price