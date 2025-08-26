-- FOOD_PRODUCT와 FOOD_ORDER 테이블에서
-- 생산일자가 2022년 5월인 식품들의 
-- 식품 ID, 식품 이름, 총매출을 조회
-- 결과는 총매출을 기준으로 내림차순 정렬
-- 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬

SELECT 
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    SUM(o.AMOUNT * p.PRICE) as TOTAL_SALES
FROM 
    FOOD_PRODUCT p
JOIN 
    FOOD_ORDER o ON p.PRODUCT_ID = o.PRODUCT_ID
WHERE 
    o.PRODUCE_DATE LIKE '2022-05%'
GROUP BY 
    p.PRODUCT_ID, p.PRODUCT_NAME
ORDER BY 
    TOTAL_SALES DESC, p.PRODUCT_ID ASC;