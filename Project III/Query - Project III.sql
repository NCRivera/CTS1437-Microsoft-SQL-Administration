/*	Project III	*/
/* This project consists of two different activities. First, we are submitting every hand-out completed in class from lecture 9 to October 16th. Second, we are going to complete different a group of tasks using the database sample_2 created in class. See the tasks listed below:
		1    Populate at least four columns of the database sample_2, be creative when it comes to the data types of your variables.
		2    Define a primary key for each column and to make use of the foreign concept in a query.
		3    Run at least three queries combining the Select statement and the where clause to obtain responses from our database sample_2.
		4    Define a new column within a table that is the result of an operation using a column that already existed in the table. (hint: the budget example)
		5    Create a temporary table resulting from retrieving two columns from an existing table.
		6    Use a bcp command to export data from one of your tables in the sample_2 database to an output file of your convenience.
		7    Use the sqlcmd utility to query your database from the command prompt (hint: example 15.5)
		8    Backup the sample_2 database and compresses the backup file.
		*/


USE sample3; 

CREATE TABLE students(
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
    student_no INTEGER ,
    school_name VARCHAR(35),
    school_location NVARCHAR(20),
    student_major VARCHAR(20) DEFAULT 'Undeclared',
    grad_date DATE NULL,
	FOREIGN KEY (student_no) REFERENCES students(student_no)
	FOREIGN KEY (school_name) REFERENCES school(school_name)

);

INSERT INTO information VALUES (20001,'International University',	'Miami',		'Physics',					'1/1/2019'); 
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
    school_name VARCHAR(35) PRIMARY KEY,
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
    student_business BIT,
    student_computer_sci BIT,
    student_education BIT,
    student_undeclared BIT
);

SELECT student_no, student_fname, student_lname -- Here I want the student information
	FROM students  -- From the students table
		WHERE student_lname LIKE 'B%'; -- All students whose last name begins with 'B'

SELECT COUNT(student_no) -- I want a count of the students
	FROM students -- FROM the students table
		WHERE student_major = 'Undeclared'; -- FOr those students who have an undeclared major.

SELECT student_no, school_name -- I want the student number and the school name
	FROM information -- FROM the information table
	 WHERE school_location = 'Dade' OR school_location = 'Miami' -- Where the school location is in Miami or Dade
	 ORDER BY 2; -- I want the results ordered by column 2.

Alter Table majors
ADD student_no INTEGER;

INSERT INTO majors(student_no)
SELECT student_no FROM students;

Alter Table majors
ADD	FOREIGN KEY (student_no) REFERENCES students(student_no);

UPDATE majors SET student_science = 1 WHERE student_no = 20001; -- Physics student
UPDATE majors SET student_science = 1 WHERE student_no = 20002; -- Math student
UPDATE majors SET student_business = 1 WHERE student_no = 20003; -- Economics
UPDATE majors SET student_science = 1 WHERE student_no = 20004; -- Mechanical Engineering
UPDATE majors SET student_education = 1 WHERE student_no = 20005; -- Biology
UPDATE majors SET student_computer_sci = 1 WHERE student_no = 20006; -- MIS
UPDATE majors SET student_undeclared = 1 WHERE student_no = 20007; -- Undeclared
UPDATE majors SET student_undeclared = 1 WHERE student_no = 20008; -- Undeclared
UPDATE majors SET student_education = 1 WHERE student_no = 20009; -- English
UPDATE majors SET student_education = 1 WHERE student_no = 20010; -- Psychology

CREATE TABLE #student_school_list 
(
	student_no INTEGER, 
	student_fname VARCHAR(35), 
    student_lname VARCHAR(35),
	school_name VARCHAR(35)
);

INSERT INTO #student_school_list(student_no, student_fname, student_lname)
SELECT student_no, student_fname, student_lname FROM students;

UPDATE #student_school_list SET school_name = 'International University' WHERE student_no = 20001;
UPDATE #student_school_list SET school_name = 'Atlantic University' WHERE student_no = 20002;
UPDATE #student_school_list SET school_name = 'West University' WHERE student_no = 20003;
UPDATE #student_school_list SET school_name = 'East University' WHERE student_no = 20004;
UPDATE #student_school_list SET school_name = 'International University' WHERE student_no = 20005;
UPDATE #student_school_list SET school_name = 'West University' WHERE student_no = 20006;
UPDATE #student_school_list SET school_name = 'Atlantic University' WHERE student_no = 20007;
UPDATE #student_school_list SET school_name = 'Atlantic University' WHERE student_no = 20008;
UPDATE #student_school_list SET school_name = 'City College of Arts' WHERE student_no = 20009;
UPDATE #student_school_list SET school_name = 'City College of Arts' WHERE student_no = 20010;

SELECT * FROM #student_school_list;

/*	I ran the BCP command in my command prompt and took a screenshot and included my results. 
		bcp_cmd_1
		MyNameOutput.txt
	*/

/*	I ran the sql command in my command prompt and took a screenshot and included my results. 
		sql_cmd_1
		MyTableOutput.txt
	*/

USE master;
BACKUP DATABASE sample3
	TO DISK = 'C:\temp\sample.bak'
	WITH INIT, COMPRESSION; 
