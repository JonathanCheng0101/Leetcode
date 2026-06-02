SELECT DISTINCT p.product_id,
       p.product_name
FROM Product p
JOIN Sales s
ON s.product_id = p.product_id
WHERE NOT EXISTS(
    SELECT 1
    FROM Sales s
    WHERE s.product_id = p.product_id AND
          (('2019-01-01'> s.sale_date) OR ('2019-03-31'< s.sale_date))
)  AND s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'