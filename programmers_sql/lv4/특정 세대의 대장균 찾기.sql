-- 3세대의 대장균의 ID(ID) 를 출력
-- 결과는 대장균의 ID 에 대해 오름차순 정렬

SELECT
    c.ID
FROM 
    ECOLI_DATA a
JOIN 
    ECOLI_DATA b ON a.ID = b.PARENT_ID
JOIN 
    ECOLI_DATA c ON b.ID = c.PARENT_ID
WHERE 
    a.PARENT_ID IS NULL
ORDER BY 
    c.ID;