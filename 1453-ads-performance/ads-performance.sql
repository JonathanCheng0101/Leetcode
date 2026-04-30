# Write your MySQL query statement below
SELECT ad_id,
       IFNULL(ROUND(SUM(CASE WHEN action = 'clicked' THEN 1 ELSE 0 END)*100/ SUM(CASE WHEN action IN ('clicked', 'viewed') THEN 1 ELSE 0 END) , 2),0) AS ctr
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id ASC;
