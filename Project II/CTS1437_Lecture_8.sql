SELECT MIN(emp_no) as min_emp_no
FROM employee;
--MIN selects the smallest integer from a table, I'm calling the field min_emp_no

--Now Im selecting the employe number with max function.
SELECT MAX(emp_no) AS high_emp_no
FROM employee;

SELECT emp_fname, emp_lname, emp_no
FROM employee
WHERE emp_no = (SELECT MIN(emp_no) FROM employee);
--Now I'm combining a select stattement with the min function by placing it in the where clause.

--I'm going to try the same method above but with the max function.
SELECT emp_fname, emp_lname, emp_no
FROM employee
where emp_no = (SELECT MAX(emp_no) from employee);

SELECT project_no 
FROM works_on 
WHERE enter_date = (SELECT MIN(enter_date) 
FROM works_on 
WHERE job = 'Clerk');
--Above query begins with a select statment, we begin with project no. From rhere we want the MIN date AND then we want the clerk job.
--This query select project no then selects the earliest date along with the person title of clerk.

--My own query looking for the analyst
SELECT *
FROM works_on
WHERE emp_no = (SELECT MIN(emp_no) from employee Where job = 'Analyst');

--Job category of employee problem.
SELECT emp_no
FROM works_on
WHERE enter_date = (SELECT MAX(enter_date) from works_on Where job IS NULL)

--BUDGET QUERIES
SELECT SUM(budget) sum_of_budgets
FROM project;

SELECT AVG(budget) avg_budget
FROM project
WHERE budget > 70000;
--for 90000
SELECT AVG(budget) avg_budget_2
FROM project
Where budget > 90000;
--This counts the number of unique job titles for each project
SELECT project_no,COUNT(Distinct job) project_count
FROM works_on
group by project_no;

SELECT *
FROM works_on;
