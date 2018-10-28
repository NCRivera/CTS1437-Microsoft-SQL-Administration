/* LECTURE 16 */

/*	The three compenents of the database engine that are used in the automation system are the following: 
		SQL Server Service,
		Windows Application Log,
		SQL Server Agent Service.

	The SQL Server Service (MSSQLSERVER) is used to write events to the Windows Application Log. After the events 
	are written to the Windows Application Log, the the Windows Application Log will then notify the SQL Server 
	Agent Service about the existing events written. After being notified about the written event, SQL Server Agent 
	Service will take an action after this on the Server or application.
	*/

/*	Data mail is in the eterprise edition of the MS SQL Server 2016 that allows a user to send an email notifications 
	to users to show things like query results and send files to users.
	*/

/*	In order to create a job there are generally three steps: 
		Create the job and its steps,
		Create a schedule of the job execution if the job is not to be executed on demand,
		Notify operators of the status of the job execution.
	*/

/*	Three different ways a job can be defined is using Transact-SQL statements, using CmdExec, and invoking a program 
	using a personally written code in a programming language like Python or Visual Basic.

	We can create a job using the SQL Server Management Studio by writng Transact-SQL scripts or using the SQL Server 
	Agent by expanding it and right-clicking "New jobs" and setting up the job using New Job Dialog Box.
	*/

/*	I'm attaching screenshot indicating the process I followed to Create a job and creating a job schedule.
	