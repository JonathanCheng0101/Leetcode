WITH t AS(
    SELECT activity, COUNT(activity) AS cnt
    FROM Friends 
    GROUP BY activity
), a AS(
    SELECT *, 
        MIN(cnt)OVER()AS min_cnt,
        MAX(cnt)OVER()AS max_cnt
    FROM t
)
SELECT activity
FROM a
WHERE cnt != min_cnt AND cnt != max_cnt

