-- 보호소에 들어올 당시에는 중성화1되지 않았지만, 
-- 보호소를 나갈 당시에는 중성화된 
-- 동물의 아이디와 생물 종, 이름을 조회하는 
-- 아이디 순으로 조회하는 SQL 문을 작성해주세요.

SELECT
    i.ANIMAL_ID,
    i.ANIMAL_TYPE,
    i.NAME
FROM 
    ANIMAL_INS i
JOIN
    ANIMAL_OUTS o ON o.ANIMAL_ID = i.ANIMAL_ID
WHERE
    i.SEX_UPON_INTAKE LIKE 'Intact%' AND
    o.SEX_UPON_OUTCOME NOT LIKE 'Intact%'
ORDER BY
    1;