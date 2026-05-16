WITH f AS(
    SELECT COUNT(DISTINCT sender_id, send_to_id) AS r_cnt
    FROM FriendRequest
),
r AS(
    SELECT COUNT(DISTINCT requester_id, accepter_id) AS a_cnt
    FROM RequestAccepted
)
SELECT ROUND(IFNULL((r.a_cnt/f.r_cnt),0),2) AS accept_rate
FROM f,r
