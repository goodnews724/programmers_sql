-- MEMBER_PROFILE와 REST_REVIEW 테이블에서 
-- 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회
-- 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력
-- 결과는 리뷰 작성일을 기준으로 오름차순, 
-- 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬

-- 가장 리뷰를 많이 작성한 회원이 여러 명일 경우 배재함
-- SELECT 
--     MP.MEMBER_NAME,
--     RR.REVIEW_TEXT,
--     LEFT(RR.REVIEW_DATE, 10)
-- FROM 
--     MEMBER_PROFILE MP
-- JOIN 
--     REST_REVIEW RR ON MP.MEMBER_ID = RR.MEMBER_ID
-- WHERE 
--     MP.MEMBER_ID = (
--         SELECT MEMBER_ID
--         FROM REST_REVIEW 
--         GROUP BY MEMBER_ID
--         ORDER BY COUNT(*) DESC
--         LIMIT 1
--     )
-- ORDER BY 
--     RR.REVIEW_DATE ASC, RR.REVIEW_TEXT ASC;

-- 가장 리뷰를 많이 작성한 회원이 여러 명일 경우 모두 포함
-- SELECT 
--     MP.MEMBER_NAME,
--     RR.REVIEW_TEXT,
--     LEFT(RR.REVIEW_DATE, 10) as REVIEW_DATE
-- FROM 
--     MEMBER_PROFILE MP
-- JOIN 
--     REST_REVIEW RR ON MP.MEMBER_ID = RR.MEMBER_ID
-- WHERE 
--     MP.MEMBER_ID IN (
--         SELECT MEMBER_ID
--         FROM REST_REVIEW 
--         GROUP BY MEMBER_ID
--         HAVING COUNT(*) = (
--             SELECT MAX(cnt) 
--             FROM (
--                 SELECT COUNT(*) as cnt 
--                 FROM REST_REVIEW 
--                 GROUP BY MEMBER_ID
--             ) review_count_table
--         )
--     )
-- ORDER BY 
--     RR.REVIEW_DATE ASC, RR.REVIEW_TEXT ASC;


-- 파티션 DENSE_RANK() 사용 -> 동시 1등인 회원 모두 포함
WITH review_stats AS (
    SELECT 
        MP.MEMBER_ID,
        MP.MEMBER_NAME,
        RR.REVIEW_TEXT,
        RR.REVIEW_DATE,
        COUNT(*) OVER (PARTITION BY MP.MEMBER_ID) as review_count
    FROM MEMBER_PROFILE MP
    JOIN REST_REVIEW RR ON MP.MEMBER_ID = RR.MEMBER_ID
),
ranked_reviews AS (
    SELECT 
        MEMBER_NAME,
        REVIEW_TEXT,
        REVIEW_DATE,
        DENSE_RANK() OVER (ORDER BY review_count DESC) as rnk
    FROM review_stats
)
SELECT 
    MEMBER_NAME,
    REVIEW_TEXT,
    LEFT(REVIEW_DATE, 10) as REVIEW_DATE
FROM 
    ranked_reviews
WHERE
    rnk = 1
ORDER BY 
    REVIEW_DATE ASC, REVIEW_TEXT ASC;