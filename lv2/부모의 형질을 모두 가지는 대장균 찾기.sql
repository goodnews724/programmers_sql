-- 부모의 형질을 모두 보유한 대장균
-- ID(ID), 대장균의 형질(GENOTYPE), 부모 대장균의 형질(PARENT_GENOTYPE)을 출력
-- 결과는 ID에 대해 오름차순 정렬

SELECT 
    c.ID,
    c.GENOTYPE,
    p.GENOTYPE AS PARENT_GENOTYPE
FROM 
    ECOLI_DATA c
JOIN 
    ECOLI_DATA p ON c.PARENT_ID = p.ID
WHERE 
    (c.GENOTYPE & p.GENOTYPE) = p.GENOTYPE
ORDER BY 
    c.ID;