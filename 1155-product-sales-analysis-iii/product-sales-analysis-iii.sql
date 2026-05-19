WITH t AS(
    SELECT *, 
       MIN(`year`) OVER(PARTITION BY product_id ORDER BY `year` ASC) AS first_year
    FROM Sales
)
SELECT product_id,
       first_year,
       quantity,
       price
FROM t
WHERE `year` = first_year ;
