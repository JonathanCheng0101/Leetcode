# Write your MySQL query statement below

SELECT DISTINCT u.user_id AS buyer_id,
       u.join_date,
       IFNULL(COUNT(o.item_id)OVER (PARTITION BY o.buyer_id), 0) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o
ON u.user_id = o.buyer_id AND DATE_FORMAT(o.order_date,'%Y') = '2019'

