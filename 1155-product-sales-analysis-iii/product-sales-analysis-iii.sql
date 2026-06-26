WITH t AS(
    SELECT *,
           MIN(`year`)OVER(PARTITION BY product_id) AS min_yr
    FROM Sales
)
SELECT product_id, `year` AS first_year, quantity, price
FROM t
WHERE min_yr = `year`;