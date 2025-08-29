-- 보호 시작일보다 입양일이 더 빠른 동물
-- 아이디와 이름을 조회
-- 결과는 보호 시작일이 빠른 순으로 조회

SELECT
    i.ANIMAL_ID,
    i.NAME
FROM
    ANIMAL_INS i
JOIN
    ANIMAL_OUTS o ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE
    o.DATETIME < i.DATETIME
ORDER BY 
    i.DATETIME;