WITH t AS(
    SELECT u.user_id, u.name
    FROM Users u
    JOIN MovieRating m
    ON u.user_id = m.user_id
), a AS(
    SELECT name
    FROM t
    GROUP BY user_id, name
    ORDER BY COUNT(user_id) DESC, name ASC
    LIMIT 1
)
, b AS(
    SELECT mr.movie_id, m.title, mr.rating
    FROM MovieRating mr
    JOIN Movies m
    ON mr.movie_id = m.movie_id
    WHERE '2020-02-01' <= mr.created_at AND mr.created_at < '2020-03-01'
), c AS(
    SELECT *,
       AVG(rating)OVER(PARTITION BY movie_id) AS avg_rating
    FROM b
), d AS(
    SELECT title
    FROM c
    ORDER BY avg_rating DESC, title ASC
    LIMIT 1
)
SELECT name AS results
FROM a
UNION ALL 
SELECT title AS results
FROM d



