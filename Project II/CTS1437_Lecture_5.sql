USE sample3;

SELECT emp_no, emp_fname, emp_lname
FROM employee
WHERE emp_no IN (29346, 28559, 25348); -- Now I'm selecting employees with their specific employee number.

SELECT emp_fname, emp_lname
FROM employee
WHERE emp_no IN (9031, 18316); -- I'm selecting more employee by specific id numbers.

SELECT DISTINCT (project_no)
FROM works_on
WHERE job IN ('Analyst', 'Manager'); -- Using the distinct only returns unique values from what was selected.

SELECT emp_fname, dept_no
FROM employee
WHERE emp_no NOT IN (253,29346); -- Now using In and not operators

--Specific project not gemini or mercury
SELECT project_no
FROM project
WHERE project_name NOT IN ('Gemini','Mercury')

SELECT emp_lname
FROM employee
WHERE emp_no between 10000 AND 30000;--Using the between operator to select employee numbers between a certain number.

-- which project has a budget between $50k and $100k
SELECT project_name
FROM project
WHERE budget between 50000 AND 100000; -- These boolean operators are imprtant because they can help a user specify what is needed.

SELECT project_name
FROM project
WHERE (budget>=50000) AND (budget<=100000); -- Boolean example using parentheses. 

SELECT emp_lname
FROM employee
WHERE emp_no NOT between 10000 AND 20000; -- Combining Not between operations.
