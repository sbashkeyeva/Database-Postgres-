create database lab6;
create table locations(
	location_id serial primary key,
	street_address varchar(25),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(12)
);
create table departments(
	department_id serial primary key,
	department_name varchar(50) UNIQUE,
	budget integer,
	location_id integer references locations
);
create table employees(
	employee_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone_number varchar(50),
	salary integer,
	department_id integer references departments
);
select e.first_name , e.last_name , e.department_id , dp.department_name 
from employees e join departments dp 
on e.department_id = dp.department_id

select e.first_name , e.last_name , e.department_id , dp.department_name 
from employees e join departments dp 
on e.department_id = dp.department_id and (dp.department_id = 80 or dp.department_id = 40)

select e.last_name , e.first_name , dp.department_name , lc.city , lc.state_province
from employees e join departments dp  
on e.department_id = dp.department_id  join locations lc
on dp.location_id = lc.location_id

select e.first_name , e.last_name , e.department_id ,  dp.department_name 
from employees e right outer join departments dp 
on e.department_id = dp.department_id

select e.first_name , e.last_name , e.department_id ,  dp.department_name 
from employees e left outer join departments dp 
ON e.department_id = dp.department_id
