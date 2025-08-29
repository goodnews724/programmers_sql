-- DEVELOPERS 테이블에서
-- Python이나 C# 스킬을 가진 개발자의 정보를 조회
-- 개발자의 ID, 이메일, 이름, 성을 조회
-- 결과는 ID를 기준으로 오름차순

SELECT 
    D.ID,
    D.EMAIL,
    D.FIRST_NAME,
    D.LAST_NAME
FROM 
    DEVELOPERS D
WHERE 
    (D.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'Python')) > 0 OR
    (D.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'C#')) > 0
ORDER BY 
    D.ID;