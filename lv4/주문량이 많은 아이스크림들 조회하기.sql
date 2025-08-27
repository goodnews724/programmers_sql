-- 7월 아이스크림 총 주문량과 
-- 상반기의 아이스크림 총 주문량을 더한 값이 
-- 큰 순서대로 
-- 상위 3개의 맛을 조회

SELECT 
    FH.FLAVOR
FROM 
    FIRST_HALF FH
JOIN 
    JULY J ON FH.FLAVOR = J.FLAVOR
GROUP BY 
    FH.FLAVOR, FH.TOTAL_ORDER
ORDER BY 
    (FH.TOTAL_ORDER + SUM(J.TOTAL_ORDER)) DESC
LIMIT 3;