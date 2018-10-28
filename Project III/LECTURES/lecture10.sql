-- It is impossible to assign rows to a temporary table because it is a table that is made of other tables.

Use sample3;

INSERT INTO employee_enh Values 
('32390', 'Andy', 'Young', 'Miami'),
('41012','James','Gordon','Boca'),
('43002','Glenn','Spencer','Miami'); -- Here we inserted rows into the table we created. This was not a temp table.

SELECT * FROM employee_enh; -- We would insert these new rows because now we have new employees in the company.

Insert INTO employee VALUES (5555, 'Senora', 'Mujer', 'd4'),(5556, 'Senor', 'Hombre', 'd5'); -- Here I'm inputting values into employee table
SELECT * FROM employee; -- Here I'm checking my new values.
Insert INTO department VALUES ('d4', 'Uranus', 'Miami'),('d5', 'Earth', 'Washington'); -- Here I'm inputting values into department table
SELECT * FROM department; -- Here I'm checking my new values.
Insert INTO project VALUES ('p4', 'Gold', 50000),('p5', 'Silver', 75000); -- Here I'm inputting values into project table
SELECT * FROM project; -- Here I'm checking my new values.
Insert INTO works_on VALUES (5555,'p4','Data Entry','07/01/2007'),(5556,'p5','Data Entry','01/01/2008'); -- Here I'm inputting values into works_on table
SELECT * FROM works_on; -- Here I'm checking my new values.

Use Sample3;
UPDATE works_on 
	SET project_no = 'p1'
	WHERE emp_no = '9031'
		AND project_no = 'p3'; -- This updated the employee with emp_no is 9031 and works on project 3 to project 1.

update works_on
set job = 'Data Entry'
where job is null; -- I updated the employees with the job unknown to data entry.

USE sample3;

update project
	set budget = budget*18.80; -- For the mexican peso, Im converting dollars. 

SELECT * FROM project; -- Here I'm checking my new values. The mexican peso makes the the budgets look bloated.

update project
	set budget = ((budget/18.80)*1.15); -- For the euro, Im converting pesos. Im using euros because its similar to dollars and pesos is too hig a conversion.

SELECT * FROM project; -- see euro results

USE sample3;

update works_on
set job = 'Revenue' -- New job is Revenue
from works_on,project -- I need to combine the tables.
where emp_no > '20000' and works_on.project_no=project.project_no; -- updating employees with a new job, they must have an emp_no greater than 20000.

SELECT * FROM works_on; -- Joined the two tables and set the job to Revenue.

update employee
set dept_no = 'd1'
from employee,department
where emp_lname = 'Smith' and employee.dept_no=department.dept_no; -- I can't believe I was able to do this. YES!!!!

USE sample3;
DELETE FROM employee
WHERE emp_no > 29000; -- Layoffs, delete employees. (1 person).

USE sample3;
DELETE FROM employee
WHERE location = 'Miami'; -- This did not work because Miami is not included in any field/column within the employee table.

USE sample3;
DELETE FROM employee_enh -- A Regular statement
WHERE emp_no in --A filter clause
(SELECT emp_no
FROM employee_enh
WHERE emp_fname LIKE '__h%'); -- Here, we are using the select staement within the where clause to ast as a filter. It seems like select staements can go anywhere.

DELETE FROM employee_enh -- Same as above
WHERE emp_no in -- to be followed by a select statement
(SELECT emp_no
FROM employee_enh
WHERE emp_fname LIKE '__m%'); -- Here we specifiy the last name ends in m.

DELETE FROM employee_enh -- Same as above
WHERE emp_no in 
(SELECT emp_no
FROM employee_enh
WHERE emp_fname LIKE '__r%') -- ending in r

USE sample3;
DELETE FROM employee_enh
WHERE emp_fname LIKE '__h%';  -- Nothing was effected because there are no rows that mmatch this criteria.

USE sample3;
DELETE FROM work_on; -- This works unfortunately, You typed it wrong in the worksheet ('work_on') but I corrected it without realizing it. My table rows are gone now.
-- If you need to clear out the entire table for some reason, this is a way to do it. That is to say, if you dont want to drop the whole table but the rows within.
