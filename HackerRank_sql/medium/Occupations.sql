/*
Enter your query here.
*/
SELECT 
    MAX(IF(Occupation = 'Doctor', Name, NULL)) AS Doctor,
    MAX(IF(Occupation = 'Professor', Name, NULL)) AS Professor,
    MAX(IF(Occupation = 'Singer', Name, NULL)) AS Singer,
    MAX(IF(Occupation = 'Actor', Name, NULL)) AS Actor
FROM (
    SELECT 
        Name, 
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) as rn
    FROM OCCUPATIONS
) t
GROUP BY 
    rn
ORDER BY 
    rn;
