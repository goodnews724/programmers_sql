# Write your MySQL query statement below
SELECT 
    u.unique_id, 
    e.name
FROM 
    employees e
LEFT JOIN 
    EmployeeUNI u ON e.id = u.id;