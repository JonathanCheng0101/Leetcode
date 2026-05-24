with t AS(
    SELECT 'IOS' AS platform
    UNION ALL
    SELECT 'Android'
    UNION ALL
    SELECT 'Web'
), a AS(
    SELECT 'Reading' AS experiment_name
    UNION ALL
    SELECT 'Sports'
    UNION ALL
    SELECT 'Programming'
), b AS(
    SELECT t.platform,
        a.experiment_name
    FROM t
    CROSS JOIN a
        ORDER BY t.platform ASC, a.experiment_name ASC
)

SELECT b.platform,
       b.experiment_name,
       IFNULL(COUNT(e.experiment_id) , 0) AS num_experiments
FROM b
LEFT JOIN Experiments e
ON e.platform = b.platform AND e.experiment_name = b.experiment_name
GROUP BY b.platform, b.experiment_name