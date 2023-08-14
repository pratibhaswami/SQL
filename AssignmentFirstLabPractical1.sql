#lab practical No 1
show databases;
create database assignment;
use assignment;
create table employee(employee_id int, first_name varchar(10), last_name varchar(10), email varchar(20), phone_number int,hire_date date, job_id int, salary int, commission_pct int , manager_id int, department_id int);

#EMPLOYEES (Employee_Id, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Id, Salary, Commission_Pct,Manager_Id, Department_Id)

insert into employee values( 1,'tanu','swami','tanu@gmial.com',1234567891,'2001-12-11',101,4800,0.00,201,111),
( 2,'sweety','patil','sweety@gmial.com',1233267889,'2001-2-2',102,4000,0.00,90,20),
( 2,'sanu','sapu','sapu@gmial.com',1234588889,'2001-01-12',103,4200,0.00,100,30),
( 2,'abc','fds','abc@gmial.com',1232367889,'2001-11-02',104,4400,0.00,101,40),
( 2,'def','fddf','def@gmial.com',1234567889,'2001-11-12',102,4800,0.00,102,50),
( 2,'mnp','dfgd','mnp@gmial.com',1234567889,'2001-11-12',102,4900,0.00,103,60),
( 2,'pqr','fdgd','pqr@gmial.com',1234567889,'2001-11-12',102,4000,0.00,104,70),
( 2,'xyz','dfgd','xyz@gmial.com',1234567889,'2001-11-12',102,4800,0.00,105,80),
( 2,'sanu','austin','sanu@gmial.com',1234567889,'2001-11-12',102,4000,0.00,106,90),
( 2,'sanu','austin','sanu@gmial.com',1234567889,'2001-11-12',102,4000,0.00,107,100);
select * from employee;

# a) Find out the employee id, names, salaries of all the employees
select employee_id, first_name, last_name, salary from employee;

# b) List out the employees who works under manager 100
select * from employee where manager_id <= 100;

# c) Find the names of the employees who have a salary greater than or equal to 4800
select * from employee where salary >= 4800;

# d) List out the employees whose last name is ‘AUSTIN’
select * from employee where last_name = 'austin';

# e) Find the names of the employees who works in departments 60,70 and 80
select * from employee where department_id in (60,70,80);

# f) Display the unique Manager_Id
select manager_id from employee where 

#lab practical No 2
create table client_master(clientNo int, cName varchar(20),address varchar(20), city varchar(20), State varchar(20), bal_due int);

# a ) Insert five records
insert into client_master values( 123,'monika','katraj','pune','maharashtra',4500),( 134,'monika','katraj','pune','maharashtra',5000),
( 145,'monika','katraj','pune','maharashtra',5500),( 156,'monika','katraj','pune','maharashtra',3000),
( 123,'monika','katraj','pune','maharashtra',6000);
select * from client_master;

# b ) Find the names of clients whose bal_due> 5000
select cName from client_master where bal_due > 5000;

#c ) Change the bal_due of ClientNO “ C123” to Rs. 5100
set sql_safe_updates = 0;
update client_master set bal_due = 5100 where clientNo = 123;

# d ) Change the name of Client_master to Client12 
alter table client_master rename  client12;
select * from client12;

#e ) Display the bal_due heading as “BALANCE”
alter table client12 rename column bal_due to balance;

#lab practical no 3
Create table teacher (name varchar(20), deptNo int, doj date, deptName varchar(20), location varchar(20), salary int);

#a ) Insert five records
insert into teacher values('b.d sir',101,'2010-11-04','math','latur',100000),('l.s sir',101,'2010-11-04','commerce','latur',100000),
('tugave sir',101,'2010-11-04','english','latur',100000),('swami sir',101,'2010-11-04','cse','science',100000),
('devarshe sir',101,'2010-11-04','cse','computer',100000);
select * from teacher;

#b ) Give Increment of 25% salary for Mathematics Department
update teacher set salary = salary + ((salary*25)/100) where deptName = 'math';

