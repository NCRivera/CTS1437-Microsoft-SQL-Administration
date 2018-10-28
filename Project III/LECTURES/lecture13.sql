/*LECTURE 13*/


/* 
	The four different system databases are "master", "model", "tempdb",  "msdb".

	----

	For the queries we have executed throughout the lectures, we have used a lot of the system 
	databases. In regards to the master database, it contains and manages all of the databases 
	we have used up to this point and the connections and users connected.
	
	The model system database was used when we create a database running a query.
	
	The tempdb system database was used when I created temporary tables in previous queries such 
	as #ProjectTemp_1 in the lecutre 9 handout. It is the most used database of the system databases 
	because every query run and objects created are stored within this database. The results of 
	all of my queries were stored in this database as well.

	We have not had an instance where we have used the msdb database because I have not scheduled 
	any tasks for automated actions to be completed.
	
	----

	The features of the system environment include the system databases, disc storage, utilities, 
	the DBCC Command and policy-based management.
	
	System Databases contain all the information created in the system. It stores all of our tables, 
	created objects, and databases.

	Disk Storage is how all the information on the database environments are stored. All information 
	is allocated using the Disk storage aspect of SQL Server.

	Utilities contained within the system environment include the following features: 
	bcp ("Bulk Copy Program"), sqlcmd, and sqlserver. bcp allows the users to copy data from a 
	database using a textfile to another database. sqlcmd is what allows a user to execute T-SQL 
	statements. sqlserver allows us to create a new instance for SQL Server. 
	
	DBCC or console commands allow the user to execute statements to the database engine directly 
	regarding instances or anything that has to do with the instance of a system. 
	
	Policy Management allows the user to write policies in regards to instances within the server.
	
	----

	The page header is where information regarding the system is stored like object ID's

	###PICK THREE THINGS FROM TABLE 15-1 and do the worksheet.###

	The difference between In-row data pages and row overflow data pages is that the first stores row 
	information up to 8000 bytes on one page. Overflow pages store the information that exceeds 8060 
	bytes of information. The length of the row is the primary factor when it comes to these two things 
	because In row data pages have a limit.

*/


USE sample3;
CREATE TABLE myTable2 (
	col1 VARCHAR(1000), -- This row will have the length of 1000
	col2 VARCHAR(3000), -- Column 2 has the length of 3000.
	col3 VARCHAR(3000), -- Column 3 is 3000 characters long.
	col4 VARCHAR(3000)); -- This has the same length of the previous 3 columns
INSERT INTO myTable2
	SELECT 
	REPLICATE ('a', 1000), -- This particular replicate placed the character 'a' is col1 and multiplied it 1000 times.
	REPLICATE ('b', 3000), -- In this part the value 'b' was replicated 3000 times
	REPLICATE ('c', 3000), -- The next two replcates created a 3000 length character after the letter inside the parentheses.
	REPLICATE ('d', 3000);
		-- The keyword "Replicate" replicated the previous string the number of times that was indicated after that string.

-- Parallel processing of tasks is when you process (execute) database tasks like bulk load, backup, query executions, and indexing at the same time.

/*
	Utilities that can be utilized in SQL Server are bcp ("Bulk Copy Program"), sqlcmd, and sqlserver. 
	
	With the bcp utility you can copy the data from another database into another relational database using a file.
		
	With the sqlcmd utility we can execute T-SQL statements to manipulate the data in a database.

	With the sqlserver utility a user can create new instances in SQL Server.
*/

/*
-- bcp AdventureWorks2017.Person.Address out "address.txt" -T -c
    --After I ran the above command in the command prompt, I received a lot of information.
		-- The prompt first indicates that it sttarts copying.
		-- The SQL state is indicated, in this case it is "S1000"
		-- I received an Error/warning telling me that BCP import will convert empty string to null in delimited columns.
		-- I receive how many rows are copied successfully, saying that they are bulk-copied to host-file. The total is given.
		-- After everything is copied, I receive a line indicating how many rows are copied, for me it is 19614 rows.
		-- the network packet size is indicated in bytes, mine is 40996.
		-- Another line indicates the time it took, mine was 94 milliseconds. The average rows a second is given also, it was 208659 rows a second for me.*/

