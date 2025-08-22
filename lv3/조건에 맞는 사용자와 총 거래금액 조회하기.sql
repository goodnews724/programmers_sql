-- USED_GOODS_BOARD와 USED_GOODS_USER 테이블에서
-- 완료된 중고 거래의 총금액이 70만 원 이상인 사람의 
-- 회원 ID, 닉네임, 총거래금액을 조회
-- 결과는 총거래금액을 기준으로 오름차순 정렬

SELECT
    b.WRITER_ID as USER_ID,
    u.NICKNAME,
    SUM(b.PRICE) as TOTAL_SALES
FROM
    USED_GOODS_BOARD b
JOIN
    USED_GOODS_USER u ON b.WRITER_ID = u.USER_ID
WHERE
    b.STATUS = 'DONE'
GROUP BY
    b.WRITER_ID
HAVING
    SUM(b.PRICE) >= 700000
ORDER BY
    3;