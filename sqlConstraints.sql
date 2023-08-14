#constraints : to apply rules on columns
#primary key, unique key, not null key, check,default, foreign key
#primary key = unique + not null
use fusion;
#primary key on create table
CREATE TABLE Persons(
    ID int,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    primary key(ID));
insert into Persons(ID,LastName,FirstName,Age) values(101,'Pratibha','swami',22); 
insert into Persons(ID,LastName,FirstName,Age) values(101,'onkar','swami',27); #ERROR! as duplicate entry

 
 #for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:
 CREATE TABLE Persons13(
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);
insert into Persons13(ID,LastName,FirstName,Age) values(101,'swami','pratibha',22); 
insert into Persons13(ID,LastName,FirstName,Age) values(102,'swami','om',27); #lastName is same still working
insert into Persons13(ID,LastName,FirstName,Age) values(101,'swamiii','om',27); #id is same still working
insert into Persons(ID,LastName,FirstName,Age) values(101,'swami','omkar',22); #if both are same (then and then only is is giving error)
select * from Persons13; 
#Note: In the example above there is only ONE PRIMARY KEY (PK_Person). However, the VALUE of the primary key is made
#up of TWO COLUMNS (ID + LastName).

#primary key on alter table
alter table Persons13 add primary key(ID); #Duplicate error!!! as we added while creating also

#for defining a PRIMARY KEY constraint on multiple columns (while altering table)
ALTER TABLE Persons13 ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName); #Error, as added while creating only as you know
#Note: If you use ALTER TABLE to add a primary key, the primary key column(s) must have been declared to not contain
#NULL values(mns not null) (when the table was first created).

#drop primary key
alter table Persons1 drop primary key; #only one primary key is present, so no quention of dropping multiple

#SQL NOT NULL Constraint
#By default, a column can hold NULL values.
#The NOT NULL constraint enforces a column to NOT accept NULL values.
#This enforces a field to always contain a value, which means that you cannot insert a new record, or update a record
#without adding a value to this field.
CREATE TABLE Persons26 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);
insert into Persons26(ID,LastName,FirstName,Age) values(101,'swami','pratibha',22); 
insert into Persons26(ID,LastName,FirstName,Age) values(102,'','pratibha',22); 
select * from Persons26;

#SQL NOT NULL on ALTER TABLE
ALTER TABLE Persons26 MODIFY COLUMN Age int NOT NULL; #mysql

#Unique kay
#The UNIQUE constraint ensures that all values in a column are different.
#Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.
#A PRIMARY KEY constraint automatically(by default) has a UNIQUE constraint.
#However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.

#Unique constraints while creating table
CREATE TABLE Persons15 (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
#define a UNIQUE constraint on multiple columns
CREATE TABLE Persons24 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

#SQL UNIQUE Constraint on ALTER TABLE
ALTER TABLE Persons20 ADD UNIQUE (ID); # working...even though, we have mentioned Unique key while creating table


#to define unique on multiple column while altering table 
ALTER TABLE Persons24 ADD CONSTRAINT UC_personsunique UNIQUE (ID,LastName);# duplicate key name, error!!! as mentioned unique while creating only

#to drop a unique constraints
ALTER TABLE Persons19 DROP INDEX UC_Person; #mysql
ALTER TABLE Persons20 DROP CONSTRAINT UC_Person;#sql (both worknig)


#CHECK Constraint
#The CHECK constraint is used to limit the value range that can be placed in a column.
#If you define a CHECK constraint on a column it will allow only certain values for this column.
#If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other 
#columns in the row.
CREATE TABLE Persons21(
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);
insert into Persons21 values(105,'Pratibha','swami',22);
insert into Persons4 values(105,'Pratibha','swami',25);
insert into Persons4 values(105,'Pratibha','swami',18);
insert into Persons4 values(105,'Pratibha','swami',15); #rule voilated!!!

#for defining a CHECK constraint on multiple columns
CREATE TABLE Persons22 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);
insert into Persons22 values(105,'Pratibha','swami',22,'latur'); #voilated bcz of city
insert into Persons22 values(105,'Pratibha','swami',17,'Sandnes');#voilated bcz of age
insert into Persons22 values(105,'Pratibha','swami',25,'Sandnes');# sucessfully working...

