SELECT 
    h.hacker_id, h.name
FROM 
    submissions AS s
JOIN 
    challenges AS c ON s.challenge_id = c.challenge_id
JOIN 
    difficulty AS d ON c.difficulty_level = d.difficulty_level
JOIN 
    hackers AS h ON s.hacker_id = h.hacker_id
WHERE
    s.score = d.score
GROUP BY
    h.hacker_id,
    h.name
HAVING
    COUNT(s.submission_id) > 1
ORDER BY
    COUNT(s.submission_id) DESC,
    h.hacker_id ASC;