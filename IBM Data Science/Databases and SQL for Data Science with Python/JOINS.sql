#Cross JOIN

SELECT column_name(s)
FROM table1
CROSS JOIN table2;

#Inner JOIN

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
WHERE condition;

#Outer JOIN's
#Left JOIN

SELECT column_name(s)
FROM table1
LEFT OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

#Right JOIN
SELECT column_name(s)
FROM table1
RIGHT OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

#Full JOIN
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

#Self JOIN
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;