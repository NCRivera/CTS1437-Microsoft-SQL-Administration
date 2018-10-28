
CREATE DATABASE sample3;
Use sample3;
/*CREATE TABLE employee (emp_no INTEGER NOT NULL,
                       emp_fname CHAR(20) NOT NULL,
					   emp_lname CHAR(20) NOT NULL,
					   dept_no CHAR(4) NULL);
CREATE TABLE  department(dept_no CHAR(4) NOT NULL,
						dept_name CHAR(25) NOT NULL,
						location CHAR(30) NULL);
CREATE TABLE project	(project_no CHAR(4) NOT NULL,
						project_name CHAR(15) NOT NULL,
						budget FLOAT NULL);
CREATE TABLE works_on	(emp_no INTEGER NOT NULL,
						project_no CHAR(4) NOT NULL,
						job CHAR(15) NULL,
						enter_date DATE NULL);
--Now I'm going to be inserting my data into the employee table
insert into employee values(25348, 'Matthew', 'Smith',     'd3');
insert into employee values(10102, 'Ann',     'Jones',     'd3');
insert into employee values(18316, 'John',    'Barrimore', 'd1');
insert into employee values(29346, 'James',   'James',     'd2');
insert into employee values(9031,  'Elke',    'Hansel',    'd2');
insert into employee values(2581,  'Elsa',    'Bertoni',   'd2');
insert into employee values(28559, 'Sybill',  'Moser',     'd1');

--Now I'm going to be inserting my data into the department table
insert into department values('d1', 'Research',   'Dallas');
insert into department values('d2', 'Accounting', 'Seattle');
insert into department values('d3', 'Mercury',    'Dallas');

--Now I'm going to be inserting my data into the project table
insert into project values('p1', 'Apollo', 120000.00);
insert into project values('p2', 'Gemini', 95000.00);
insert into project values('p3', 'Mercury', 186500.00);

--Now I'm going to be inserting my data into the works_on table
insert into works_on values(10102, 'p1', 'Analyst', '2006.10.1');
insert into works_on values(10102, 'p3', 'Manager', '2008.1.1');
insert into works_on values(25348, 'p2', 'Clerk',	'2007.2.15');
insert into works_on values(18316, 'p2', NULL,		'2007.6.1');
insert into works_on values(29646, 'p2', NULL,		'2006.12.15');
insert into works_on values(2581,  'p3', 'Analyst', '2007.10.15');
insert into works_on values(9031,  'p1', 'Manager', '2007.4.15');
insert into works_on values(28559, 'p1', NULL,		'2007.8.1');
insert into works_on values(28559, 'p2', 'Clerk',	'2008.2.1');
insert into works_on values(9031,  'p3', 'Clerk',	'2006.11.15');
insert into works_on values(29346, 'p1', 'Clerk',	'2007.1.4');

--Now I'm going to look at all my tables and data input.
SELECT * FROM department;
select * from project; -- 
select * from employee;
select * from works_on;
*/

