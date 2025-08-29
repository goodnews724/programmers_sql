-- 입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리
-- 아이디와 이름을 조회
-- 결과는 보호 기간이 긴 순

SELECT 
    i.ANIMAL_ID,
    i.NAME
FROM 
    ANIMAL_INS i
JOIN 
    ANIMAL_OUTS o ON i.ANIMAL_ID = o.ANIMAL_ID
ORDER BY 
    (o.DATETIME - i.DATETIME) DESC
LIMIT 
    2;