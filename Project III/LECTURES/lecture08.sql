/*LECTURE 8 - NOT FINISHED */

USE sample3;
CREATE TABLE #project_temp -- Using the hashtag symbol along with the CREATE TABLE will now create a temporary table. 
(project_no CHARACTER(4) NOT NULL, -- The temporary table will be deleted once I close my session of SQL.
project_name CHARACTER(25) NOT NULL); -- This can be a place whee I build a table to look at data that I need.
SELECT * FROM employee_enh; -- Over here I am selecting data from the employee enh table,

/*
	The above table is a temporary table because of the hashtag symbol. This indicates 
	to the program that the table belongs in the temdb system database instead of the 
	sample database that I am using. All temporary objects created will disappear once 
	I am finished with the session.
*/


/*
	It seems from the length chosen and the data types of the temporary table above,
	the user is being cautious about the length and data type. We know that the length 
	is a cerain number of characters and that the project name is as well. Because a 
	user  may not know exactly the contents of the rows, they are using characters. 
	Although characters is not an ideal data type to use depending on the fields/rows, 
	we know that this table will be discarded after session is terminated.
*/


/*
	This way of commenting is the best way to write multiline sentences. Using the "--" 
	method is not practical if what we are writing goes beyond a certain amount of characters.
	The "--" is great for commenting on specific query lines. This method is great for 
	explaining and summarizing.
*/

CREATE TABLE #employee_summary ( -- I am creating a table called employee summary, to give information that is on multiple table into one.
	employee_number NVARCHAR (8) NOT NULL, -- Here is the employee number, this is info that can be connected to the employee table is we need to find out more data like first name or last name.
	employee_dept CHAR (2) NOT NULL, -- This is the department of the employee, again I can connect this to the department table and see more info if needed.
	employee_project CHAR (2) NULL -- Here we can connect this field to the project table to see what employee nuber is working on what project.
	);


USE sample3;
SELECT emp_no, emp_lname -- Using a SELECT statement I'm getting the first name and last name of employees
INTO #project_temp1 -- The INTO statement is placing all the data from the SELECT statement  into a new temporary table called "project_temp1"
FROM employee; -- I assume that since I am not creating the temporary table with the create statement, the fields will be like the fields in the table I pulled the data from.

SELECT * FROM #project_temp1; -- This is where the INTO statement data went to. and it seems to have worked judgng from my query results.

SELECT * FROM #project_temp; -- This is the table I created with the CREATE TABLE statement. It has no values/rows within.

/*
	Regarding the output, I feel the INTO statement works better with the temporary tables 
	as actually creating the temporary tables seems to have too many details to work on while 
	just wanting to create something that will be removed after the sessions. Although, it 
	can't be denied that this may be necessary. If a user creates a temporary table, they can 
	still populate it using the SELECT INTO statement so it is not such a tedious task to 
	input every record into the table.
*/

CREATE DATABASE Project; -- Creating a new db called Project.
USE Project; -- I inserted this as not using this statement may create a table in my sample database.
CREATE TABLE students -- New table called students with fields similar to the employee table.
(student_no CHARACTER(10) NOT NULL,
student_fname CHARACTER(25) NOT NULL,
student_lname CHARACTER(25) NOT NULL,
student_major CHARACTER(20) NOT NULL); -- Very much this field is like a job department, only its a subject instead.

INSERT INTO students VALUES (20001,'James','Perez','Physics'); -- Here is my first student with the field information.

/*
	INSERT INTO statement indicates that we will be creating a new record within the specified 
	table. In this case the specific table is called students. VALUES indicates the values of 
	the row that will be filled with. I believe the values have to match the fields data types, 
	in other words you cannot be strings in an integer declared field and vice versa. 
*/

/* - - - - - PROJECT 3 REQUIREMENTS ARE BELOW - - - - - */

USE Project;

