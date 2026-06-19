# Write your MySQL query statement below
WITH t AS(
    SELECT k.word,
       k.topic_id,
       p.post_id,
       p.content,
        CASE WHEN p.content REGEXP CONCAT('( |^)', word, '( |$)') THEN 1 ELSE 0 END AS chk
    FROM Keywords k
    CROSS JOIN Posts p
), a AS(
    SELECT post_id, GROUP_CONCAT(DISTINCT topic_id) AS topic
    FROM t
    WHERE chk = 1
    GROUP BY post_id
)
SELECT p.post_id,
       IFNULL(a.topic, 'Ambiguous!') AS topic
FROM Posts p
LEFT JOIN a
ON p.post_id = a.post_id
