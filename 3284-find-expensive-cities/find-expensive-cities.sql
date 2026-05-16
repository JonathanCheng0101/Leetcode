# Write your MySQL query statement below
WITH t AS(
    SELECT AVG(price) AS nl_avg
    FROM Listings
)
SELECT l.city
FROM Listings l,t
GROUP BY city
HAVING AVG(l.price) > MAX(t.nl_avg)
ORDER BY l.city;