use fusion;
show tables;
select * from emp;
create table student (id int, name varchar(20), DOB date);
insert into student values(101, 'Sachin', '1998-09-05'); #yyyy-mm-dd
select * from student where DOB = '1998-09-05';

create table student1 (id int, name varchar(20), DOB datetime);
insert into student1 values(102, 'sachin','1998-09-05 12:05:30');#hh:mm:ss
select * from student1 where DOB = '1998-09-05 12-05-30';


