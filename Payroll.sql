--UC-1 create database
create database Payroll;

--UC-2 create table
create table Employee_Payroll(
Emp_Id int identity not null Primary key,
Emp_Name varchar(50),
Salary bigint,
Joining_Date datetime);

select * from Employee_Payroll

--UC-3 Insert values
insert into Employee_Payroll(Emp_Name,Salary,Joining_Date) values
('Mythili',75000,'2022-04-18'),
('Naveen kumar',100000,'2022-04-18'),
('Lavanya',40000,'2022-04-18'),
('Santhosh',50000,'2022-04-18'),
('Kiruba',40000,'2022-04-18');

--UC-4 retrieve all the employee payroll data

select * from Employee_Payroll;
