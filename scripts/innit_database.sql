 /* 
 ==============================================
 CREATE DATABASE AND DATAWAREHOUSE LAYER SCHEMAS
 ==============================================
 SCRIPT Main Purpose:
	This script is required to create the database names "Datawarehouse" and before we create it we check if it already exisits in our workspace, 
	if it is, it would be dropped and recreated alltogether. We also set up the three schemase for our three layers in the architecture we are building 
	in this database (gold, silver, bronze layers)

 WARNINGS!:
	Running this script in its entirety will drop the entire database called Datawarehouse if it exists already. ALL THE DATA AND SCHEMA created 
	will ALL be PERMANENTALY DELETED. So proceed with atmost caution and ENSURE we have the REQUIRED BACKUPS, if we have to run this scripts
*/
 
 -- Create Database Warehouse
 USE master;
 GO

 --Drop the database if it already exists so we can recreate the data base
 IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawarehouse')
 BEGIN
	ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Datawarehouse;
 END;
 GO


 CREATE DATABASE Datawarehouse;

 USE Datawarehouse;

 CREATE SCHEMA bronze;
 GO
 CREATE SCHEMA silver;
 GO
 CREATE SCHEMA gold;
 GO

