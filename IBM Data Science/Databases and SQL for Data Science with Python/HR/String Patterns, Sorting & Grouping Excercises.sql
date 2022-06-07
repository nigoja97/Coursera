#--Query 1.1--
#Retrieve all employees whose address is in Elgin,IL.

SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';

#--Query 1.2--
#Retrieve all employees who were born during the 1970's.

SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE B_DATE LIKE '197%';

#--Query 1.3--
#Retrieve all employees in department 5 whose salary is between 60000 and 70000.

SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

#--Query 2.1--
#Retrieve a list of employees ordered by department ID.

SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID;

#--Query 2.2--
#Retrieve a list of employees ordered in descending order by department ID and 
#within each department ordered alphabetically in descending order by last name.

SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;

#--Optional Query 2.3--
#In SQL problem 2 (Exercise 2 Problem 2), use department name instead of department ID. 
#Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.

SELECT D.DEP_NAME , E.F_NAME, E.L_NAME
FROM EMPLOYEES as E, DEPARTMENTS as D
WHERE E.DEP_ID = D.DEPT_ID_DEP
ORDER BY D.DEP_NAME, E.L_NAME DESC;

#--Query 3.1--
#In the SQL Query above, D and E are aliases for the table names. Once you define an alias like D in your query, 
#you can simply write D.COLUMN_NAME rather than the full form DEPARTMENTS.COLUMN_NAME.

SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;

#--Query 3.2--
#For each department ID retrieve the number of employees in the department.

SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;

#--Query 3.3--
#Label the computed columns in the result set of SQL problem 2 (Exercise 3 Problem 2) as NUM_EMPLOYEES and AVG_SALARY.

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID;

#--Query 3.4--
#In SQL problem 3 (Exercise 3 Problem 3), order the result set by Average Salary..

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
ORDER BY AVG_SALARY;

#--Query 3.5--
#In SQL problem 4 (Exercise 3 Problem 4), limit the result to departments with fewer than 4 employees.

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING count(*) < 4
ORDER BY AVG_SALARY;
