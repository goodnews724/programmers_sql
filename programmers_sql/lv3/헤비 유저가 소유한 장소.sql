-- 이 서비스에서는 공간을 둘 이상 등록한 사람을 "헤비 유저"
-- 헤비 유저가 등록한 공간의 정보
-- 아이디 순으로 조회

SELECT 
    ID,
    NAME,
    HOST_ID
FROM (
    SELECT 
        ID,
        NAME,
        HOST_ID, 
        COUNT(*) OVER (PARTITION BY HOST_ID) as cnt
    FROM 
        PLACES
) as t
WHERE 
    cnt >= 2
ORDER BY 
    1;