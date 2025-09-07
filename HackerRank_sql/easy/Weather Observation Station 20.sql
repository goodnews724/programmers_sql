/*
Enter your query here.
*/
WITH ranked_data AS (
    SELECT LAT_N,
           ROW_NUMBER() OVER (ORDER BY LAT_N) as rn,
           COUNT(*) OVER() as total_count
    FROM STATION
)
SELECT 
    ROUND(AVG(LAT_N), 4) as median
FROM 
    ranked_data
WHERE 
    rn IN ((total_count + 1) / 2, (total_count + 2) / 2);