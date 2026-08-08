WITH t AS(
    SELECT buyer_id,
       COUNT(buyer_id) AS cnt
    FROM Orders
    WHERE order_date >= '2019-01-01' AND order_date < '2020-01-01'
    GROUP BY buyer_id
)
SELECT u.user_id AS buyer_id,
       u.join_date,
       IFNULL(t.cnt, 0) AS orders_in_2019
FROM Users u
LEFT JOIN t
ON u.user_id = t.buyer_id;
