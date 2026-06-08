# Write your MySQL query statement below
WITH t AS(
    SELECT SUM(CASE WHEN content REGEXP '( )bull( )' THEN 1 ELSE 0 END) AS bull_cnt,
           SUM(CASE WHEN content REGEXP '( )bear( )' THEN 1 ELSE 0 END) AS bear_cnt
    FROM Files
)

SELECT 'bull' AS word,
        bull_cnt AS `count`
FROM t

UNION ALL

SELECT 'bear',
       bear_cnt
FROM t
