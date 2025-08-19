SELECT
    BOARD_ID,
    WRITER_ID,
    TITLE,
    PRICE,
    case
        when STATUS = 'SALE' then '판매중'
        when STATUS = 'RESERVED' then '예약중'
        else '거래완료'
    end as STATUS
FROM
    USED_GOODS_BOARD
WHERE
    LEFT(CREATED_DATE, 10) = '2022-10-05'
ORDER BY
    1 DESC;