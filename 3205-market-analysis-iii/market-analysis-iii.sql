# Write your MySQL query statement below
WITH t AS(
    SELECT DISTINCT o.seller_id,
       o.item_id
       
    FROM Orders o
    JOIN Items i
    ON o.item_id = i.item_id
    WHERE NOT EXISTS(
        SELECT 1
        FROM Users u
        WHERE u.seller_id = o.seller_id AND i.item_brand = u.favorite_brand
    )
), a AS(
    SELECT *, COUNT(seller_id)OVER(PARTITION BY seller_id)AS cnt
    FROM t
), b AS(
    SELECT *,
       RANK()OVER(ORDER BY cnt DESC) AS rn
    FROM a
)
SELECT DISTINCT seller_id,
       cnt AS num_items
FROM b
WHERE rn = 1
ORDER BY seller_id ASC;