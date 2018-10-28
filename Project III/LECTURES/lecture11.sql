/* - - - LECTURE 11 - - - */

USE sample3;

SELECT emp_fname, emp_lname -- Here I'm selecting the employee names fields
FROM employee -- From the employee table
WHERE NOT EXISTS -- Im indicating that I do not want with will come in the next select query
(SELECT * FROM department -- Here is an sub suery
WHERE employee.dept_no <> department. dept_no  -- Where the two fields are not equal
AND location = 'Dallas'); -- After I ran the query, there were no results. I believe the issue is on the second where clause, within the subquery.
-- I'm not too sure on how to modify the query, it is too complicated and multiple tries of modifying the query yields no results or errors.

SELECT emp_fname, emp_lname -- Here I'm selecting the employee names fields
FROM employee -- From the employee table
WHERE EXISTS -- Im now creating another query mimicking the one aboce but simplifying the query.
	(Select * from department where location = 'Dallas'); -- Here I want everyone who was from dallas
	--This query gives me results, The previous one was too difficult to salvage. I used the subquery to select everyone from dallas then I have the other query give s the employee information from the employee table.

USE sample3;
CREATE TABLE bonus1 -- Creating a new table in my db
(pr_no CHAR(4), -- pr_no will be four characters long
bonus1 INT DEFAULT 200); -- Bonus column will default to 200

INSERT INTO bonus1(pr_no) VALUES('p1'); -- In this query I just inserted the pr_no and because it has a default value for the other column, it will work.


USE sample3;
MERGE INTO bonus1 B
USING (SELECT project_no, budget
FROM project) E
ON (B.pr_no = E.project_no)
WHEN MATCHED THEN
UPDATE SET B.bonus1 = E.bonus1*0.05
WHEN NOT MATCHED THEN
INSERT (pr_no, bonus1)
VALUES (E.project_no,E.budget*0.25); -- This is an extremely complicated query and I can't understand it. There is an error in it that I tried to fix but nothing I do seems to work. Specifically I thought the bonus name was misnamed "bonus" instead of "bonus 1"
 -- I am supposed to explain my output but I received an error as explained previously, I cant tell what is happening.


USE sample3;
CREATE TABLE employmenttoday -- Creating a new table called employmenttoday
(emp_num INT NOT NULL, -- emp_num is an integer
experience CHAR(15) DEFAULT 5); -- experience is 15 characters long and is defaultred to 5.

INSERT INTO employmenttoday(emp_num) VALUES('20000'); -- Since I have a default in the other field name i only need to add a value in employee number

SELECT * FROM employmenttoday; -- I can see the results of my query with this. I see that 5 was defaulted to the emplyee that was added.

USE sample3; -- Im using the sample db
MERGE INTO employmenttoday B -- Im going to merge employementtoday with another table
USING (SELECT emp_no, job -- From the works_on table
FROM works_on) E -- The following is from the employment table
ON (B.emp_num = E.emp_no)
WHEN MATCHED THEN -- If they match it will update experience to FT
UPDATE SET B.experience = 'FT'
WHEN NOT MATCHED THEN
INSERT (emp_num, experience) -- If not it will insert the emplyee number and experience
VALUES (E.emp_no,E.job); -- to the missing values from the works_on table

SELECT * FROM employmenttoday; -- I received a completely odd result, I received the employee number like I was supposed to but the experience table is completely wierd
--It seems my query has placed a job instead of experince when the queries did not match I do not know what happened But I think it has to do with the fact that I
