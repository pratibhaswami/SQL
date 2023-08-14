#to apply caluses we need  2 things : column name and aggregate function
use fusion;
select * from emp;
#group by :  group the similar data
select department, count(*) from emp GROUP BY department;

#having : it works on group by's clause result 
select department, count(*) from emp GROUP BY department having count(*) > 1; #by default count(department)
select department, count(department) from emp GROUP BY department having count(department) > 1;  #same as above (custom)
select department, max(salary) from emp GROUP BY department having max(salary); #can use any agrr fun

select * from emp;

#order by : used to convert in asending and decending
select department from emp ORDER BY department DESC;
select department from emp ORDER BY department ASC;

#Rank - it skips the values and 
#Dense Rank: it start with the next value where it left
select salary, RANK () OVER (ORDER BY salary ASC) from emp;  #can apply on asending or decending 
select salary, dense_rank () OVER (ORDER BY salary ASC) from emp;