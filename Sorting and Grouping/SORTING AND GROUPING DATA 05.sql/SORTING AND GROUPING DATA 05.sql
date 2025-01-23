-- CREATING DATABASE
create database COUNTRYPERSONS_DATA;
USE COUNTRYPERSONS_DATA;

-- CREATING COUNTRY TABLE
create table Country (
ID int primary key,
Country_name varchar(100),
Population bigint,
Area float
);

-- INSERTING VALUES TO COUNTRY TABLE
insert into Country (ID, Country_name, Population, Area)
values
(1, 'USA', 331002651, 9833517),
(2, 'Canada', 37742154, 9984670),
(3, 'Brazil', 211049527, 8515767),
(4, 'India', 1380004385, 3287263),
(5, 'China', 1393409038, 9596961),
(6, 'Australia', 25499884, 7692024),
(7, 'Germany', 83783942, 357022),
(8, 'Russia', 145934462, 17098242),
(9, 'Japan', 126476461, 377975),
(10, 'Mexico', 128933395, 1964375);

select * from Country;

-- CREATING TABLE PERSONS
create table Persons( 
ID int primary key,
Fname varchar(50),
Lname varchar(50),
population bigint,
Rating decimal(2,1),
Country_Id int,
Country_name varchar(100),
foreign key (Country_Id) references Country(ID)
);

-- INSERTING VALUES TO PERSONS TABLE
insert into Persons(ID, Fname, Lname, Population, Rating, Country_Id, Country_name)
values
(1, 'John', 'Doe', 331002651, 5, 1, 'USA'),
(2, 'Jane', 'Smith', 37742154, 4, 2, 'Canada'),
(3, 'Carlos', 'Garcia', 211049527, 3, 3, 'Brazil'),
(4, 'Ravi', 'Sharma', 1380004385, 5, 4, 'India'),
(5, 'Wei', 'Zhang', 1393409038, 4, 5, 'China'),
(6, 'Emma', 'Johnson', 25499884, 3, 6, 'Australia'),
(7, 'Max', 'Müller', 83783942, 5, 7, 'Germany'),
(8, 'Olga', 'Petrova', 145934462, 2, 8, 'Russia'),
(9, 'Taro', 'Yamamoto', 126476461, 5, 9, 'Japan'),
(10, 'Maria', 'Martinez', 128933395, 4, 10, 'Mexico');

select * from Persons;

#1. PRINT FIRST 3 CHARACTERS OF COUNTRY_NAME FROM THE COUNTRY TABLE
select LEFT(Country_name,3) as Countryprefix from Country;

#2. CONCATENATE FIRST NAME AND LAST NAME FROM PERSONS TABLE
select concat(Fname,' ',Lname) as Full_Name from persons;

#3. COUNTING THE UNIQUE COUNTRY NAMES FROM PERSONS TABLE
select count(distinct Country_name) as Unique_countries from Persons;

#4. MAXIMUM POPULATION FROM THE COUNTRY TABLE
select max(Population) as Max_population from Country;

#5. MINIMUM POPULATION FROM PERSONS TABLE
select min(population) as Minimum_population from persons;

#6. ADDING 2 VALUES TO PERSONS TABLE WITH NULL Lname
insert into Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
values
(11, 'Lucas', NULL, 50000000, 3, 1, 'USA'),
(12, 'Sophia', NULL, 70000000, 4, 2, 'Canada');

-- COUNT LNAME FROM PERSON TABLE
select count(Lname) as Lname_count from persons;

#7. TOTAL NUMBER OF ROWS IN PERSONS TABLE
select count(*) as Total_Rows from persons;

#8. POPULATION OF FIRST 3 ROWS IN COUNTRY TABLE
select Population from Country limit 3;

#9. 3 RANDOM ROWS OF COUNTRY TABLE
select * from Country order by rand() limit 3;

#10. PERSONS ORDERED BY THEIRRATING IN DESCENDING ORDER
SELECT * FROM PERSONS order by rating desc;

#11. TOTAL POPULATION FOR EACH COUNTRY IN PERSONS TABLE
SELECT Country_name, sum(population) as Total_Population from persons
group by Country_name;

#12. COUNTRIES WITH TOTTAL POPULATION GREATER THAN 50000
select Country_name,sum(population) as Total_Population from persons
group by Country_name having sum(Population) > 50000;

#13. TOTAL NUMBER OF PERSONS AND AVERAGE RATE OF EACH COUNTY,ONLY FOR COUNTRIES WITH MORE THAN 2 PERSONS
select Country_name, count(*) as Total_persons, avg(Rating) as avg_rating
from persons
group by Country_name having count(*)>2
order by avg_rating asc;