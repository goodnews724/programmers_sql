/*
Enter your query here.
*/
WITH RECURSIVE numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 1000
),
primes AS (
    SELECT n1.n
    FROM numbers n1
    WHERE n1.n >= 2
    AND NOT EXISTS (
        SELECT 1
        FROM numbers n2
        WHERE n2.n > 1 
        AND n2.n < n1.n
        AND n2.n <= SQRT(n1.n)
        AND n1.n % n2.n = 0
    )
)
SELECT GROUP_CONCAT(n ORDER BY n SEPARATOR '&') AS prime_numbers
FROM primes;