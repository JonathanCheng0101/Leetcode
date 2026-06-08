SELECT s.seller_name
FROM Seller s
WHERE NOT EXISTS(
    SELECT 1
    FROM Orders o
    WHERE s.seller_id = o.seller_id AND YEAR(o.sale_date) = 2020
)
ORDER BY s.seller_name ASC;