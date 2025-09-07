/*
Enter your query here.
*/
SELECT 
    (SELECT MAX(months * salary) FROM Employee) as max_earnings,
    COUNT(*) as employee_count
FROM 
    Employee 
WHERE 
    months * salary = (SELECT MAX(months * salary) FROM Employee);