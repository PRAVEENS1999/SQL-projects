-- CREATING DATABASE
create database Workers;
use workers;

-- CREATING A TABLE

create table Worker(
Worker_Id int,
FirstName char(25),
LastName char(25),
Salary int(15),
JoiningDate datetime,
Department char(25)
);

desc worker;

insert into Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
values
(1, 'John', 'Doe', 55000, '2020-01-15 09:00:00', 'Sales'),
(2, 'Jane', 'Smith', 60000, '2019-03-22 09:00:00', 'Marketing'),
(3, 'Alice', 'Johnson', 45000, '2021-07-10 09:00:00', 'HR'),
(4, 'Bob', 'Brown', 75000, '2018-12-05 09:00:00', 'IT'),
(5, 'Charlie', 'Davis', 70000, '2022-04-18 09:00:00', 'IT'),
(6, 'Eve', 'Martinez', 65000, '2020-06-25 09:00:00', 'Operations'),
(7, 'David', 'Wilson', 72000, '2017-11-12 09:00:00', 'Finance'),
(8, 'Sophia', 'Taylor', 50000, '2021-01-05 09:00:00', 'HR'),
(9, 'James', 'Anderson', 80000, '2019-08-20 09:00:00', 'IT'),
(10, 'Olivia', 'Thomas', 55000, '2022-09-15 09:00:00', 'Marketing');

select * from  Worker;

#1. ADDING NEW RECORD TO THE TABLE USING IN PARAMETERS

delimiter //
create procedure Adding_New_Worker( in p_Worker_Id int, in p_FirstName char(25), in p_LastName char(25), in p_Salary int(15),
 in p_JoiningDate datetime, in p_Department char(25))
 begin
 insert into Worker values (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department);
end //
delimiter ;

call Adding_New_Worker (11, 'Michael', 'Philip', 80000, '2023-01-10 09:00:00', 'HR');


#2. IN AND OUT PARAMETER FRO RETRIVE SALARY AND RETURNS TO P_SALARY PARAMETER

delimiter //
create procedure GetSalaryByWorkerID( in p_Worker_Id int, out p_salary int)
begin
select salary into p_salary
from worker 
where Worker_Id = p_Worker_Id;
end //
delimiter ; 

set @Worker_salary = 0;
call GetSalaryByWorkerID (3, @Worker_salary);
select @Worker_salary as  Worker_Salary;

#3. UPDATING THE DEPARTMENT OF THE WORKER WITH THE WORKER ID USING IN PARAMETER

delimiter //
create procedure UpdateWorkerDepartment( in P_Worker_Id int, in P_Department char (25))
begin 
update Worker 
set Department = P_Department
where Worker_Id = P_Worker_Id;
end; //
delimiter ;

call UpdateWorkerDepartment (4,'Finance');

#4. RETRIVE THE NUMBER OF WORKERS IN THE GIVEN DEPARTMENT AND RETURNS IT IN THE P_WORKERCOUNT PARAMETER

delimiter //
create procedure GetWorkerCountByDepartment( in P_Department char(25), out P_WokerCount int)
begin
select count(*) into P_WokerCount from worker	
where Department = P_Department;
end;//
delimiter ;

set @workerCount = 0;
call GetWorkerCountByDepartment('IT',@WorkerCount);
select @workerCount as Worker_Count_In_Department;

#5. RETRIVE THE AVERAGE SALARY OF ALL WORKERS IN GIVEN DEPARTMENT AND RETURNS IT IN P_AVGSALARY

delimiter //
create procedure GetDepartmentAverageSalary( in P_Department char(25), out P_AvgSalary decimal(10,2))
begin
select avg(salary) into P_AvgSalary
from Worker
where Department = P_Department;
end;//
delimiter ;
set @dept_avg_salary = 0;
call GetDepartmentAverageSalary ('IT', @dept_avg_salary);
select @dept_avg_salary as Department_Average_Salary;