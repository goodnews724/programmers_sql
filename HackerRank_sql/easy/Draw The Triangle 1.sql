/*
Enter your query here.
*/
WITH RECURSIVE numbers (n) AS (
    SELECT 20
    UNION ALL
    SELECT n - 1 FROM numbers WHERE n > 1
)
SELECT 
    REPEAT('* ', n)
FROM 
    numbers;