# Write your MySQL query statement below
SELECT COUNT(s.account_id) AS accounts_count
FROM Subscriptions s
WHERE DATE_FORMAT(s.end_date, "%Y") = '2021'
       AND
       NOT EXISTS(
        SELECT 1
        FROM Streams st
        WHERE st.account_id = s.account_id AND DATE_FORMAT(st.stream_date, "%Y") = '2021'
       )