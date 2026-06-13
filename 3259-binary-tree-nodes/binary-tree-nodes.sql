# Write your MySQL query statement below
SELECT `N`,
        CASE WHEN `P` IS NULL THEN 'Root'
             WHEN `N` IN (SELECT `N` FROM TREE) AND `N` IN (SELECT `P` FROM TREE) THEN 'Inner'
             WHEN `N` IN (SELECT `N` FROM TREE) AND NOT EXISTS(SELECT 1 FROM TREE t2 WHERE t1.`N` = t2.`P`) THEN 'Leaf' END  AS Type

FROM Tree t1
ORDER BY `N` ASC;