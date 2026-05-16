# Write your MySQL query statement below
SELECT (CASE WHEN (A >= B + C) OR (B >= A + C) OR (C >= A + B) THEN 'Not A Triangle'
             WHEN A = B AND B = C THEN 'Equilateral'
             WHEN (A = B AND A != C) OR (B = C AND A != C) OR (A = C AND A != B) THEN 'Isosceles'
             ELSE 'Scalene'
             END
             ) AS triangle_type
FROM Triangles;