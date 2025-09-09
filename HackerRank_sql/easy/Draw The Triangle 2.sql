/*
Enter your query here.
*/

WITH RECURSIVE numbers (n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n < 20
)

SELECT 
    REPEAT('* ', n)
FROM 
    numbers;