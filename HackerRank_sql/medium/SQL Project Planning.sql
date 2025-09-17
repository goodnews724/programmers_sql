SELECT 
    s.Start_Date as project_start,
    e.End_Date as project_end
FROM (
    SELECT Start_Date, 
           ROW_NUMBER() OVER (ORDER BY Start_Date) as rn
    FROM Projects p1
    WHERE NOT EXISTS (
        SELECT 1 FROM Projects p2 
        WHERE p2.End_Date = p1.Start_Date
    )
) s
JOIN (
    SELECT End_Date, 
           ROW_NUMBER() OVER (ORDER BY End_Date) as rn
    FROM Projects p1
    WHERE NOT EXISTS (
        SELECT 1 FROM Projects p2 
        WHERE p2.Start_Date = p1.End_Date
    )
) e ON s.rn = e.rn
ORDER BY 
    DATEDIFF(e.End_Date, s.Start_Date) ASC,
    s.Start_Date ASC;