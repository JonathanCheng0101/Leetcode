# Write your MySQL query statement below
# CHAR_LENGTH
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;