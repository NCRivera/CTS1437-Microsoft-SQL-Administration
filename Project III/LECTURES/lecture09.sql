USE sample3;
select employee.*,department.*
from employee inner join department on employee.dept_no = department.dept_no; 
-- The Inner join seems to join the two tables together; anything from one table is joined to another table using this dept_no key.
-- We have 7 employees working in different departments.
-- dept_no cannot be the primary key for this new table because each dept is not usique to each employee.

select employee.*, department.*
from employee, department
where employee.dept_no = department.dept_no; -- I'm able to join the two table with the = symbol connecting the two
-- This seems to be an inner join as well, I read the book and I believe this is a natural join.

Use sample3;
select emp_no, project.project_no, job, enter_date,project_name, budget
from works_on join project
on project.project_no = works_on.project_no
where project_name = 'Apollo'
order by 4; -- Another join but with a clause to filter the rows.

-- Job Categories: Analyst, Clerk, Manager.
-- Enter Dates: 10.01.06, 01.04.07, 04.15.07, 08.01.07.
-- Analyst, Null.
select works_on.emp_no, emp_fname, emp_lname, project.project_no, job, enter_date,project_name, budget
from works_on join project
on project.project_no = works_on.project_no
join employee on works_on.emp_no = employee.emp_no
where job is null; -- This query shows the emplyees who have a job of NULL, UNK.

Use sample3;
select emp_fname,emp_lname
from employee join works_on
on employee.emp_no = works_on.emp_no
where enter_date < '06.30.2007'; -- Query shows the employee who entered before 06/30/2007 using a join. The enter_date field is on a separate table.

select emp_fname,emp_lname
from employee join works_on
on employee.emp_no = works_on.emp_no
where enter_date > '12.31.2006'; -- Query shows the employee who entered before 06/30/2007. We need to join these tables to get the info requested.

Use sample3;
select emp_lname
from works_on join employee on works_on.emp_no = employee.emp_no
join department on employee.dept_no=department.dept_no
and location = 'Dallas'
and job = 'Clerk'; -- Here I got the last names of the employees that work in Dallas and work as a clerk.

-- I had to join three tables to make the query work. You can join an infinite amount of tables if possible, though unlikely.
-- The book says 644, theoretically it's unlimited.


select *
from works_on join employee on works_on.emp_no = employee.emp_no
join department on employee.dept_no=department.dept_no; -- Here I am getting all the details of each person and job, although some employees are shown more than once.
-- Redundant information due to employees working on multiple projects in different jobs.

select project_name
from department join employee
on department.dept_no = employee.dept_no
join works_on on employee.emp_no = works_on.emp_no
join project on works_on.project_no = project.project_no
where dept_name = 'Research'; -- The only thing that I can interpret from this query is that the research department works on Apollo, Mercury and Gemini projects.
-- For this information, we could've created a much simpler query.

select project_name, emp_fname, emp_lname, job
from department join employee
on department.dept_no = employee.dept_no
join works_on on employee.emp_no = works_on.emp_no
join project on works_on.project_no = project.project_no
where dept_name = 'Research';
-- I would run a different query from the original, I need to add more field names to the query. As it originally was, the only information was the one field of project_name.
-- This query is for more information other than just project_name. I added some employee information to the query

Use sample3;
Select project.*, works_on.*
from project cross join works_on; -- This cartesian join does not make sense in this context. Each row from one table is mmatching another row in the other table. This gives us nothing to interpret.

use sample3;
select employee.*, department.*
from employee cross join department; -- Here is the second cross join, we can get no information from this.

Use sample3;
select employee_enh.*, department.location
from employee_enh join department on domicile <> location; -- Dallas and Seattle employees show as a result because they do not match on the employee_enh table.

Use sample3;
select employee_enh.*, department.location
from employee_enh join department on domicile = location; -- In this query we can see that James Smith works and lives in the same place.

use sample3;
select employee_enh.domicile, department.*
from employee_enh right outer join department on domicile <> location; -- Shows us where an employee lives and works.



use sample3;
select employee_enh.domicile, department.*
from employee_enh right outer join department on domicile = location; -- The query shows us all the rows of the right table and only the lines of the left table that match with the right table. If no match, domicile is null.
-- Right outer join matches two tables, the right table will show all rows and if the left table matches will show a value. Otherwise it will be null for no matches.


