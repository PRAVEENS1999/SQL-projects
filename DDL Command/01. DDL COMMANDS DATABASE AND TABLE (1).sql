-- DDL COMMANDS 
#1. Creating a Database
CREATE DATABASE School;

USE School;

-- CREATING TABLES
#1. STUDENT TABLE
 
 CREATE TABLE STUDENT(
 Roll_NO int primary key,
 Name varchar (50),
 Marks int,
 Grade char(1)
 );
 
 -- INSERTING DATA IN TABLE 
 insert into STUDENT (Roll_no,Name,Marks,Grade) values
 (1,'Ajay',85,'A'),
 (2,'John',95,'A'),
 (3,'Richard',72,'B'),
 (4,'Shalini',68,'B'),
 (5,'Roshini',80,'A'),
 (6,'Angel',59,'C');
 
 -- DISPLAYING THE TABLE
 select * from STUDENT;
 
 -- MODIFYING  WITH ALTER
 alter table STUDENT add Contact varchar(15);
 
 -- DROP A COLUMN WITH ALTER
 alter table STUDENT
 drop column Grade;
 
 -- RENAME THE TABLE
 rename table STUDENT to CLASSTEN;
 
 -- TRUNCATE A TABLE
 truncate table CLASSTEN;
 
 -- DROP A TABLE
 drop table CLASSTEN;
 
 
 
 