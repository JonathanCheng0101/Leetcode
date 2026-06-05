WITH t AS(
    SELECT ad_id,
        SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) AS total_click,
        SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) AS total_viewed
    FROM Ads
    GROUP BY ad_id
)
SELECT ad_id,
       CASE WHEN total_click + total_viewed  = 0 THEN 0 ELSE ROUND(100 * total_click /(total_click + total_viewed), 2) END AS ctr
FROM t
ORDER BY ctr DESC, ad_id ASC;