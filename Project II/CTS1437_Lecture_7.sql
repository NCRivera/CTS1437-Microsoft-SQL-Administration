USE chapter7;

SELECT emp_fname, emp_lname
FROM employee
WHERE emp_lname LIKE '___s%'; -- I seem to need a placeholder for the first 2 characters before s

SELECT emp_fname,emp_no
FROM employee
WHERE emp_no LIKE '__3%'; -- Searches for anything with the third character as 3.

SELECT dept_name, location
FROM department
WHERE location like '_[A-D]%'; -- Searches for anything with the second character from A to D.

SELECT emp_fname, emp_lname, emp_no
FROM employee
WHERE emp_no like '[1-4]%'; -- Searches for anything which begins with he numbers 1 to 4.

SELECT emp_no,emp_lname
FROM employee
WHERE emp_lname LIKE '[^BS]%'; -- Searches for anything that does not begin with B and S.

SELECT emp_no,emp_lname, emp_fname
FROM employee
WHERE emp_no LIKE '[^1-5]%'; -- Searches for anything which does not begin with the numbers 1 to 5.

SELECT emp_no,emp_lname, emp_fname
FROM employee
WHERE emp_fname LIKE '[^A-D]%'; -- Searches for anything that does not begin with the letters A to D.

SELECT emp_no, emp_fname, emp_lname
FROM employee
WHERE emp_lname NOT LIKE '%m'; -- Searches for anything that end with the letter M.

SELECT emp_no, emp_fname, emp_lname
FROM employee
WHERE emp_lname LIKE '%s'; -- Searches for anything that end with the letter S.

SELECT location, dept_name
FROM department
WHERE dept_name LIKE '%g'; -- Searches for anything that end with the letter g.

SELECT project_no, project_name
FROM project
WHERE project_name LIKE '%[,]%'; -- I don't really understand this query and the next one. I need to read the book.

SELECT project_no, project_name
FROM project
WHERE project_name LIKE '%!_%'escape'!'; -- Don't understand, see book.

SELECT enter_date
	FROM works_on
	GROUP BY enter_date;

SELECT emp_fname, emp_lname
	FROM employee
	GROUP BY emp_fname, emp_lname;

SELECT *
	FROM works_on
