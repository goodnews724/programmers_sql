-- CAR_RENTAL_COMPANY_CAR 테이블과
-- CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과
-- CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서
-- 자동차 종류가 '세단' 또는 'SUV' 인 자동차 중 
-- 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고
-- 30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서 
-- 자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력
-- 대여 금액을 기준으로 내림차순 정렬하고,
-- 대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬, 
-- 자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬

SELECT 
    c.CAR_ID,
    c.CAR_TYPE,
    FLOOR(c.DAILY_FEE * 30 * (100 - d.DISCOUNT_RATE) / 100) AS FEE
FROM 
    CAR_RENTAL_COMPANY_CAR c
LEFT JOIN 
    CAR_RENTAL_COMPANY_DISCOUNT_PLAN d 
        ON c.CAR_TYPE = d.CAR_TYPE 
        AND d.DURATION_TYPE = '30일 이상'
WHERE 
    c.CAR_TYPE IN ('세단', 'SUV')
    AND c.CAR_ID NOT IN (
        SELECT DISTINCT h.CAR_ID
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY h
        WHERE h.START_DATE <= '2022-11-30' AND h.END_DATE >= '2022-11-01'
      )
    AND FLOOR(c.DAILY_FEE * 30 * (100 - IFNULL(d.DISCOUNT_RATE, 0)) / 100) >= 500000
    AND FLOOR(c.DAILY_FEE * 30 * (100 - IFNULL(d.DISCOUNT_RATE, 0)) / 100) < 2000000
ORDER BY 
    FEE DESC, c.CAR_TYPE ASC, c.CAR_ID DESC;