show databases;
use fusion;
show tables;
select * from emp;
insert into emp values(103,'sanskruti','mathpati',80000,1200),(104,'sangmesh','mathpati',90000,1500),(105,'stuti','swami',70000,2000),
(106,'ketaki','swami',65000,2200),(107,'siddhesh','mathpati',80000,2400),(108,'sweety','swami',80000,1200),(109,'tanu','mathpati',80000,2100),
(110,'rudransh','mathpati',98000,1100);

#arithmetic operator (+ - * /)
select (salary - bonus) as total_salary from emp; #it could be + - as per req

#comparision operator (=,<,<=,>,>=,!=)
select * from emp where salary != 98000; #it could be < > <= >= !=

#logical operator (and, or, in, not in, between)
select * from emp where lname = 'swami' and bonus = 10000; #if condition doesn't meet, it will return empty table with table structure
select * from emp where lname = 'swami' or bonus = 10000; #it will return both condition's all row record
select * from emp where id = 108; # for single access 
select * from emp where id != 108; # to exclude that single one 
select * from emp where id in (102,105); #IN opetor is used for multiple access
select * from emp where id not in (102,105); #NOT IN operator is used for excluding that perticular ones
select * from emp where salary between 50000 and 80000; #in between range will be picked

#like operator
select * from emp where firstName like 's%'; #start with s
select * from emp where firstName like '%I'; #it is not case sensitive #ends with import table from
select * from emp where firstName like '_a%'; #skips first letter and start forword from a
select * from emp where firstName like '%s_'; #skips last letter and start back from s
select * from emp where firstName like '%sh%'; #find any value that have 'sh' at any position
select * from emp where firstName like '%e__'; #double undercsore to skips 2 letters
select * from emp where firstName like 's%h'; #find any key that starts with s and ends with h