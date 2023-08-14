#Joins :  A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
#1) inner join : it display only matchong record based on conditions
show databases;
use fusion;
select * from user; #uid and uname are present
create table order1(oid int, oname varchar(10),uid int);
insert into order1 values(1,'mobile',102),(2,'laptop',101),(3,'computer',102),(4,'smartwatch',104),(5,'headphone',105);
select * from order1; #oid,oname,uid present

#1)inner join
select user.uname, orders.oname 
from user 
inner join orders 
on user.uid = orders.uid; 
#only matching records will be displayed


#2) left outer join
select user.uname, orders.oname 
from user 
left outer  join orders 
on user.uid = orders.uid; 
#inner join plus remaining left side's records

#3) right outer join
select user.uname, orders.oname 
from user 
right outer join orders 
on user.uid = orders.uid; 
#inner join plus remaining right side's records

#4) full outer join
select user.uname, orders.oname 
from user 
full outer join orders 
on user.uid = orders.uid; 
#doesn't support in Mysql (however, it will return inner join plus left join plus right join)
 