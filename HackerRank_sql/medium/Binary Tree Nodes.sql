/*
Enter your query here.
*/
SELECT 
    N,
    IF(P IS NULL, 'Root',
       IF(N IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL), 'Inner', 'Leaf')
    ) AS node_type
FROM 
    BST
ORDER BY 
    N;