#c ) Give Increment of 15% salary for Commerce Department
update teacher set salary = salary + ((salary*15)/100) where deptName = 'commerce';

#lab practical no 4
create table sales(salesNo int, salesName varchar(20), branch varchar(20), salesamount int , dob date);

#a ) Insert five records
insert into sales values(101,'abc','cse',5000,'2001-12-11'),(102,'def','it',6000,'2001-06-11'),
(103,'abc','cse',5000,'2001-12-11'),(104,'abc','cse',5000,'2001-02-11'),(105,'abc','cse',5000,'2001-07-11');
select * from sales;
set sql_safe_updates = 0;
update sales set branch = 'it' where salesNo = 104;

#b) Calculate total salesamount in each branch
select branch,sum(salesamount) from sales group by branch;

#c ) Calculate average salesamount in each branch 
select branch,avg(salesamount) from sales group by branch;

#d ) Display all the salesmen, DOB who are born in the month of December as day in character format i.e. 21-Dec-09
select salesName,dob from sales where monthname(dob) = 'december';

#e ) Display the name and DOB of salesman in alphabetical order of the month.
select salesName,monthname(dob) from sales order by monthname(dob) asc;

#lab practical number 5
#Create an Emp table with the following fields:(EmpNo, EmpName, Job,Basic, DA, HRA,PF, GrossPay, NetPay)
#(Calculate DA as 30% of Basic and HRA as 40% of Basic)
create table Emp(Emp_No int  primary key, Emp_Name varchar(25) not null, Designation varchar(25),Emp_Basic int);

insert into Emp values(4019,'Talatam Venkatesh','Director',10000);
insert into Emp values(4039,'Gumaa','Technical Engineer',15000);
insert into Emp values(4015,'Anudeep Varma','Technical Engineer',12000);
insert into Emp values(4016,'I Vasudeva Varma','Technical Engineer',13000);
insert into Emp values(4027,'Uday Reddy','Director',16000);
insert into Emp values(4006,'Sai Mani','Director',10000);
select * from Emp;

#Updating Attributes DA, HRA, PF, Gross pay, Net Pay ?
# Adding coloumn to table and Updating Attributes DA
alter table Emp add  Emp_DA int;
select * from Emp;
set sql_safe_updates = 0;
update Emp set Emp_DA=(30/100)*Emp_Basic;

# Adding coloumn to table and Updating Attributes HRA
alter table Emp add(Emp_HRA int);
update Emp set Emp_HRA=(40/100)*Emp_Basic;

# Adding coloumn to table and Updating Attributes PF
alter table Emp add (Emp_PF int);
update Emp set Emp_pf= Emp_basic*(12/100);

# Adding coloumn to table and Updating Attributes Gross Pay
alter table Emp add (Emp_Grosspay int);
update Emp set Emp_grosspay= EMp_hra+emp_da+emp_basic;

# Adding coloumn to table and Updating Attributes Net Pay
alter table Emp add (Emp_netpay int);
update Emp set Emp_netpay=emp_grosspay-emp_pf;
select * from Emp;

#( b ) Display the employees whose Basic is lowest in each department . 
select min(Emp_Basic) from Emp group by Designation;

#( c ) If NetPay is less than <Rs. 10,000 add Rs. 1200 as special allowances .
update Emp set Emp_netpay = Emp_netpay + 1200 where Emp_netpay < 10000;

#( d ) Display the employees whose GrossPay lies between 10,000 & 20,000
select * from Emp where emp_grosspay between 10000 and 20000;

#( e ) Display all the employees who earn maximum salary .
select * from Emp where emp_grosspay = (select max(emp_grosspay) from employee);

#Lab Practical No: 6
#creating dept table
create table dept(deptno int primary key, dname varchar(30) not null, loc varchar(30) not null);

#creating emp table
create table emp1(empno int primary key, ename varchar(20) not null, job varchar(20) not null, mgr int references emp(empno), hiredate date not null, sal int not null, comm int, deptno int);

