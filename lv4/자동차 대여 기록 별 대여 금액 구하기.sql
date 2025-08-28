-- CAR_RENTAL_COMPANY_CAR 테이블과
-- CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과
-- CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서
-- 자동차 종류가 '트럭'인 자동차의 대여 기록에 대해서
-- 대여 기록 별로
-- 대여 금액(컬럼명: FEE)을 구하여
-- 대여 기록 ID와 대여 금액 리스트를 출력
-- 대여 금액을 기준으로 내림차순 정렬하고, 
-- 대여 금액이 같은 경우 대여 기록 ID를 기준으로 내림차순 정렬

SELECT 
    h.HISTORY_ID,
    FLOOR(
        c.DAILY_FEE * 
        (DATEDIFF(h.END_DATE, h.START_DATE) + 1) * 
        (100 - IFNULL(d.DISCOUNT_RATE, 0)) / 100
    ) AS FEE
FROM 
    CAR_RENTAL_COMPANY_RENTAL_HISTORY h
JOIN 
    CAR_RENTAL_COMPANY_CAR c ON h.CAR_ID = c.CAR_ID
LEFT JOIN 
    CAR_RENTAL_COMPANY_DISCOUNT_PLAN d ON c.CAR_TYPE = d.CAR_TYPE
        AND (
            (DATEDIFF(h.END_DATE, h.START_DATE) + 1 >= 7 
             AND DATEDIFF(h.END_DATE, h.START_DATE) + 1 < 30 
             AND d.DURATION_TYPE = '7일 이상')
            OR
            (DATEDIFF(h.END_DATE, h.START_DATE) + 1 >= 30 
             AND DATEDIFF(h.END_DATE, h.START_DATE) + 1 < 90 
             AND d.DURATION_TYPE = '30일 이상')
            OR
            (DATEDIFF(h.END_DATE, h.START_DATE) + 1 >= 90 
             AND d.DURATION_TYPE = '90일 이상')
        )
WHERE 
    c.CAR_TYPE = '트럭'
ORDER BY 
    FEE DESC, h.HISTORY_ID DESC;