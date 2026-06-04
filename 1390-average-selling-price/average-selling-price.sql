WITH t AS(
    SELECT p.product_id,
       p.price,
       IFNULL(u.units, 0) AS units,
       IFNULL(u.units, 0) * p.price AS amount
    FROM Prices p
    LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id AND u.purchase_date BETWEEN p.start_date AND p.end_date
)
SELECT product_id,
       IFNULL(ROUND(SUM(amount)/SUM(units), 2), 0) AS average_price
FROM t
GROUP BY product_id
