# Write your MySQL query statement below
WITH f AS(
    SELECT COUNT(DISTINCT sender_id, send_to_id) AS f_cnt
    FROM FriendRequest
),
r AS (
    SELECT COUNT(DISTINCT requester_id, accepter_id) AS r_cnt
    FROM RequestAccepted
)
SELECT ROUND(IFNULL((r.r_cnt/ f.f_cnt),0.00),2) AS accept_rate
FROM f
JOIN r