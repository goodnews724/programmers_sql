SELECT
    COUNT(*) as COUNT
FROM
    ECOLI_DATA
WHERE
    ((GENOTYPE & 1) = 1 or (GENOTYPE & 4) = 4)
    and (GENOTYPE & 2) = 0;