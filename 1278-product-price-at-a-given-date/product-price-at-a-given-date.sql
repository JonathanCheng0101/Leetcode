WITH t AS(
    SELECT DISTINCT product_id, 10 AS price
    FROM Products
), a AS(
    SELECT product_id, new_price, ROW_NUMBER()OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
), b AS(
    SELECT product_id, new_price
    FROM a
    WHERE rn = 1
)
SELECT t.product_id, IFNULL(b.new_price, t.price) AS price
FROM t 
LEFT JOIN b
ON t.product_id = b.product_id