WITH n AS(
    SELECT SUM(CASE WHEN score >= 90 THEN 1 ELSE 0 END) AS ny
    FROM NewYork
),c AS(
    SELECT SUM(CASE WHEN score >= 90 THEN 1 ELSE 0 END) AS ca
    FROM California
)
SELECT CASE WHEN c.ca > n.ny THEN 'California University'
            WHEN c.ca < n.ny THEN 'New York University'
            ELSE "No Winner" END AS winner
FROM n
CROSS JOIN c
