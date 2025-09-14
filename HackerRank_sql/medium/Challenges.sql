/*
Enter your query here.
*/
WITH challenge_counts AS (
    SELECT h.hacker_id, h.name, COUNT(c.challenge_id) as cnt
    FROM Hackers h
    JOIN Challenges c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
),
count_frequency AS (
    SELECT cnt, COUNT(*) as frequency
    FROM challenge_counts
    GROUP BY cnt
)
SELECT 
    cc.hacker_id, cc.name, cc.cnt
FROM 
    challenge_counts cc
JOIN 
    count_frequency cf ON cc.cnt = cf.cnt
WHERE 
    cf.frequency = 1
    OR cc.cnt = (SELECT MAX(cnt) FROM challenge_counts)
ORDER BY 
    cc.cnt DESC, cc.hacker_id ASC;