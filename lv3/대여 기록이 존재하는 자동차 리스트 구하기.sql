-- CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블
-- 자동차 종류가 '세단'인 자동차들 중 10월에 대여를 시작한 기록이 있는 자동차
-- ID 리스트를 출력자동차 ID 리스트는 중복이 없어야 하며
-- 자동차 ID를 기준으로 내림차순 정렬

SELECT 
    DISTINCT C.CAR_ID
FROM 
    CAR_RENTAL_COMPANY_CAR C
JOIN 
    CAR_RENTAL_COMPANY_RENTAL_HISTORY H ON C.CAR_ID = H.CAR_ID
WHERE 
    C.CAR_TYPE = '세단'AND 
    MONTH(H.START_DATE) = 10
ORDER BY 
    1 DESC;