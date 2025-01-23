-- CREATING A DATABASE
create database COUNTRYDETAILS;
USE COUNTRYDETAILS;

-- CREATING  TABLE COUNTRY
create table COUNTRY (
ID int primary key,
Country_name varchar(50) not null,
Population int not null,
Area decimal (10,2)
);

-- CREATING  TABLE PERSONS
create table PERSONS(
ID int primary key,
Fname varchar(50),
Lname varchar(50),
population int not null,
Rating decimal (2,1),
Country_id int,
Country_name varchar(100)
);

-- INSERTING VALUES INTO COUNTRY TABLE
insert into COUNTRY(ID, Country_name, Population, Area)
value
(1, 'USA', 331002651, 9833517),
(2, 'India', 1380004385, 3287263),
(3, 'China', 1393409038, 9596961),
(4, 'Brazil', 212559417, 8515767),
(5, 'Canada', 37742154, 9984670),
(6, 'Australia', 25499884, 7692024),
(7, 'Germany', 83783942, 357022),
(8, 'UK', 67886011, 243610),
(9, 'Russia', 145934462, 17098242),
(10, 'France', 67022000, 551695);

-- INSERTING VALUES INTO PERSONS TABLE
insert into PERSONS(ID, Fname, Lname, population, Rating, Country_id, Country_name)
value
(1, 'Edwin', 'Mathew', 1000000, 4.5, 1, 'USA'),
(2, 'John', 'Luther', 2000000, 4.3, 2, 'India'),
(3, 'Jackie', 'Chan', 1500000, 4.8, 3, 'China'),
(4, 'Emily', 'clark', 500000, 3.9, 4, 'Brazil'),
(5, 'Michael', 'Philip', 1800000, 4.6, 5, 'Canada'),
(6, 'Sarah', 'Mathew', 2500000, 4.7, 6, 'Australia'),
(7, 'Shalini', 'Pillai', 3000000, 4.2, 7, 'Germany'),
(8, 'Ivaniya', 'Mariam', 1200000, 4.1, 8, 'UK'),
(9, 'Thomas', 'Philip', 2200000, 5.0, 9, 'Russia'),
(10, 'Aliya', 'Margret', 4000000, 4.4, 10, 'France');

#1. LIST THE DISTINCT COUNTRY NAMES FROM PERSONS TABLE
select distinct Country_name 
from PERSONS;

#2. SELECT FIRST AND LAST NAMES FROM PERSON TABLE WITH ALIASES
select Fname as First_Name , Lname as Last_Name
from PERSONS;

#3. PERSONS WITH RATING GREATER THAN 4.0
select Fname, Lname, Rating
from PERSONS where Rating>4.0;

#4.COUNTRIES WITH POPULATION GREATER THAN 10 LAKHS
select Country_name
from COUNTRY where Population>1000000;

#5. PERSONS FROM 'USA' OR HAVE A RATING GREATER THAN 4.5
select  Fname, Lname, Country_name, Rating
from PERSONS
where Country_name = 'USA' or Rating > 4.5;

#6. PERSONS WHERE COUNTRY NAME IS NULL
select Fname, Lname
from PERSONS
where Country_Name is null;

#7. persons from the countries 'USA','Canada','UK'
select Fname, Lname, Country_Name
from PERSONS
where Country_Name in ('USA','Canada','UK');

#8. PERSONS NOT FROM THE COUNTRIES 'INDIA' AND 'AUSTRALIA'
select Fname, Lname, Country_Name
FROM PERSONS
WHERE Country_Name not in ('INDIA','AUSTRALIA');

#9. COUNTRIES WITH A POPULATION BETWEEN 5 LAKHS TO 20 LAKHS
select Country_name,Population
from COUNTRY
where Population between 500000 and 2000000;

#10. COUNTRIES WHOSE NAMES DO NOT START WITH C 
select Country_name
from COUNTRY
where Country_name not like 'C%';