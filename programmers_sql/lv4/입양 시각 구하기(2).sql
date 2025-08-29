-- 0시부터 23시까지, 각 시간대별
-- 입양이 몇 건이나 발생했는지 조회
-- 시간대 순으로 정렬

WITH RECURSIVE hours AS (
    SELECT 0 AS HOUR
    UNION ALL
    SELECT HOUR + 1
    FROM hours
    WHERE HOUR < 23
)
SELECT 
    h.HOUR,
    IFNULL(COUNT(a.ANIMAL_ID), 0) AS COUNT
FROM 
    hours h
LEFT JOIN 
    ANIMAL_OUTS a ON h.HOUR = HOUR(a.DATETIME)
GROUP BY 
    h.HOUR
ORDER BY 
    h.HOUR;