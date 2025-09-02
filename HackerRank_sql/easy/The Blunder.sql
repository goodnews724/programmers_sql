/*
Enter your query here.
*/
SELECT 
    CEIL(AVG(salary) - AVG(REPLACE(CAST(salary AS CHAR), '0', '')))
FROM 
    employees;