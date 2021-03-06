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

select * from Employee_Payroll;
--UC-8 extend employee_payroll data to store employee information like employee phone, address and department

alter table Employee_Payroll add Department varchar(20);
alter table Employee_Payroll add Address varchar(20) default 'tamilnadu';
alter table Employee_Payroll add Pnone_number bigint;
update Employee_Payroll  set Department ='HR' where Emp_Name in('Mythili','Lavanya');
update Employee_Payroll  set Department ='Manager' where Emp_Name in('Naveen kumar','Santhosh','Kiruba');
update Employee_Payroll  set Address='Tamilnadu';
update Employee_Payroll set Pnone_number=9790486505 where Emp_Name='Mythili';
update Employee_Payroll set Pnone_number=9790486506 where Emp_Name='Naveen Kumar';
update Employee_Payroll set Pnone_number=9790486528 where Emp_Name='Lavanya';
update Employee_Payroll set Pnone_number=9629490277 where Emp_Name='Santhosh';
update Employee_Payroll set Pnone_number=9629486506 where Emp_Name='Kiruba';
select * From Employee_Payroll;
--UC-9 extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay

alter table Employee_payroll add Deductions int;
alter table Employee_payroll add Taxable_Pay int;
alter table Employee_payroll add Income_Tax int;
alter table Employee_payroll add Net_Pay int;

--UC-10 Make Terissa as part of sales and marketing

insert into Employee_payroll(Emp_Name,Salary,Joining_Date,Gender,Department,Address,Pnone_number,Deductions,Taxable_Pay,Income_Tax,Net_Pay) values
('Terissa',50000,'2022-04-22','F','Sales','Tamilnadu',9994813652,15000,1500,200,35000),
('Terissa',50000,'2022-04-22','F','Marketing','Tamilnadu',9875652452,15000,1500,200,35000);
 
 --UC-11 ER-Diagram and create new table

 create table Depatment_Id(
 Emp_Id int identity foreign key references Employee_Payroll(Emp_Id),
 Department_Id int);

insert into Depatment_Id(Department_Id) values(101),(105),(101),(105),(105),(103),(104);

select * from Depatment_Id;

select Employee_Payroll.Emp_Name,Employee_Payroll.Salary,Joining_Date,Gender,Department,Address,Pnone_number,Deductions,Taxable_Pay,Income_Tax,Net_Pay from Employee_Payroll  full outer join Depatment_Id on Employee_Payroll.Emp_Id=Depatment_Id.Emp_Id;
