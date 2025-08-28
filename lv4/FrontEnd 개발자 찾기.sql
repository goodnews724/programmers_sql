-- DEVELOPERS 테이블에서
-- Front End 스킬을 가진 개발자의 정보를 조회
-- 조건에 맞는 개발자의 ID, 이메일, 이름, 성을 조회
-- 결과는 ID를 기준으로 오름차순 정렬

SELECT 
    d.ID,
    d.EMAIL,
    d.FIRST_NAME,
    d.LAST_NAME
FROM 
    DEVELOPERS d
WHERE 
    d.SKILL_CODE & (
        SELECT SUM(s.CODE)
        FROM SKILLCODES s
        WHERE s.CATEGORY = 'Front End'
    ) > 0
ORDER BY 
    d.ID;