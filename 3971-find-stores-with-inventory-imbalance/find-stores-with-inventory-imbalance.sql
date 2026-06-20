# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        MIN(price) OVER(PARTITION BY store_id) AS min_price,
        MAX(price) OVER(PARTITION BY store_id) AS max_price,
        COUNT(store_id)OVER(PARTITION BY store_id) AS cnt
    FROM inventory
),a AS(
    SELECT *
    FROM t
    WHERE cnt >= 3 AND (price = min_price OR price = max_price)
), b AS(
    SELECT *,
       CASE WHEN LEAD(quantity)OVER(PARTITION BY store_id ORDER BY price ASC) < quantity THEN 1 ELSE 0 END AS chk,
       LEAD(quantity)OVER(PARTITION BY store_id ORDER BY price ASC) AS higher_quantity,
       LEAD(price)OVER(PARTITION BY store_id ORDER BY price ASC) AS higher_price,
       LEAD(product_name)OVER(PARTITION BY store_id ORDER BY price ASC) AS most_exp_product
    FROM a
), c AS(
    SELECT store_id, product_name AS cheapest_product, most_exp_product, ROUND(quantity/higher_quantity, 2) AS imbalance_ratio 
    FROM b
    WHERE chk = 1
)
SELECT c.store_id, s.store_name, s.location, c.most_exp_product, c.cheapest_product, c.imbalance_ratio
FROM c
JOIN stores s
ON c.store_id = s.store_id
ORDER BY c.imbalance_ratio DESC, s.store_name ASC;

