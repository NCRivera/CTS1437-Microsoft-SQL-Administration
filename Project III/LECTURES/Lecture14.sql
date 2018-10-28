/*LECTURE 14*/


/*  The reason for data loss are divided into four groups as such: 
	Program Errors, Administrator errors, Computer failures, disk failures, 
	and catastrophes.

	Administrator errors means that a human error occurred when someone related 
	to the database created an error accidentally. For example when an user 
	has dropped a table for which they did not intend to drop, this is a human 
	error. Human errors can range from very minor (effecting a row) to catastrophic 
	(effecting a database), although it is less likely to commit a catastrophic 
	error if the databaase is properly backed up.

	Catastrophes, whether from a natural cause like an earthquake or an acciental 
	cause like a fire, is another potencial reason for data loss. Destroying the
	data from a database or the theft of the data can be recovered from as long 
	as you have some kind of recovery tool.

	-----

	I have had a major data loss when my Microsoft Access Database that I use 
	for work was deleted due to human error (me). I was able to recover most of 
	my data that was gathered and worked on because I had backed up the database 
	from earlier in the week.

	-----

	Backup methods include a full database backup, differential backup, transaction 
	log back up, and a file (filegroup) backup. 

	The full database backup captures a database the way it is at the time of the 
	backup. All finished activity up to the capture is recorded. If the full database 
	backup is completed dynamically, any transactions or or actions tat were incomplete 
	at the moement will be captured mid-action.
*/

USE master;
BACKUP database sample3
to disk = 'C:\temp\sample.bak'
with init, compression; 

/*
LINE 1 "USE master;" indicates that I am using the system database 'master' to execute 
		the query on.

LINE 2 "BACKUP database sample" tells the system that I want to backup the database 
		called 'sample'.

LINE 3 "to disk = 'C:\temp\sample.bak'" tells the query where to save the backup files, 
		in this case it is saving the back in a temporary folder called 'temp' in the 
		'C' drive.

LINE 4 "with init, compression;" indicates that the query will overwrite the previous 
		backup created and to compress the backup.


The following was the output message that I received:

Processed 304 pages for database 'sample', file 'sample' on file 1.
Processed 2 pages for database 'sample', file 'sample_log' on file 1.
BACKUP DATABASE successfully processed 306 pages in 0.047 seconds (50.843 MB/sec).
*/

BACKUP LOG sample
	TO DISK = 'C:\temp\sample.bak'

/*
LINE 1 "BACKUP LOG sample" this part of the query indicates the system to backup the 
		log that is called 'sample'.
LINE 2 "TO DISK = 'C:\temp\sample.bak'" indicates to back it up


The following was the output message that I received:

Processed 3 pages for database 'sample', file 'sample_log' on file 2.
BACKUP LOG successfully processed 3 pages in 0.011 seconds (1.819 MB/sec).


	-----

	In the process of backing up the file, I would have just created a backup device 
	under the Server Objects in the backup devices folder. When you right click the 
	particular new backup object and select 'Back up a Database' and select the database 
	from there.

	The only thing that does not have releveance to the class at the moment is to 
	schedule backups with the SQL server managment studio because we do not have a 
	persistance 'real' database.
	
	-----
	
	Database recovery is absolutely necessary in any administration profession because 
	there is no way to tell what data or when it will be lost and the cause. The different 
	options when backing up a database are: Automatic recovery and manual recovery.
	
	You can restore a database and also specify options using T-SQL. The syntax 
	of doing this is the 'RESTORE DATABASE' statement. You must indicate in the statment 
	what database will be restored and after use the FROM statement to select the type of 
	recovery which are either automatic or manual. After this you can select the types of 
	options you want with the recovery like the replace or partial keywords

	It is also possible to restore a database using only the SQL Server Managment Studio by 
	first selecting the database you want to restore and then right click and select task from 
	the list and from those options select restore. After this you cans elect from the different 
	options to restore like database, file, and transaction logs.

	-----

	When restoring the System databases, there are different options depending on the system 
	database we are trying to restore. The 'master' db  only has the option of restoring the 
	Database and the File and Filegroups. With the model database we can restore what the 
	master can restore but also the "page". msdb has the same restore options as the master 
	db and temp db has no restore options as all the objects within it are removed after every 
	session.

	-----

	There are three recovery models when restoring a database: full, bulked-logged, and simple.
	Now I'm going to run a query below to find out how my sample 3 database is backed up.

*/

SELECT DATABASEPROPERTYEX ('sample3', 'recovery');
 -- Here I can see after running the uery that my database has a full recovery model.
 -- Using this query I only receive a single column and a single row indicating the particular model I'm using.
 -- QUERY RESULT: "FULL"

SELECT DATABASEPROPERTYEX ('AdventureWorks2017', 'recovery');
 -- I'm runnign the query above on the sample database I downloaded called AdventureWorks2017.
 -- There doesn't seem to be any too different from my previously run-query.
 -- The result for this query is that the database has a simple recovery model.

SELECT name, database_id, RECOVERY_MODEL_DESC AS model -- This select statement is selecting the name of the database, as well as the id of the database and the recovery model.
FROM sys.databases -- It seems to me that there is a system table which has the information regarding the databases within the database engine.
WHERE name = 'sample3'; -- Here I'm filtering that I want the information regarding my sample3 database.
 -- My query results indicate that my sample3 database has the database ID of 8 and has a FULL recovery model.


SELECT name, database_id, RECOVERY_MODEL_DESC AS the_recovery_model -- Here I am repeating the same query as the previous but with some modifications. I name the third column as "the_recovery_model"
FROM sys.databases; -- I wasnt to find all the databases in my database engine, there should at least be 4 database (the system databases) and my own personal databases.
 -- here are my results (name, id, model type);
     -- master, 1, simple
	 -- tempdb, 2, simple
	 -- model, 3, full
	 -- msdb, 4, simple
	 -- AdentureWorks2017, 5, simple
	 -- db_wikipedia, 6, full
	 -- sample3, 8, full

/* 
	The four types of high-availability components in a database engine are failover clustering,
	log shipping, mirroring, and AlwaysOn.

	Failover clustering  creates a group of redundant node servers so that in the event of a 
	failure, the failed nodes processes can be trasnferred over to another node server to continue 
	the process. the disadvanntage of this is that it is based on one system disk in the computer. 
	If the disk fails, the system fails

	Log shipping is when the server sends the transaction logs of one database to another database.
	The other database is an exact copy and the processes done on the original server wil be done 
	on the backup database. By doing this users can switch over to the other database as the 
	primary one since it was mirrored.
*/