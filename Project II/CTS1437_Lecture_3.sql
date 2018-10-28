CREATE DATABASE sample3; -- Database Creation.

USE sample3; -- Using the created database.

CREATE TABLE employee 	(emp_no INTEGER NOT NULL,
                       	emp_fname CHAR(20) NOT NULL,
					   	emp_lname CHAR(20) NOT NULL,
					   	dept_no CHAR(4) NULL); -- Creating the first table in my new database.

CREATE TABLE department	(dept_no CHAR(4) NOT NULL,
						dept_name CHAR(25) NOT NULL,
						location CHAR(30) NULL); -- Creating the second table in my database. It's called department.

CREATE TABLE project	(project_no CHAR(4) NOT NULL,
						project_name CHAR(15) NOT NULL,
						budget FLOAT NULL); -- FLOAT is an integer with decimal points.

CREATE TABLE works_on	(emp_no INTEGER NOT NULL,
						project_no CHAR(4) NOT NULL,
						job CHAR(15) NULL,
						enter_date DATE NULL); -- Making certain fields that can be blank by placing Null constraint in them.

-- Now I'm going to be inserting my data into the employee table.
INSERT INTO employee VALUES(25348, 'Matthew', 'Smith',     'd3');
INSERT INTO employee VALUES(10102, 'Ann',     'Jones',     'd3');
INSERT INTO employee VALUES(18316, 'John',    'Barrimore', 'd1');
INSERT INTO employee VALUES(29346, 'James',   'James',     'd2');
INSERT INTO employee VALUES(9031,  'Elke',    'Hansel',    'd2');
INSERT INTO employee VALUES(2581,  'Elsa',    'Bertoni',   'd2');
INSERT INTO employee VALUES(28559, 'Sybill',  'Moser',     'd1');

--Now I'm going to be inserting my data into the department table.
INSERT INTO department VALUES('d1', 'Research',   'Dallas');
INSERT INTO department VALUES('d2', 'Accounting', 'Seattle');
INSERT INTO department VALUES('d3', 'Mercury',    'Dallas');

-- Now I'm going to be inserting my data into the project table.
INSERT INTO project VALUES('p1', 'Apollo', 120000.00);
INSERT INTO project VALUES('p2', 'Gemini', 95000.00);
INSERT INTO project VALUES('p3', 'Mercury', 186500.00);

-- Now I'm going to be inserting my data into the works_on table.
INSERT INTO works_on VALUES(10102, 'p1', 'Analyst', '2006.10.1');
INSERT INTO works_on VALUES(10102, 'p3', 'Manager', '2008.1.1');
INSERT INTO works_on VALUES(25348, 'p2', 'Clerk',	'2007.2.15');
INSERT INTO works_on VALUES(18316, 'p2', NULL,		'2007.6.1');
INSERT INTO works_on VALUES(29646, 'p2', NULL,		'2006.12.15');
INSERT INTO works_on VALUES(2581,  'p3', 'Analyst', '2007.10.15');
INSERT INTO works_on VALUES(9031,  'p1', 'Manager', '2007.4.15');
INSERT INTO works_on VALUES(28559, 'p1', NULL,		'2007.8.1');
INSERT INTO works_on VALUES(28559, 'p2', 'Clerk',	'2008.2.1');
INSERT INTO works_on VALUES(9031,  'p3', 'Clerk',	'2006.11.15');
INSERT INTO works_on VALUES(29346, 'p1', 'Clerk',	'2007.1.4');

SELECT * FROM department;
SELECT * FROM project; 
SELECT * FROM employee;
SELECT * FROM works_on; -- Now I'm going to look at all my tables and data input.