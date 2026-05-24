WITH t AS(
    SELECT DISTINCT sub_id
    FROM Submissions
    WHERE parent_id IS NULL
)
SELECT t.sub_id AS post_id,
       IFNULL(COUNT(DISTINCT s.sub_id), 0) AS number_of_comments
FROM t
LEFT JOIN Submissions s
ON t.sub_id = s.parent_id
GROUP BY t.sub_id
ORDER BY post_id ASC;