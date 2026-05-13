# Write your MySQL query statement below
SELECT tweet_id
FROM Tweets
WHERE Length(content) > 140 OR
      Length(content) - Length(REPLACE(content,'@','')) > 3 OR
      Length(content) - Length(REPLACE(content,'#',''))> 3
ORDER BY tweet_id ASC;