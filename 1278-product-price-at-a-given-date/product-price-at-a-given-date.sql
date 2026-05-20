WITH t AS(
    SELECT DISTINCT product_id,
           10 AS price
    FROM Products
),
a AS(
    SELECT product_id,
           new_price,
           ROW_NUMBER()OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT t.product_id,
       IFNULL(a.new_price, t.price) AS price
FROM t
LEFt JOIN a
ON t.product_id = a.product_id AND rn = 1