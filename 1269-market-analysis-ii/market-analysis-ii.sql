# Write your MySQL query statement below
WITH t AS(
    SELECT o.order_date,
       o.item_id,
       i.item_brand,
       u.user_id,
       u.favorite_brand
    FROM Users u
    LEFT JOIN Orders o
    ON u.user_id = o.seller_id
    LEFT JOIN Items i
    ON o.item_id = i.item_id
), a AS(
    SELECT *,
        ROW_NUMBER()OVER(PARTITION BY user_id ORDER BY order_date ASC) AS rn
    FROM t
), b AS(
    SELECT user_id AS seller_id,
       item_brand
    FROM a
    WHERE rn = 2 AND favorite_brand = item_brand
)
SELECT u.user_id AS seller_id,
       CASE WHEN b.item_brand IS NOT NULL THEN 'yes' ELSE 'no' END AS '2nd_item_fav_brand'
FROM Users u
LEFT JOIN b
ON u.user_id = b.seller_id