#set functions :1) union 2) union all 3) intersect 4)minus

#rules to apply set: 1) number of col in both tables must be same
                     #2)-- data type of both table should be same
                     # If these 2 conditons satisfies then an then onlly we can apply set opeartions,
                     # ELSE we can say, it is voilating the rules

show databases;
use fusion;
show tables;
select * from persons;
alter table persons drop column FirstName;
insert into persons values(20),(40),(60),(80),(100);
select * from persons2;
alter table persons2 drop column Age;
select * from persons2;
insert into persons2 values(20),(40),(60),(80),(100),(30),(90);
rename table persons2 to b;
select * from b;

#union : returns all values in both column excluding duplicate (mns, unique value returns)
select * from a 
union 
select * from b;

#union all : return all values including dulicates (hints :  will return  whole first col and whole second col)
select * from a 
union all
select * from b;

#intersect : return all the common values
select * from a 
intersect 
select * from b; #it always shows croos/wrong mark as it is a in built defect, ignore and run it anyways

#minus : return only a's value ,not even common  between a and b
select * from a 
minus
select * from b; #minus does not support in mysql

#aggregate function : aggregate functions let you perform a calculation on multiple data and return a single value.
#1) sum() 2)max() 3)min() 4)count() 5)avg()
select sum(id)  from b;
select sum(id)  as total_id from b; #if want to give another name

select max(id)  from b;
select max(id)  as max_id from b;

select min(id)  from b;
select min(id)  as min_id from b;

select count(id)  from b;
select sum(id)  as count_id from b;

select avg(id)  from b;
select avg(id) as avg_id from b;

#concatenate : adds 2 or more expression together
select * from emp;
select concat(firstName,'     ' ,lname) as full_name from emp; #concat()

#concat_ws : The CONCAT_WS() function adds two or more expressions together with a separator. (suppose want to seprate with space then see following)
select concat_ws('   ',firstName,lname) as full_name from emp;

#upper : used to convert into uppercase
select upper(firstName) as upper_firstName from emp;

#lower : used to convert into lowercase
select lower(firstName) as lower_lname from emp;

#substring : Extract a substring from a string (start at position 5, extract 3 characters):sarts with 1 not 0 like range
select substring(firstName,2,4) as lower_lname from emp; # if give 2 arg, start with first arg and extract till second arg(count) (4 so 4 letters)
select substring(firstName,2) as lower_lname from emp; #if give single arg , then starts with

#make first letter in uppercase
select initcap(firstName) as lower_lname from emp; #initcap does not support in mysql