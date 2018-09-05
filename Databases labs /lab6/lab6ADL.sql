CREATE DATABASE lab6;

CREATE TABLE locations(
	location_id SERIAL PRIMARY KEY,
	street_address VARCHAR(25),
	postal_code	VARCHAR (12),
	city VARCHAR(30),
	state_province VARCHAR(12)
);

CREATE TABLE departments(
	department_id SERIAL PRIMARY KEY,
	department_name VARCHAR(50) UNIQUE,
	budget INTEGER,
	location_id INTEGER REFERENCES locations	
);

CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
  	first_name VARCHAR(50),
  	last_name VARCHAR(50),
  	email VARCHAR(50),
  	phone_number VARCHAR(20),
  	salary INTEGER,
  	manager_id integer REFERENCES employees,
  	department_id INTEGER REFERENCES departments

);

create table job_grades(

	grade char(1),
	lowest_salary INTEGER,
	highest_salary integer
);


SELECT employees.first_name, employees.last_name, departments.department_name, locations.city, locations.state_province
	FROM employees INNER JOIN departments USING(department_id) INNER JOIN locations USING(location_id);

select employees.first_name,employees.last_name,employees.salary,job_grades.grade 
	from employees inner join job_grades on (employees.salary>=job_grades.lowest_salary and employees.salary<=job_grades.highest_salary);

select emp1.first_name,emp2.first_name, emp1.salary
	from employees as emp1 inner join employees as emp2 using (employee_id) where emp1.employee_id < 120;

select emp1.first_name,emp2.first_name from employees as emp1 inner join employees as emp2 using(manager_id);


SELECT employees.first_name, employees.last_name, departments.department_id, departments.department_name
  	FROM employees LEFT JOIN departments USING(department_id);




