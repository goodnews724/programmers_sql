-- 더 이상 업그레이드할 수 없는 아이템의 
-- 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME), 아이템의 희귀도(RARITY)를 출력
-- 결과는 아이템 ID를 기준으로 내림차순 정렬

SELECT 
    i.ITEM_ID,
    i.ITEM_NAME,
    i.RARITY
FROM 
    ITEM_INFO i
LEFT JOIN 
    ITEM_TREE t ON i.ITEM_ID = t.PARENT_ITEM_ID
WHERE 
    t.PARENT_ITEM_ID IS NULL
ORDER BY 
    i.ITEM_ID DESC;