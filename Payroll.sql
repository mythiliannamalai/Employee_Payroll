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

--UC-5 retrieve salary data for a particular employee

select Salary as salary from Employee_Payroll  where Joining_Date between cast('2022-04-18' as date )and getdate();

--UC-6 add Gender to Employee Payroll Table and Update the Rows
alter table Employee_Payroll add Gender varchar(1)
update Employee_Payroll set Gender='M';
update Employee_Payroll set Gender='F' where Emp_Name in ('Mythili','Lavanya');

--UC-7 find sum, average, min, max and number of male and female employees
--1. Sum
select sum(Salary)as male from Employee_Payroll where Gender='M' group by Gender
union all
select sum(Salary)as female from Employee_Payroll where Gender='F'  group by Gender;

 --2. average
select avg(Salary) from Employee_Payroll where Gender='M' group by Gender
union all
select avg(Salary) from Employee_Payroll where Gender='F'  group by Gender;

--3. Maxmium
select max(Salary) from Employee_Payroll where Gender='M' group by Gender
union all
select max(Salary) from Employee_Payroll where Gender='F'  group by Gender;

--4. Minium
select min(Salary) from Employee_Payroll where Gender='M' group by Gender
union all
select min(Salary) from Employee_Payroll where Gender='F'  group by Gender;
 --5. Count
select count(Salary) from Employee_Payroll where Gender='M' group by Gender
union all
select count(Salary) from Employee_Payroll where Gender='F'  group by Gender;

--UC-8 extend employee_payroll data to store employee information like employee phone, address and department
--Department
alter table Employee_Payroll add Departments varchar(50)
update Employee_Payroll set Departments='Manager'where Gender='F';
update Employee_Payroll set Departments='HR'where Gender='M';

--Address
alter table Employee_Payroll add Employee_Address varchar(50);
update Employee_Payroll set Employee_Address ='Tamil nadu'; 

--Phone mumber
alter table Employee_Payroll add Emp_Phone_No bigint;
update Employee_Payroll set Emp_Phone_No=9790486505 where Departments='Manager';
update Employee_Payroll set Emp_Phone_No=9790486506 where Departments='HR';

