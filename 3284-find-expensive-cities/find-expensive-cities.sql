# Write your MySQL query statement below
WITH t AS(
    SELECT *,
          (AVG(price) OVER(PARTITION BY city)) AS city_avg
    FROM Listings),
    n AS(
    SELECT *,
          (AVG(price)) AS national_avg
    FROM Listings)

SELECT DISTINCT t.city
FROM t,n
WHERE t.city_avg > n.national_avg
ORDER BY t.city ASC;