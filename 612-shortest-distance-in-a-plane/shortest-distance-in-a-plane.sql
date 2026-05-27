# Write your MySQL query statement below
SELECT MIN(ROUND(SQRT(POWER((p2.x - p1.x),2) + POWER((p2.y - p1.y),2)),2))AS shortest
FROM Point2D p1
JOIN Point2D p2
WHERE NOT (p1.x = p2.x AND p1.y = p2.y) 