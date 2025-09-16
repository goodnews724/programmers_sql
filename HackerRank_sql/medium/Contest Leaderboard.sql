SELECT 
    h.hacker_id,
    h.name,
    SUM(ms.max_score) as total_score
FROM 
    hackers h
JOIN (
    SELECT 
        hacker_id,
        challenge_id,
        MAX(score) as max_score
    FROM submissions
    GROUP BY hacker_id, challenge_id
) ms ON h.hacker_id = ms.hacker_id
GROUP BY 
    h.hacker_id, h.name
HAVING 
    SUM(ms.max_score) > 0
ORDER BY 
    total_score DESC, 
    h.hacker_id ASC;