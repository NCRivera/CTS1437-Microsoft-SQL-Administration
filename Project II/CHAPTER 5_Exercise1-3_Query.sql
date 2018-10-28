USE master;

-- CHAPTER 5, EXERCISE 1
CREATE DATABASE test_db
	ON (NAME=testdb_dat,
		FILENAME = 'C:\tmp\test_db.mdf',
		SIZE = 5MB,
		MAXSIZE = UNLIMITED,
		FILEGROWTH = 8%)
LOG ON
	(NAME=test_db_log,
		FILENAME = 'C:\tmp\test_db_log.ldf',
		SIZE = 2MB,
		MAXSIZE = 10MB,
		FILEGROWTH = 500KB);

-- CHAPTER 5, EXERCISE 2
ALTER DATABASE test_db
	ADD LOG FILE 
	(NAME=emp_log,
		FILENAME = 'C:\tmp\emp_log.ldf',
		SIZE = 2MB,
		MAXSIZE = UNLIMITED,
		FILEGROWTH = 2MB);

-- CHAPTER 5, EXERCISE 3
ALTER DATABASE test_db
	MODIFY FILE 
	(NAME=testdb_dat,
		SIZE = 10MB);

/*
-- CHAPTER 5, EXERCISE 4

In the table Employee, the fields that contain the NOT NULL constraint are emp_no, emp_fname, emp_lname. dept_no is the only field with the NULL constraint.
In the table department, the fields that contain the NOT NULL constraint are dept_no and dept_name. location has the NULL constraint in the table.
In the table project, the fields that contain the NOT NULL constraint are project_no, project_name. The budget field containts the NULL constraint.
In the table works_on, the fields that contain the NOT NULL constraint are emp_no, project_no. job and enter_date are the fields with the NULL constraint.

NOT NULL values required a value to be placed into it, they cannot be left NULL. They are required.


-- CHAPTER 5, EXERCISE 5
dept_no and project_no are defined as CHAR values because they contain both a alpha character and a numeric character. Character datatype can take both letters and numbers. If I were to use an integer datatype, I would not be able to use a letter in the field.