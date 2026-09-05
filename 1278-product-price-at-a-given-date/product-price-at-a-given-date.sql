WITH t AS(
    SELECT *,
        ROW_NUMBER()OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16' 
), a AS(
    SELECT product_id, new_price
FROM t
WHERE rn = 1

)

SELECT DISTINCT p.product_id, IFNULL(a.new_price, 10) AS price
FROM Products p
LEFT JOIN a
ON p.product_id = a.product_id;