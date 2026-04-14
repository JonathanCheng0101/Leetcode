# Write your MySQL query statement below
SELECT p.product_id, IFNULL(ROUND(SUM(price * units) / SUM(units), 2), 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold s
on p.product_id = s.product_id AND s.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id