/* -  -  -  -- LECTURE07 --  -  -  - */
/*
SELECT project_no, COUNT(Distinct Job) Job_count
	FROM works_on
	GROUP BY project_no; --The query above creates a row for each project, counts the number of distinct jobs for each project.

SELECT project_no, COUNT(Distinct Job) Job_count
	FROM works_on
	GROUP BY project_no
	ORDER BY project_no desc; --The query above creates a row for each project, counts the number of distinct jobs for each project. AND it orders by project_no in descencding order.

SELECT project_no, COUNT(Distinct Job) Job_count
	FROM works_on
	GROUP BY project_no
	ORDER BY project_no asc; --AND NOW it orders by project_no in ascending order.

SELECT dept_no, COUNT(*)dept_no_count
	FROM department
	GROUP BY dept_no
	ORDER BY 1 asc; --The query does not ask the right question, it only returns back the primary key and dows not give any information. It would make more sense to select dept_name. 

SELECT job 
	FROM works_on
	GROUP BY job
	HAVING COUNT(*) >=2; --This query lists all the jobs with a count of 2 or more instances.

SELECT dept_no 
	FROM employee
	GROUP BY dept_no
	HAVING COUNT(*) > 2; --The query returns only department_no d2.

SELECT emp_no
	FROM employee
	GROUP BY emp_no
	HAVING emp_no LIKE '1%'; --The query returns all the employee ID's beginning with '1' and is ordered

SELECT job
	FROM works_on
	GROUP BY job
	HAVING job LIKE '%L'; --The query doesn't return anything because there is no job ending in L.

USE sample3;
SELECT emp_lname, dept_no
	FROM employee
	WHERE emp_no <= 11000
	ORDER BY emp_lname; --The query indicates the last names of the employees who have the ID greater than 11000, and what they work on.

SELECT emp_fname, emp_lname, dept_no
	FROM employee
	WHERE emp_no <= 11000
	ORDER BY emp_fname; --The above is the same as the previous but with the first name added and ordered by first name.

SELECT emp_no, emp_fname, emp_lname
	INTO employee_enh
		FROM employee; --THis created a new table with the fields selected into the table specified. EMPLOYEE_ENH

ALTER TABLE employee_enh
	ADD domicile char(25) NULL; --This query added a column called domicile.

SELECT project_no, project_name, budget
	INTO project_succ
		FROM project; --I'm creating a new table with this query called project_succ.

ALTER TABLE project_succ
	ADD results BIT NULL; --I added a column called results to be a bit data type as bit is either 0 or 1 or null.

UPDATE employee_enh SET domicile = 'San Antonio'
WHERE emp_no = 25348;

UPDATE employee_enh SET domicile = 'Houston'
WHERE emp_no = 10102;

UPDATE employee_enh SET domicile = 'San Antonio'
WHERE emp_no = 18316;

UPDATE employee_enh SET domicile = 'Seattle'
WHERE emp_no = 29346;

UPDATE employee_enh SET domicile = 'Portland'
WHERE emp_no = 9031;

UPDATE employee_enh SET domicile = 'Tacoma'
WHERE emp_no = 2581;

UPDATE employee_enh SET domicile = 'Houston'
WHERE emp_no = 28559; --I'm populating the table employee_enh with data.

SELECT * 
	FROM employee_enh; --The query updated all of the cities based on the employee_no.

SELECT emp_lname, domicile 
	FROM employee_enh; --There is no relationshipp between last name and domicile.

SELECT domicile FROM employee_enh
UNION
SELECT location FROM department; --This is a sort of join but I don't know the type

SELECT project_no FROM works_on
UNION
SELECT project_no FROM project_succ; --This query leaves me with the id numbers for the three projects.

select emp_no from employee where dept_no = 'd3'
UNION
select emp_no from works_on where job = 'Clerk' Order by 1; --This query shows the results of the employees that satisfy the conditions indicated on either table.

select emp_no from employee where emp_lname like 'J%'
UNION
select emp_no from works_on where job = 'Analyst' Order by 1; --This query shows the results of the employees that satisfy the conditions indicated on either tables This is like an OR statement.

select emp_no from employee where dept_no = 'd2'
intersect
select emp_no from works_on where enter_date > '02.01.2009'; --This particular query does not bring any results, I believe this is a sort of AND statement.

select emp_no from employee where dept_no = 'd2'
intersect
select emp_no from works_on where enter_date > '02.01.2000'; --This particular query is the same as the above statement but the date is changed to 9 years sooner. In this case there are now results to show.

select emp_no from employee where dept_no = 'd3'
intersect
select emp_no from works_on where enter_date < '02.01.2004'; --In this query no results are shown as no employee fits the criteria.

select emp_no from employee where dept_no = 'd1'
except
select emp_no from works_on where enter_date > '02.01.2009'; --The query returns no results, I have a feeling this query is like a NOT statement.

USE sample3;
select emp_no from employee where dept_no = 'd1'
except
select emp_no from works_on where enter_date < '02.03.1999'; --This query brings back 2 results because that satisfy the condition, I believe this is a NOT statement but for tables.


--These types of queries are useful to see when certain fields are on separate tables and you need to see which fields satisfy conditions on both tables.
select emp_no from employee where dept_no = 'd1'
except
select emp_no from works_on where enter_date < '02.03.1999'; --Except makes sure that the criteria in the second select statement will not be included.

-- Depednging on the information that I need SET operators can show me what rows fit the criteria that I specify. If I use UNION operator I can see what rows match in two tables. If I use the interesect operator, it shows that rows which are the same in both tables. Using the except operators is similar to a not statement in that it shows what conditions match the first selec staement but not the second select statement.


USE sample3;
SELECT project_name,
CASE
WHEN budget > 0 AND budget < 100000 THEN 1
WHEN budget >= 100000 AND budget <= 120000 THEN 2
WHEN budget > 120000 AND budget < 300000 THEN 3
ELSE 4
END budget_weight
FROM project; -- In this particular query we can use the case statment to show a result when we have a certain results. For example, we can see that any budget between 100000 and 120000 will be give the result 2.

SELECT * FROM employee;

USE sample3;
SELECT emp_fname, emp_lname,
CASE
WHEN emp_no > 0 AND emp_no < 10000 THEN 1
WHEN emp_no >= 10000 AND emp_no <= 20000 THEN 2
WHEN emp_no > 20000 AND emp_no < 30000 THEN 3
ELSE 4
END employee_seniority
FROM employee; -- Using this query, we see that Matthew Smith, James James and Sybill Moser. Each senior employee works on each of the departments.


USE sample3;
SELECT emp_lname, emp_no
FROM employee
WHERE dept_no = 
(SELECT dept_no
FROM department
WHERE dept_name = 'Marketing'); -- This query isn't working. Or rather, there are no results.

USE sample3;
SELECT dept_no, location
FROM department
WHERE dept_no = 
(SELECT dept_no
FROM employee
WHERE emp_no = 2581); -- This is the department number and location of the employee with the emp_no of 2581.

USE sample3;
SELECT *
FROM employee_enh
WHERE dept_no IN 
(SELECT dept_no
FROM department
WHERE domicile = 'Houston'); -- There is an error because there is no field called domicile in department table.

USE sample3;
SELECT *
FROM employee_enh
WHERE emp_no IN 
(SELECT emp_no
FROM employee_enh
WHERE domicile = 'Seattle'); -- There is no error because there is a field called domicile in employee_enh table.

USE sample3;
SELECT emp_fname, emp_lname
FROM employee_enh
WHERE emp_no IN 
(SELECT emp_no
FROM employee_enh
WHERE domicile = 'San Antonio'); -- Here I used the same query to get the results of the emloyee names for those that live in San Antonio.

-- Paragraph to address.

USE sample3;
SELECT emp_fname, emp_lname
FROM employee
WHERE emp_no IN
(SELECT emp_no
FROM works_on
WHERE project_no IN
(SELECT project_no
FROM project
WHERE project_name = 'Gemini')); -- Here we are using three selection statements to filter what we want. We want employees from the Gemini project.


USE sample3;
SELECT emp_fname, emp_lname
FROM employee
WHERE emp_no IN (SELECT emp_no FROM works_on WHERE project_no IN (SELECT project_no FROM project WHERE project_name = 'Apollo')) 
ORDER BY 1; -- This is a similar query as the one above except I'm searching for  employtees in the apollo project.

USE sample3;
SELECT DISTINCT emp_no, project_no, job
FROM works_on
WHERE enter_date < ANY
(SELECT enter_date
FROM works_on); -- This 

USE sample3;
SELECT DISTINCT emp_no, project_no, job
FROM works_on
WHERE enter_date < ALL
(SELECT enter_date
FROM works_on); -- I DONT THINK THIS IS RIGHT.

*/