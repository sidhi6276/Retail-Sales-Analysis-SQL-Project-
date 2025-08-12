create table employee2 (
emp_id int primary key,
emp_name varchar(34) NOT NULL,
Position varchar(32),
department varchar(21),
hire_date date,
salary numeric(10,2)
);

select * from employee2;

INSERT INTO employee2(emp_id , emp_name , position , department , hire_date , salary)
VALUES (101,'sidhi','data analyst','data science','2025-09-23',43000.00),
(102,'ridhi','data analyst','data science','2025-11-13',53000.00),
(103,'nidhi','web dev','software engineer','2025-09-23',83000.00),
(104,'vidhi','IT','cyber security','025-09-23',43000.00);

delete from employee2 where emp_id=101;

alter table employee2
drop column position;

drop table if exists employee2;
drop database if exists company2;

------------data types and constraints-----------------



integer - store whole number
serial - automatic increment
begint - store large number
numeric(p,s) - like salary (store exact no. with scale )
real - store floating number
double precision - jb jada decimal involve ho jate h tb use kia jata hai 
-----------------------------------------------------------------------------------------------

character data types :
char() - fixed lenght of n character
varchar()- variable lenght 
text()- unlimited lenght of string

---------------------------------------------------------------------------------------------
time data types :-

date - store date(yr,mnth,date)
time - store time(hr,min,sec)
timestamp - store date and time
timestampz - store date and time with timezone
interval - store duration of time 

create table events(
event_id serial primary key,
event_date date,
event_name char(34),
event_time timestamp,
duration interval
);

-------------------------------------------------------------------------------
boolean - store true / false

create table user(
user_id serial primary key,
user_name varchar(43),
is_active boolean
);
------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
constraints - are the rules that aplly on data in tables 
ensure accuracy,integrity,consistency

not null
unique
primary key 
foreign key
check 
default
exclusion 

--------------------------------------------------------------------------------
create table employee3(
emp_id int primary key,
emp_name varchar(23) not null,
position varchar(32) not null
);

create table students(
stud_name varchar(23) not null,
stud_emailid varchar(43) unique,
stud_id serial primary key,
stud_age int check (stud_age > 18),
regis_date timestamp default current_timestamp
);

insert into students (stud_name , stud_emailid , stud_age )
values ('sidhi','sidhigoel@gmail.com',21);

insert into students (stud_name , stud_emailid , stud_age )
values ('ridhi','ridhigoel@gmail.com',22);

select * from students;
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-------update data in sql------------order by also----------------

create table users(
user_id serial primary key,
user_name varchar(21) not null,
email_id varchar (32) unique,
user_age int ,
user_city varchar(43)
);

select * from users;

insert into users (user_name , email_id , user_age , user_city )
values ('nidhi','nidhi@gmail.com',21,'gohana'),
('vidhi','vidhi@gmail.com',21,'rohtak'),
('ram','ram@gmail.com',22,'sonipat'),
('anuj','anuj@gmail.com',23,'panipat'),
('vihan','vihan@gmail.com',25,'smalkha');


select user_id ,user_name,user_age from users;

update users 
set user_age=25 
where user_name = 'vidhi';

select * from users order by user_id asc;

select * from users order by user_name desc;

update users
set user_city = 'chennai'
where user_age >= 23;

update users
set user_age =31,user_city='kolkata'
where user_name='ram';

update users
set user_age=user_age+1
where email_id like '%@gmail.com';

DELETE FROM USERS
WHERE
EMAIL_ID = 'ajayy@gmail.com';

----------------------------------------------------------------------------------------
----------update data in sql with toolbar----------------------------------------------


-----------query toolbar in sql------------------------------------------------------
----------------------------------------------------------------------------------

----------alter column and datatypes in sql ------------------------------

alter table users 
rename column user_name to fullnume;

select * from users order by user_id asc;

-----to chnge age column datatype -------from int to small int-------------

alter table users
alter column user_age type smallint;

------ to add not null constrait to city column------
alter table users
alter column user_city set not null;


---add check constraint to age column------
alter table users
add constraint user_age check(user_age>=18);

alter table users
drop constraint age;

---------chnage table name user to anythig else---------

