use chapter7;

SELECT emp_lname
FROM employee
WHERE emp_no NOT BETWEEN 10000 AND 20000 
ORDER BY emp_lname; --Employee ID is not related to name or alphabetical order. It is possible to order by name in any order, i don't know the syntax

--NEXT PART
SELECT emp_no,project_no
FROM works_on
WHERE project_no = 'p1' 
	AND job IS NULL; -- This doesn't mean anything in particular other than that they do no have a current role on this project.

SELECT enter_date
FROM works_on
WHERE project_no = 'p1'
	AND job IS NULL; -- This query returns the enter date of a person that had no job and the job was specific to project 1.

SELECT emp_no, ISNULL(job,'job unknown') AS task
FROM works_on
WHERE project_no = 'p1';

SELECT *, ISNULL(job, 'JOB UNK') AS task
FROM works_on
WHERE job IS NULL; -- I had to make sure that IS NULL is still in the where clause because there is no actual UNK value replacing the null value.

