-- 대장균 개체의 ID(ID)와 자식의 수(CHILD_COUNT)를 출력
-- 자식이 없다면 자식의 수는 0으로 출력
-- 결과는 개체의 ID 에 대해 오름차순 정렬

SELECT 
    p.ID,
    COUNT(c.ID) AS CHILD_COUNT
FROM 
    ECOLI_DATA p
LEFT JOIN 
    ECOLI_DATA c ON p.ID = c.PARENT_ID
GROUP BY 
    p.ID
ORDER BY 
    p.ID;