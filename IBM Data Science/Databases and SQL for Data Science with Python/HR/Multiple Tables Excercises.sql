#--- Query 1A ---
#Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from employees where JOB_ID IN (select JOB_IDENT from jobs)
;
	
#--- Query 1B ---	
#Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
select * from employees where JOB_ID IN (select JOB_IDENT from jobs where JOB_TITLE= 'Jr. Designer')
;

#--- Query 1C ---
#Retrieve JOB information and who earn more than $70,000.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 )
;
	
#--- Query 1D ---
#Retrieve JOB information and whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 )
;

#--- Query 1E ---
#Retrieve JOB information for female employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 and SEX='F' )
;

#--- Query 2A ---
#Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
select * from employees, jobs
;

#--- Query 2B ---
#Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from employees, jobs where employees.JOB_ID = jobs.JOB_IDENT
;

#--- Query 2C ---
#Redo the previous query, using shorter aliases for table names.
select * from employees E, jobs J where E.JOB_ID = J.JOB_IDENT
;

#--- Query 2D ---
#Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
select EMP_ID,F_NAME,L_NAME, JOB_TITLE from employees E, jobs J where E.JOB_ID = J.JOB_IDENT
;

#--- Query 2E ---
#Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
select E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE from employees E, jobs J where E.JOB_ID = J.JOB_IDENT
;