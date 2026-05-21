# Write your MySQL query statement below
SELECT  u.user_id AS buyer_id,
       u.join_date,
       COUNT(o.item_id) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o
ON u.user_id = o.buyer_id AND DATE_FORMAT(o.order_date, "%Y") = '2019' 
GROUP BY u.user_id, u.join_date