alter table users
rename to people;

select * from users;

select * from people;

-----------------------------------------------------
-- assignment with solution  ---------

create table employees(
emp_id serial primary key,
first_name varchar(23),
last_name varchar(21),
dept varchar(20),
salary decimal(10,2)check(salary>0),
joining_date date not null,
age int check (age>=18)
);

insert into employees(first_name,last_name,dept,salary,joining_date,age)
values
('amit','sharma','it',60000.00,'2022-05-01',29),
('neha','patel','hr',55000.00,'2021-08-15',32),
('ravi','kumar','finance',70000.00,'2020-03-10',35),
('anjali','verma','it',65000.00,'2019-11-22',28),
('suresh','reddy','operations',50000.00,'2023-01-10',26);

-- qu1: retrive all employee first name and their dept...

select dept , first_name from employees;

update employees 
set salary = salary + (salary*0.1)
where dept_name ='it'; 

delete from employees 
where age > 34;

alter table employees 
add column email varchar(12);

alter table employees
rename column dept to dept_name;

select first_name , last_name from employees 
where joining_date > '2021-01-01';

alter table employees
alter column salary type integer;

select first_name , age , salary from  employees
order by salary desc;

insert into employees(first_name ,last_name ,dept_name,salary,joining_date,age)
values
('annu','goel','marketing',60000,'2023-09-15',32);

update employees
set age = age + 1;
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
----how to import csv file into sql --------------------
1. by query
2. by direct import 

------------------------------------------
create table employee2(
employee_id int primary key,
first_name varchar (21) not null,
last_name varchar(20) not null,
email varchar(61),
department varchar(32),
salary numeric(10,2),
joining_date date,
age int );

-- drop table employee2;
 
select * from employee2;

copy 
employee2(employee_id, first_name, last_name, email, department, salary,joining_date, age)
from 'C:\Users\Welcome\Downloads\SQL_Micro_Course-main\SQL_Micro_Course-main\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\employee_data.csv'
delimiter','
csv header;

-----------------------------------------------------------------------------------------------------------
by direct 
-----------------------------------------------------------------------------------------------------------

----------types of operator in sql-----------
arithmetic operator
comparison operator
logical operator
bitwise operator
set operator
string operator
other operator
---------------------------------------
arithmetic= + , - , * , / ,% 
-- que - retrive the firstname , salary and calculate a 10% bonus on the salary
-----------------------------------------------------------------------------
select first_name , salary , (salary * 0.10) as bonus
from employee2;

-- que calculate the annual salary and salary increment by 5% - show thw monthly new salary as well

----functions in sql------
1. aggregate function
2. string function
3. date and time function
4. mathematical function
5. conditional function
6. window/analytical function

------------------------------------------------------------------
1. aggregate function :- perform calculation on a set of value and return a single value
count()
sum()
avg()
max()
min()

create table products(
product_id serial primary key,
product_name varchar (100),
category varchar(50),
price numeric (10,2),
quantity int,
added_date date,
discount_rate numeric(5,2)
)

insert into products (product_name,category,price,quantity,added_date,discount_rate)
values
('laptop','electronics',175000.00,10,'2024-02-15',10.00),
('smartphone','electronics',45000.00,25,'2024-02-20',5.00),
('headphone','accessories',15000.00,50,'2024-05-05',15.00),
('office chair','furniture',5500.00,20,'2024-12-01',20.00),
('desk','furniture',8000.00,15,'2023-11-20',10.00),
('monitor','electronics',12000.00,8,'2024-01-10',8.00),
('printer','electronics',9500.00,5,'2024-02-01',7.50),
('mouse','accessories',750.00,40,'2024-03-18',10.00),
('keyboard','accessories',1250.00,35,'2024-03-18',10.00),
('tablet','electronics',30000.00,12,'2024-02-28',5.00);


select * from products

-----total quantity available---------
select sum(quantity) as total_quantity
from products


select sum(quantity) as quantity_of_electronics
from products 
where category ='electronics';


select sum(quantity) as quantity_of_electronics
from products 
where category ='electronics' and price>2000;

select count(*) as total_products
from products

select count(*) as total_products
from products
where product_name like '%phone%'; 




