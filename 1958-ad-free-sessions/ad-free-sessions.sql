SELECT p1.session_id
FROM Playback p1
WHERE NOT EXISTS(
    SELECT 1
    FROM Playback p2
    JOIN Ads a
    ON p2.customer_id = a.customer_id
    WHERE p1.session_id = p2.session_id AND (a.`timestamp` BETWEEN p2.start_time AND p2.end_time)
)