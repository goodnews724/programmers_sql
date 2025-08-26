-- 물고기 종류 별로 가장 큰 물고기
-- ID, 물고기 이름, 길이를 출력
-- 물고기의 ID 컬럼명은 ID, 이름 컬럼명은 FISH_NAME, 길이 컬럼명은 LENGTH
-- 결과는 물고기의 ID에 대해 오름차순 정렬
-- 단, 물고기 종류별 가장 큰 물고기는 1마리만 있으며
-- 10cm 이하의 물고기가 가장 큰 경우는 없습니다

SELECT 
    ID,
    FISH_NAME,
    LENGTH
FROM (
    SELECT fi.ID, fni.FISH_NAME, fi.LENGTH,
           ROW_NUMBER() OVER (PARTITION BY fi.FISH_TYPE ORDER BY fi.LENGTH DESC) as rn
    FROM FISH_INFO fi
    JOIN FISH_NAME_INFO fni ON fi.FISH_TYPE = fni.FISH_TYPE
    WHERE fi.LENGTH IS NOT NULL
) as ranked
WHERE 
    rn = 1
ORDER BY 
    ID;