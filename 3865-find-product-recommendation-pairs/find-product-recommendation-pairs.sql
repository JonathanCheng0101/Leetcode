# Write your MySQL query statement below
WITH t AS(
    SELECT p1.user_id,
        p1.product_id AS product1_id,
        p2.product_id AS product2_id
    FROM ProductPurchases p1
    JOIN ProductPurchases p2
    ON p1.user_id = p2.user_id
    WHERE p1.product_id < p2.product_id
), a AS(
    SELECT product1_id,
       product2_id,
       COUNT(DISTINCT user_id) AS cnt
    FROM t
    GROUP BY product1_id, product2_id
    HAVING COUNT(DISTINCT user_id) >= 3
)
SELECT a.product1_id,
       a.product2_id,
       p1.category AS product1_category,
       p2.category AS product2_category,
       a.cnt AS customer_count
FROM a
JOIN ProductInfo p1
ON a.product1_id = p1.product_id
JOIN ProductInfo p2
ON a.product2_id = p2.product_id
ORDER BY customer_count DESC, a.product1_id ASC, a.product2_id ASC;