#SQL CHECK on ALTER TABLE
ALTER TABLE Persons22 ADD CHECK (Age>=18); # working...even though we have mentioned CHECK while creating
#check while alteing on multiple columns
ALTER TABLE Persons22 ADD CONSTRAINT CHK_PersonAge1 CHECK (Age>=18 AND City='Sandnes'); #notice: here is CHK_PersonAge1(diff variable)

#DROP a CHECK Constraint
ALTER TABLE Persons22 DROP CONSTRAINT CHK_PersonAge;#sql
ALTER TABLE Persons DROP CHECK CHK_PersonAge;#mysql (both working)

#SQL DEFAULT Constraint
#The DEFAULT constraint is used to set a default value for a column.
#The default value will be added to all new records, if no other value is specified.
CREATE TABLE Persons27 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);
#The DEFAULT constraint can also be used to insert system values, by using functions like GETDATE():
CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE());
#SQL DEFAULT on ALTER TABLE
ALTER TABLE Persons27 
ALTER City SET DEFAULT 'Sandnes';

#DROP a DEFAULT Constraint
ALTER TABLE Persons27 
ALTER City DROP DEFAULT;

#foreign key : It maintain relationship between two tables
#parent - primary key
#chield - duplicate

#SQL FOREIGN KEY Constraint

#The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.
#A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
#The table with the foreign key is called the child table, and the table with the primary key is called the referenced
#or parent table.

#SQL FOREIGN KEY on CREATE TABLE
create table fkperson2(pid int, lname varchar(10), fname varchar(10),age int);
alter table fkperson1 add primary key(pid); #i forgot to add primary key, so ,added by user alter (for single column)

#for single column
CREATE TABLE Ordersssss (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersondID int, #earlier pid, now PersondID(doesn't matter) but giving same is good practice
    PRIMARY KEY (OrderID),
    constraint fk_id_lname foreign key (PersondID) REFERENCES fkperson1(pid)); #u haven't added lname here, so, doesn,t affect on invalid lname

#inserting data(single column)
insert into fkperson1 values (1,'swami','sdfd',10),(2,'swami2','sdfd',10),(3,'swami3','sdfd',10);
insert into Orderssss values (11,3531,8),(22,4532,3),(33,3333,4),(44,3232,2),(55,3233,5); #lname valid(same) but id is invalid

select * from fkperson1;
select * from Orderssss;


#now double column
insert into Orderssss values (11,3531,1,'swami'),(22,4532,3,'swami2'),(33,3333,1,'swami6'),(44,3232,2,'swami'),(55,3233,3,'swami4'); #id is valid(same) but lname is invalid 


#now double column
#for defining a FOREIGN KEY constraint on multiple columns
create table child(cid int, 
				 lname varchar(20), 
				 fname varchar(20),
                 constraint child_id_lname primary key(cid,lname)
);

CREATE TABLE parent(
    pid int NOT NULL,
    age int,
    cid int,
    lastname varchar(20) NOT NULL, #notice here is lastname(can take diff ad well)
    CONSTRAINT FK_PersonOrder FOREIGN KEY (cid,lastname) REFERENCES child(cid,lname)
);

#inserting dadta in multiple column
insert into child values(1,'swami1','pratibha'),(3,'swami2','pratibha'),(2,'swami3','pratibha'),(4,'swami4','pratibha');
insert into parent values(101,21,1,'swami2'),(102,22,3,'swami3'),(104,22,2,'swami7'),(105,34,3,'swami2');#id is valid, lname invalid(FK fails!!!)
insert into parent values(101,21,3,'swami1'),(102,22,5,'swami2'),(104,22,9,'swami3'),(105,34,2,'swami2');#lname is valid, id invalid(FK fails!!!)
insert into parent values(101,21,1,'swami1'),(102,22,3,'swami2'),(104,22,2,'swami3'),(105,34,4,'swami4');#both should be valid then and then only will work.


#GOOD JOB PRATIBHA!!!