/*
	First I'm going to drop the original students table in order to fix the data types more to my liking.
*/

DROP TABLE students; -- Removing the table

CREATE TABLE students( -- Recreating the table
    student_no INTEGER NOT NULL PRIMARY KEY,
    student_fname VARCHAR(35) NOT NULL, 
    student_lname VARCHAR(35) NOT NULL ,
    student_major VARCHAR(20) DEFAULT 'Undeclared'
);
INSERT INTO students VALUES (20001,'James','Perez','Physics'); -- Inputting my previous record because I dropped the table.
INSERT INTO students VALUES (20002,'Nick','Ribeira','Mathematics');
INSERT INTO students VALUES (20003,'John','Smithy','Economics');
INSERT INTO students VALUES (20004,'Hernando','Gonzalez','MechEnigeering');
INSERT INTO students VALUES (20005,'Glenn','Smith','Biology');
INSERT INTO students VALUES (20006,'Jesse','Cruz', 'MgmtInfoSystems');
INSERT INTO students VALUES (20007,'Ron','Hubert', default); -- These are two undeclared students, I'm making sure that my default value will work.
INSERT INTO students VALUES (20008,'Maria','Moro', default);
INSERT INTO students VALUES (20009,'Celia','Beltran','English');
INSERT INTO students VALUES (20010,'Adlin','Cruz','Psychology');

SELECT * FROM students; -- Eveything seems to have worked great, nothing out of the ordinary to report.

CREATE TABLE information(
    student_no INTEGER NOT NULL PRIMARY KEY,
    school_name VARCHAR(35),
    school_location NVARCHAR(20),
    student_major VARCHAR(20) DEFAULT 'Undeclared',
    grad_date DATE NULL
);

INSERT INTO information VALUES (20001,'International University',	'Miami',		'Physics',					'1/1/2019'); -- Inputting my previous record because I dropped the table.
INSERT INTO information VALUES (20002,'Atlantic University',		'Ginsburg',		'Mathematics',				'1/1/2020');
INSERT INTO information VALUES (20003,'West University',			'Ocean Coast',	'Economics',				'5/1/2019');
INSERT INTO information VALUES (20004,'East University',			'Ocean Beach',	'MechEnigeering',			'9/1/2019');
INSERT INTO information VALUES (20005,'International University',	'Miami',		'Biology',					'9/1/2019');
INSERT INTO information VALUES (20006,'West University',			'Ocean Coast',	'MgmtInfoSystems',			'5/1/2020');
INSERT INTO information VALUES (20007,'Atlantic University',		'Ginsburg',		DEFAULT,					'5/1/2020');
INSERT INTO information VALUES (20008,'Atlantic University',		'Ginsburg',		DEFAULT,					'1/1/2020');
INSERT INTO information VALUES (20009,'City College of Arts',		'Dade',			'English',					'9/1/2019');
INSERT INTO information VALUES (20010,'City College of Arts',		'Dade',			'Psychology',				'9/1/2019');


CREATE TABLE school(
    school_name VARCHAR(35),
    school_location VARCHAR(20),
    school_ranking INTEGER,
    School_accreditation VARCHAR(50)
);

INSERT INTO school VALUES ('International University',	'Miami',		2776, 'Florida Accreditation Council');
INSERT INTO school VALUES ('Atlantic University',		'Ginsburg',		4848, 'Florida Accreditation Council');
INSERT INTO school VALUES ('West University',			'Ocean Coast',	882,  'Florida Accreditation Council');
INSERT INTO school VALUES ('East University',			'Ocean Beach',	1011, 'Florida Governor Association of the Arts');
INSERT INTO school VALUES ('City College of Arts',		'Dade',			5691, 'Florida Governor Association of the Arts');

CREATE TABLE majors(
    student_business VARCHAR(20),
    student_computer_sci VARCHAR(20),
    student_education VARCHAR(20),
    student_undeclared VARCHAR(20)
);

