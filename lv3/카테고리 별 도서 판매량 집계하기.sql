-- 2022년 1월의 카테고리 별
-- 도서 판매량을 합산
-- 카테고리(CATEGORY), 총 판매량(TOTAL_SALES) 리스트를 출력
-- 결과는 카테고리명을 기준으로 오름차순 정렬

SELECT
    b.CATEGORY,
    SUM(s.SALES) as TOTAL_SALES
FROM
    BOOK_SALES s
JOIN
    BOOK b ON s.BOOK_ID = b.BOOK_ID
WHERE
    s.SALES_DATE like '2022-01%'
GROUP BY
    b.CATEGORY
ORDER BY
    1;