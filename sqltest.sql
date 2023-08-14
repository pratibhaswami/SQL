#Q.1)
create database sqltest;
create table account (ano int , name varchar(20), address varchar(20));
insert into account values(101, 'niraj pawar', 'pune'),(102, 'rohan jadhaw', 'banglore'),(103, 'ali ansari', 'mumbai'),(104, 'fatima begam', 'pune'),
(105, 'niraj pawar', 'banglore'),(106, 'rohan jadhaw', 'mumbai');
select * from account;

create table transact(trNo int, trNoacNo int,amount int, type varchar(10), dot date);
insert into transact values(001, 101 , 2500,'withdraw','2017-12-21'),(002, 102 , 2500,'deposite','2017-11-01'),(003, 103 , 2000,'withdraw','2017-06-22'),
(004, 104 , 1500,'deposite','2017-05-12'),(005, 105 , 4500,'withdraw','2017-10-27'),(006,106 , 3200,'deposite','2017-12-20');
select * from transact;

#Q.1)
#i)
select *  from transact where type = 'withdraw' ;
#ii)
select trNoacNo, amount from transact where dot ='2017-05-12';
#v)
select trNoacNo, count(*) from transact group by trNoacNo having count(*) > 1;
#vi)
select ano, name from account where address not  in ('pune', 'banglore');
#vii)
select ano,name from account where address = 'pune';

#Q.4)
#i)
alter table emp add column eid int,ename varchar(10),eadd varchar(10); 

#ii)
alter table emp add column eid int,ename varchar(10); #to add
alter table emp drop column ename; #to 

#iii)
select * from emp order by salary desc limit 1,1;

#iv)
selcet max(salary) from emp;

#11)
drop : drop command is used to delete the perticular coulumn in the table
delete : delete is used to delete the perticulate row in a table, also, to delete the table with table structure
truncate : is used to delete the table but the structure of table will be remained same

#12)
unique : if we want all the value to be unique, then we should we unique consraints
primary key : it is used to apply unique kay as well as not null constraints

#9) we can find duplicate by using group by clause and after we can apply having clause with count function 
#for example:
select name, count(*) from emp GROUP BY name having count(*) > 1;
whatever is greater than 1, we can delete that records.

#10)
suppose, we have 2 tables parent and child
alter table parent add foreign key(pid) reference parent(pid)

#13)advantages :
1) it's very simple to understand
2)faster query language
3)portable : means can use anywhere
4) standrand language than other database language

disadvantage:
1)cost insufficient
2)security issues may occur 
3)poor interface
