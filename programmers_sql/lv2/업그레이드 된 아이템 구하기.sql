-- 아이템의 희귀도가 'RARE'인 아이템들의 모든 다음 업그레이드 아이템
-- 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME), 아이템의 희귀도(RARITY)를 출력
-- 아이템 ID를 기준으로 내림차순 정렬

SELECT 
    c.ITEM_ID,
    c.ITEM_NAME,
    c.RARITY
FROM 
    ITEM_INFO p
JOIN 
    ITEM_TREE t ON p.ITEM_ID = t.PARENT_ITEM_ID
JOIN 
    ITEM_INFO c ON t.ITEM_ID = c.ITEM_ID
WHERE 
    p.RARITY = 'RARE'
ORDER BY 
    c.ITEM_ID DESC;