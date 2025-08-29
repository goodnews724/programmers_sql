-- 코드를 입력하세요
SELECT
    ANIMAL_ID,
    NAME,
    LEFT(DATETIME, 10) as '날짜'
FROM
    ANIMAL_INS