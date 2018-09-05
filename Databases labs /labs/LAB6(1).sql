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
  department_id integer references departments,
  manager_id references employees
);


create table grades(
  grade_level char,
  lowest_salary integer,
  high_salary integer
);


select * from grades join employees using(salary) where employees.salary>grades.low_salary and employees.salary<grades.high_salary;

select * from employees e join employees s on s.employee_id = 120 and e.salary < s.salary;

select employee_id, first_name, last_name from employees e join employees m on e.employee_id = m.manager_id;

select department_name, count(*) from departments join employees on employees.department_id = departments.department_id;

select employee_id, first_name, last_name, email, salary, department_id, department_name, budget, location_id,city, state_province from employees join departments using(department_id) join locations on(departments.location_id = locations.location_id);