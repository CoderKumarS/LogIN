This is a Basic ``Java CRUD Operation Project`` using jsp view page ,servlet for routing and mysql as database.

*To Run the Program :*
First Setup the database and update the basic information of in.sp.database.Database.java file.
Change the user the username, password, and database name as per your database.

Second Configure the MySQL connector from /webapp/WEB-INF/lib/mysqlconnector.jar in buildpath.


*MySQL commands to create the database :*
> CREATE DATABASE myProject;
> USE myProject;
> CREATE TABLE User(sino INT PRIMARY AUTOIMCREMENT, name VARCHAR(100), email VARCHAR(100) UNIQUE, password VARCHAR(100),gender VARCHAR(100)), city VARCHAR(100), dob VARCHAR(100);
> DESC User;

*git link: *