USE sample3;
SELECT emp_fname, emp_lname, domicile, location
FROM employee_enh JOIN department
ON location > domicile; -- Thhis join is matching using the locations, it seems to be matching every single instance of a persons name but every location is different.

USE sample3;
SELECT emp_fname, emp_lname, domicile, location
FROM employee_enh JOIN department
ON location < domicile; -- Here, the only change on made was the less than sign replaced the greater than sign. It seems to be ordering the location in place of domicile.

USE sample3;
CREATE TABLE seattle_dept
(dept_no CHAR(2) NOT NULL,-- data type were chosen because of the types of characters in the rows, though it says dept_no it contains a letter and a number. So we can't choose a number type.
dept_name CHAR(15) NOT NULL); -- depat name is going to be characters due to it only being letters and no numbers.

INSERT INTO seattle_dept (dept_no, dept_name)
SELECT dept_no, dept_name
FROM department
WHERE location = 'Seattle'; -- The query used a select statement to insert rows, not  manual T-SQL statement inutting each rows.

SELECT * FROM seattle_dept; -- We can see what is in here as a result of the previous query run. The select statement selected what was to be inserted.

USE sample3;
CREATE TABLE project_budget -- The new table will be called project budget.
(project_no CHAR(2) NOT NULL, -- The first field is project_no, like in our other tables.
project_name CHAR(15) NOT NULL); -- second field is project name, all data type and lengths match our other fields in other tables with the same name.

INSERT INTO project_budget (project_no, project_name) -- Now we insert new rows.
SELECT project_no, project_name -- These are the field names from the other tables
FROM project -- Specifically we are pulling from the project table.
WHERE budget > 80000; -- We're filtering by the budget.

SELECT * FROM project_budget; -- And these are the results of what I just did. We can see here we inserted three new rows.

--the tabe below is marketing department. I'm going to use the concepts above to fill it with rows.
CREATE TABLE marketing_department
(emp_no int null, -- I'm matching my fields with the employee table.
emp_fname char(20) null, -- My rows will be coming from the employee table
emp_lname char(20) null);

INSERT INTO marketing_department (emp_no, emp_fname, emp_lname) -- Here I specifiy the fields but I dont believe I need to do this.
SELECT emp_no, emp_fname, emp_lname -- These are the fields Im pulling from
FROM employee -- The table where the query is getting the rows.
WHERE dept_no = 'd3'; -- I just realized I named my marketing department wrong from a previous lecture, I called it Mercury.

SELECT * FROM marketing_department; -- I'm checking my results.

USE sample3;
CREATE TABLE Analyst_t -- This is a much easier way to populate tables once there is info in other tables
(emp_no INT NOT NULL,
project_no CHAR(4) NOT NULL,
enter_date DATE);

INSERT INTO Analyst_t (emp_no, project_no, enter_date) -- I'm now populating these tables with employees who have their job as analysts
SELECT emp_no, project_no, enter_date
FROM works_on
WHERE job = 'Analyst' -- First filter 'ANALAYST'
AND emp_no < 10000; -- A second filter 'HIGHER EMPLOYEE NUMBER'

SELECT * FROM Analyst_t; -- These are my results, only one employee, it seems.

-- Paragraph to address.
USE sample3;
CREATE TABLE clerk_t -- I'm using the same query as above but I will create a table for clerks.
(emp_no INT NOT NULL,
project_no CHAR(4) NOT NULL,
enter_date DATE);

INSERT INTO clerk_t (emp_no, project_no, enter_date) -- Populating the table from works on table.
SELECT emp_no, project_no, enter_date -- These are the fields I'm using.
FROM works_on -- From the works_on tablle as it gives information regarding employee and job on a project.
WHERE job = 'Clerk'; -- All employees with job of 'CLERK'

SELECT * FROM clerk_t; -- These are my results. I used clerk because it had ore employees than the manager job.


/*SUMMARY - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

In this lecture we learned joins, although I cannot specifiy what exactly what I would need a join for, 
I can tell it is an extremely powerful tool as it can easily combine tables and show the results of such queries.

The tool that I know what is for is populating a created table using a combination of the insert and select statement.
This is useful to immediately populate a table instead of inserting values one at a time.
Ofcourse, we wil need rows from other tables to be populated but this seems to me a powerful tool either way.
Using the select statement along with what we learned for that particular query can help us to be very 
specific in what is inserted into a table.

*/