/*	According to the book the option "-c" specifies the batch terminator to be the whatever the user inputs, 
	the default value is GO and the default terminator is the semi-colon (;).*/

/*  
	The general form of the sqlcmd utility T-SQL statement is "sqlcmd" then followed by the options and parameters 
	for those options if necessary. The four of the following are options for the "sqlcmd" statement are: 
	"-S" to specify the server name, 
	"-U" for specifying login, 
	"-P" for specifying the password of a login, 
	"-c" will specify the batch terminator.

	"-i" in the sqlcmd utility is specifically for specifying a file with a stored procedure or batched procedure. 
	This is a utility specification that can be combined with the "-o" command to execute saved files and output 
	a report for example.*/


/*  
	I used the following command in the command prompt.
		sqlcmd
		use sample3;
		Select * from project
		Exit(Select @@rowcount)

	The output I get from this is a a sort of command prompt SQL query. It displays the project table of my 
	sample database. Before the table is displayed I have a message indicating the database context to the 
	sample database. The command prompt indicates that 5 rows were effected. Below this is a row count of 
	my project table which is 5. Below that "1 row effected" is displayed.

	I used the following command in the command prompt to get rows from the department table.
		sqlcmd
		use sample3;
		Select top 3 * from department
		Exit(Select @@rowcount)
	This gives me department table with the top 3 rows and indicates 3 rows effected.*/

/*  
	Using the sqlcmd in the ccommand prompt is very useful. If for some reason I cannot use the SSMS I can use 
	the command prompt to execute my T-SQL commands. I exeucted the following command:
	
		sqlcmd -q "Use Sample3; Select emp_name, emp_lname From employee_enh;" -o C:\User\Nicholas\Desktop\output.txt
	
	After I ran this command I received a message "Changed database context to 'sample3'." From here i received 
	the two fields I used in my select statement from the employee_enh table in the database specified. "7 rows 
	effected is displayed" and the command prompt will then wait for me to input more commands, I used Exit command 
	I just learned in this case. With this command I was able to Create a text file named output.txt on my desktop on 
	my home computer. The following is my output file.

Changed database context to 'sample3'.
emp_fname            emp_lname           
-------------------- --------------------
Matthew              Smith               
Ann                  Jones               
Elke                 Hansel              
Elsa                 Bertoni             
Sybill               Moser               
Andy                 Young               
Glenn                Spencer             

(7 rows affected)

	I like the fact that the sqlcmd utility is this useful.*/

/*  
	The sqlservr utility is a useful way to start a database engine instance as indicated in the book.
	The most important options for the sqlservr utility is "-f", "-m", "-s". -m is a very useful command because 
	it can allow a user to perform maintenance on a database with issues. it can also  be used to restore system databases, 
	especially the most important which is the master database.*/

/*  Temporary databases are stored in the system database named tempdb*/

/*  
USE model;
GO
ALTER DATABASE model 
MODIFY FILE
    (NAME = modeldev,
    SIZE = 4MB); -- This particular query does not work I received the error "MODIFY FILE failed. Specified size is less than or equal to current size." I have to complete this manually using properties from object explorer.
*/

/*  The key terms and concepts of policy-based management are: managed target, target set, facet, condition, policy, category.
		
		Examples of managed targets can be server instances, databases, and tables. All these managed targets form a hierarchy.
	
		Target set refers to a set of hierarchy of managed targets that have filters applied to them.

		Facets are propeties\characteristics that can be applied to specified manage targets. Some facets can be applied or not 
		applied depending on the users intention when making one.
		
		Condition is a Boolean expression that can be specified by the user to indicate what to do to managed targets.
	
		A policy specifies one condition and the corresponding behavior when that condition is met in regards to a managed 
		target.
		
		A group of policies is called a category. All databases must be subscribed to a specific policy or they will be defaulted 
		to the systems default policy category. */

/*  
instances, tables are able to specify conditions*/

/*  YOU CANT DISABLE CLR*/
