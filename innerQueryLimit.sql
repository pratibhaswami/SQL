#inner query : how to find max salary using inner query?
show databases; 
use fusion;
select * from emp;
select max(salary) from emp; #it will return only salary column. what if i want whole row?
select * from emp where salary = (select max(salary) from emp); # another braket of select is waht we call inner query

#to find second max salary
select * from emp where salary = (select max(salary) from emp where salary < (select max(salary) from emp));

#to find third max
select * from emp where salary = (select max(salary) from emp where salary < (select max(salary) from emp where salary < (select max(salary) from emp)));

#fourth max salary
select * from emp where salary = (select max(salary) from emp where salary < (select max(salary) from emp where salary < (select max(salary) from emp where salary < (select max(salary) from emp))));

#in the similar way, to find min we can use min funcion alongside, > operator
select * from emp where salary = (select min(salary) from emp where salary > (select min(salary) from emp)); #and all

#another way by  using limit
select * from emp order by salary asc limit 2; # it is like range (first value means starts with (default 0), second value means occurance(till teh number of conunt)) 
#if only one value given,occarance from start

#suppose, want third max 
select * from emp order by salary desc limit 1,1; # second higtest salary, so starts with 1
select * from emp order by salary desc limit 2,1; # third max comes at second row, so starts with 2
#(if values is dummy it may create confusion) #my thought

#in the similar way, to find min we can simply use asc functon

#WELL DONE PRATIBHA!!!