SELECT CASE WHEN A = B  AND B = C AND C= A AND A != 0 THEN 'Equilateral'
            WHEN ((A = B AND A != C) OR (B = C AND A != C)  OR(A = C AND B != C)) AND (A + B > C) AND (A + C > B) AND (C + B > A) THEN 'Isosceles'
            WHEN (A != B) AND (B != C) AND (A != C) AND (A + B > C) AND (A + C > B) AND (C + B > A) THEN 'Scalene'
            ELSE 'Not A Triangle' END AS triangle_type
FROM Triangles;