#Inserting data into Dept table
insert into dept values(101, 'FINANCE','SYDNEY');
insert into dept values(102, 'AUDIT','MELBOURNE');
insert into dept values(103, 'MARKETING',' PERTH');
insert into dept values(104, 'PRODUCTION','BRISBANE');
insert into dept values(105, 'Humanresource',' hyderabad');

#Inserting data into Emp table
insert into emp1(empno, ename ,job, hiredate, sal, deptno) values (68319,'KAYLING','PRESIDENT','1991-11-18',6000.00,101);
insert into emp1 (empno, ename ,job,mgr, hiredate, sal, deptno) values (66928,' BLAZE',' MANAGER',68319,'1991-01-09', 2750.00,103);
insert into emp1(empno, ename ,job,mgr, hiredate, sal, deptno) values(67832,' CLARE',' MANAGER',68319,'1991-11-18', 2550.00,101);
insert into emp1(empno, ename ,job,mgr, hiredate, sal, deptno) values(65646,'JONAS',' MANAGER',68319,'1991-04-02', 2957.00,102);
insert into emp1(empno, ename ,job,mgr, hiredate, sal, deptno) values(67858,'SCARLET','ANALYST', 65646,'1997-04-19', 3100.00,102);
insert into emp1(empno, ename ,job,mgr, hiredate, sal, deptno) values(69062,' FRANK','ANALYST', 65646,'1991-12-03', 3100.00,102);
insert into emp1(empno, ename ,job,mgr, hiredate, sal, deptno) values(63679,'SANDRINE',' CLERK', 69062,'1990-12-18', 900.00,102);
insert into emp1(empno, ename ,job,mgr, hiredate, sal,comm, deptno) values(64989,' ADELYN','SALESMAN', 66928,'1991-02-20', 1700.00,400, 103);
insert into emp1(empno, ename ,job,mgr, hiredate, sal,comm, deptno) values(65271,' WADE',' SALESMAN', 66928,'1991-02-22', 1350.00,600, 103);
insert into emp1(empno, ename ,job,mgr, hiredate, sal,comm, deptno) values(66564,'MADDEN','SALESMAN', 66928,'1991-07-28', 1350.00,1500, 103);
insert into emp1(empno, ename ,job,mgr, hiredate, sal,comm, deptno) values(68454,' TUCKER',' SALESMAN', 66928,'1991-07-08', 1600.00, 0, 103);
insert into emp1(empno, ename ,job,mgr, hiredate, sal, deptno) values(68736,'ADNRES',' CLERK', 67858,'1997-05-23', 1200.00,102);
insert into emp1(empno, ename ,job,mgr, hiredate, sal, deptno) values(69000,' JULIUS',' CLERK', 66928,'1991-12-03', 1050.00,103);
insert into emp1(empno, ename ,job,mgr, hiredate, sal, deptno) values(69324,'MARKER',' CLERK', 67832,'1992-01-23', 1400.00,101);
insert into emp1(empno, ename ,job,mgr, hiredate, sal, deptno) values(69924,' MARKER',' CLERK', 67832,'1992-01-23', 1400.00,104);

#a)Update the employee salary by 15%, whose experience is greater than 30 years.
update emp1 set sal=sal+((15/100)*sal) where (sysdate()-hiredate)/365>30;

#update emp set sal=sal+(sal*0.15) where (sysdate-hiredate)/365>30; #another way
select * from emp1;

#b)Delete the employees, who completed 30 years of service.
delete from emp1 where (sysdate()-hiredate)/365>30;

#c)Display the manager who is having maximum number of employees working under him?
#create view
create view mgrcount as select mgr, count(empno) total from emp1 group by mgr;
select mgr from mgrcount where total in (select max(total) from mgrcount);

#d)Create a view, which contain employee names and their manager
create view employee_manager as select e2.ename from emp1 e2
where mgr=e2.empno;
