create table locations (
	location_id serial primary key,
	street_address varchar(25),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(12)
);

create table departments (
	department_id serial primary key,
	department_name varchar(50) unique,
	budget integer,
	location_id integer references locations
);

create table employees (
	employee_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone_number varchar(20),
	salary integer,
	department_id integer references departments
);

create table grades (
	grade_level char,
	low_salary integer,
	high_salary integer
);

insert into locations (street_address, postal_code, city, state_province) values (
	'Akhan seri 13a', '050011', 'Almaty', 'Almaty'
);

insert into departments (department_name, budget, location_id) values (
	'fit', 50000, 1
);

insert into departments (department_name, budget, location_id) values (
	'bs', 5000, 1
);

insert into employees (first_name, last_name, email, phone_number, salary, department_id) values (
	'Aisultan', 'Kali', 'aisultan.kali@gmail.com', '+77473415484', 50000, 1
);

insert into employees (first_name, last_name, email, phone_number, salary, department_id) values (
	'Zhandos', 'Bolatbekov', 'zhando@gmail.com', '+77472562048', 1000, 2
);

insert into grades (grade_level, low_salary, high_salary) values (
	'A', 5000, 15000
);

insert into grades (grade_level, low_salary, high_salary) values (
	'B', 16000, 100000
);

insert into grades (grade_level, low_salary, high_salary) values (
	'C', 0, 100000
);


-- 1

select e, g.grade_level 
from employees as e join grades as g on e.salary between g.low_salary and g.high_salary;

-- 2

select e from employees as e join employees as s on e.salary < s.salary where s.employee_id = 120;

-- 3

alter table employees add manager_id integer references employees;

update employees set manager_id = 1 where employee_id = 2;

select e, s from employees as e join employees as s on e.manager_id = s.employee_id;

-- 4

select (d.department_name, count(e)) 
from departments as d join employees as e on e.department_id = d.department_id group by d.department_name;

-- 5

select e, d, l.city, l.state_province
from employees as e 
join departments as d on e.department_id = d.department_id 
join locations as l on l.location_id = d.location_id;

-- 1 Select (employee, grade_level)
-- 2 print all employees where salary < salary of employee with id = 120
-- 3 insert column to employees manager_id is a foreign key, print for all employees its manager

-- 4. print (department_name, count of employees in this depo)
-- 5. print each employee, print department of each employee, and city and state province of department
