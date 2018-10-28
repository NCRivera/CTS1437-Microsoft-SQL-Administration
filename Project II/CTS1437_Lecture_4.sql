USE Sample3;

SELECT * FROM employee;


SELECT dept_no, dept_name, location
	FROM department; -- From assignment. Selecting fields from a table.


SELECT project_no, project_name, budget
FROM project -- The projects with the highest budgets are Apollo and Mercury


SELECT * 
FROM department
WHERE location='Dallas'; -- Now Im selecting the departments located in Dallas.

/*THIS IS THE SECOND PAGE*/


SELECT emp_lname, emp_fname
FROM employee
WHERE emp_no>=15000; -- EMPLOYEE QUERY NOW. There are 4 employees that are shown with this query: Matthew, John, James, Sybill.

SELECT project_name
FROM project
WHERE budget*0.79>50000; -- Apollo, Gemini, and Mercury are the results of this query.

SELECT project_name
FROM project
WHERE budget*0.25>50000; -- At exchange 0.25, there are no projects.

SELECT project_name
FROM project
WHERE budget*0.50>50000; -- At exchange 0.50, Apollo and Gemini are the result.

SELECT project_no, emp_no
FROM works_on
WHERE project_no='p1' OR project_no='p3'; -- THERE IS NO PRIMARY KEY IN THIS RESULT BUT emp_no is the primary key from the works_on table.

SELECT project_no, emp_no
FROM works_on
WHERE emp_no='10102' OR emp_no='9031'; -- Project number cannot be a primary key, the projects can occur for multiple people.

SELECT Distinct emp_fname
FROM employee
WHERE emp_lname = 'Moser'; -- Is there a lot of people with this last name? Query results in one name.

SELECT Distinct emp_fname
FROM employee
WHERE emp_lname = 'james' OR emp_lname = 'Smith'; -- Capital letter doesn't seem to effect the query.

SELECT emp_no, emp_fname, emp_lname
FROM employee
WHERE emp_no = 25348 AND emp_lname = 'Smith'
OR emp_fname = 'Matthew' AND dept_no = 'd1'; -- I have a feeling I will need parentheses to specify the AND's and OR's

SELECT emp_no, emp_fname, emp_lname
FROM employee
WHERE ((emp_no = 25348 AND emp_lname = 'Smith')
OR emp_fname = 'Matthew') AND dept_no = 'd1'; -- WHAT IS THE PARENTHESIS DOING?? This second query is not retreiving any data. The parentheses are a mess.

SELECT emp_no,emp_fname,emp_lname
FROM employee
WHERE (emp_no = 25348 AND emp_lname = 'Smith')
OR (emp_fname = 'Matthew' AND dept_no = 'd1'); -- Matthew is showing up from the first Where clause but not the second because matthew is not working on project d1. Parentheses looks better.

SELECT emp_no,emp_fname,emp_lname
FROM employee
WHERE ((emp_no = 25348 AND emp_lname = 'Smith')
OR emp_fname = 'Matthew') AND dept_no = 'd1'; -- This is the same as a previous query, the AND is making it not work.


SELECT emp_fname, emp_lname
FROM employee
WHERE NOT dept_no = 'd1'; -- The employees no in department one.