-- CREATING DATABASE
create database Employees;

use employees;

-- CREATING TABLE MANAGERS
CREATE TABLE Managers (
Manager_ID int primary key,
First_Name varchar (50) not null,
Last_Name varchar (50) not null,
DOB date not null,
Age int check (Age>18 and Age<65),
Last_Update timestamp not null default current_timestamp,
Gender char(1) check (Gender in ('M','F','O')),
Department Varchar (50) not null,
Salary decimal (10,2) not null
);

insert into Managers (Manager_Id, First_Name, Last_Name, DOB, Age, Gender, Department, Salary) 
VALUES
(101, 'Ivan', 'Jacob', '1991-01-15', 33, 'M', 'Finance', 38000),
(102, 'Jenifer', 'George', '1990-03-22', 34, 'F', 'IT', 48000),
(103, 'Saif', 'Khan', '1985-07-12', 39, 'M', 'IT', 26000),
(104, 'Aaliya', 'Kalam', '1995-11-08', 28, 'F', 'HR', 29000),
(105, 'Salini', 'Pillai', '1992-02-25', 32, 'F', 'Finance',52000),
(106, 'Sharon', 'Sam', '1988-05-19', 36, 'F', 'IT', 35000),
(107, 'Daniel', 'Grace', '1992-09-30', 32, 'M', 'Sales', 47000),
(108, 'christ', 'john', '1991-04-14', 33, 'M', 'IT', 39000),
(109, 'Edwin', 'David', '1983-06-10', 41, 'M', 'Marketing', 45000),
(110, 'Arya', 'Ravi', '1986-12-18', 38, 'F', 'HR', 29000);

SELECT * FROM MANAGERS;

-- RETRIVING NAME AND DOB OF MANAGER_ID 101
select First_Name,Last_Name,DOB
from Managers
where Manager_ID = 101;

-- ANNUAL INCOME OF ALL MANAGERS
select Manager_ID,First_Name,Last_Name,(salary * 12) as Annual_Income
from Managers;

-- DISPLAYING RECORDS OF ALL MANAGERS EXCEPT Aaliya
select * from Managers
where First_Name != 'Aaliya';

-- DISPLAYING IT DEPARTMENT MANAGERS WITH SALARY ABOVE 25000 
select * from Managers
where Department= 'IT' and Salary>25000;

-- DISPLAYING LIST OF MANAGERS WITH SALARY 10000 TO 35000
select * from Managers
where Salary between 10000 and	35000;
