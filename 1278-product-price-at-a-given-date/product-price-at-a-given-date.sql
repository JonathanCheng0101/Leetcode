WITH t AS(
    SELECT product_id, 10 AS price
    FROM Products
    GROUP BY product_id
), a AS(
    SELECT product_id,
        new_price AS price,
        ROW_NUMBER()OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT t.product_id,
       IFNULL(a.price, t.price) AS price
FROM t
LEFT JOIN a
ON t.product_id = a.product_id AND a.rn = 1;