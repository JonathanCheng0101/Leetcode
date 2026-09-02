WITH T AS(
    SELECT p.product_id, IFNULL(u.units, 0) AS units, p.price
    FROM Prices p
    LEFT JOIN UnitsSold u
    ON u.product_id = p.product_id AND u.purchase_date BETWEEN p.start_date AND p.end_date
)
SELECT product_id, IFNULL(ROUND(SUM(units* price) /SUM(units), 2), 0) AS average_price
FROM t
GROUP BY product_id;
