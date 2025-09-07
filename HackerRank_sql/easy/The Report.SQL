SELECT 
    IF(G.Grade >= 8, S.Name, 'NULL') AS Name,
    G.Grade,
    S.Marks
FROM 
    Students S
JOIN 
    Grades G ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY 
    G.Grade DESC,
    IF(G.Grade >= 8, S.Name, NULL) ASC,
    IF(G.Grade < 8, S.Marks, NULL) ASC;