# Write your MySQL query statement below
WITH t AS(
    SELECT p1.id AS id1,
        p1.x_value AS x1,
        p1.y_value AS y1,
        p2.id AS id2,
        p2.x_value AS x2,
        p2.y_value AS y2,
        ABS(p1.x_value - p2.x_value)* ABS(p1.y_value - p2.y_value) AS `AREA`
    FROM Points p1
    CROSS JOIN Points p2
    WHERE p1.x_value != p2.x_value AND p1.y_value != p2.y_value
)
SELECT LEAST(id1, id2) AS P1,
       GREATEST(id1, id2) AS P2,
       `AREA`
FROM t
GROUP BY LEAST(id1, id2), GREATEST(id1, id2) 
ORDER BY `AREA` DESC, P1 ASC,P2 ASC;

