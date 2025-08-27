-- MEMBER_PROFILE와 REST_REVIEW 테이블에서 
-- 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회
-- 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력
-- 결과는 리뷰 작성일을 기준으로 오름차순, 
-- 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬

SELECT 
    MP.MEMBER_NAME,
    RR.REVIEW_TEXT,
    LEFT(RR.REVIEW_DATE, 10)
FROM 
    MEMBER_PROFILE MP
JOIN 
    REST_REVIEW RR ON MP.MEMBER_ID = RR.MEMBER_ID
WHERE 
    MP.MEMBER_ID = (
        SELECT MEMBER_ID
        FROM REST_REVIEW 
        GROUP BY MEMBER_ID
        ORDER BY COUNT(*) DESC
        LIMIT 1
    )
ORDER BY 
    RR.REVIEW_DATE ASC, RR.REVIEW_TEXT ASC;