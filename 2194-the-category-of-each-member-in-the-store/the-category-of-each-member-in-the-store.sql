# Write your MySQL query statement below
WITH t AS(
    SELECT v.visit_id, v.member_id, p.visit_id AS purchase_id
    FROM Visits v
    LEFT JOIN Purchases p
    ON v.visit_id = p.visit_id
), a AS(
    SELECT member_id, 
       IFNULL(100 * COUNT(purchase_id) / COUNT(visit_id), 0) AS rate
FROM t
GROUP BY member_id
)
SELECT m.member_id,
       m.name,
       CASE WHEN rate >= 80 THEN 'Diamond'
            WHEN rate  < 80 AND rate >= 50 THEN 'Gold'
            WHEN  rate < 50 THEN 'Silver'
            WHEN rate IS NULL THEN 'Bronze' END
        AS category
FROM Members m
LEFT JOIN a
ON m.member_id = a.member_id