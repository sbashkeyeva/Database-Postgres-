CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)
);

INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);

INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('152934485','Anand','Manikutty',14, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('222364883','Carol','Smith',37, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('326587417','Joe','Stevens',37, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332154719','Mary-Anne','Foster',14, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332569843','George','ODonnell',77, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('546523478','John','Doe',59, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('631231482','David','Smith',77, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('654873219','Zacary','Efron',59, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657245','Elizabeth','Doe',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657246','Kumar','Swamy',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('484848484','Kumar','Swamy',14, 'Almaty');



INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Garry','Foster', 'London');
INSERT INTO customers(name,lastname, city) VALUES('Amanda','Hills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('George','Doe', 'Tokyo');
INSERT INTO customers(name,lastname, city) VALUES('David','Little', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Shawn','Efron', 'Astana');
INSERT INTO customers(name,lastname, city) VALUES('Eric','Gomez', 'Shymkent');
INSERT INTO customers(name,lastname, city) VALUES('Elizabeth','Tailor', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Julia','Adams', 'Astana');

SELECT lastname FROM employees;

SELECT DISTINCT lastname FROM employees;

SELECT * FROM employees
	WHERE lastname='Smith';

SELECT * FROM employees
	WHERE lastname='Smith' OR lastname='Doe';
	
SELECT * FROM employees
	WHERE department='14';
	
SELECT * FROM employees
	WHERE department=37 OR department=77;
	
SELECT SUM(budget) FROM departments;

SELECT department, COUNT(*) FROM employees 
	GROUP BY department;

SELECT department, COUNT(*) FROM employees
	GROUP BY department
		HAVING COUNT(*) > 2;
	
SELECT name, budget FROM departments 
	ORDER BY budget DESC 
		OFFSET 1 LIMIT 1;
		
SELECT name, lastname FROM employees
	WHERE employees.department=(SELECT code FROM departments 
									ORDER BY budget ASC LIMIT 1);
									
SELECT name FROM employees
	WHERE city='Almaty' UNION
		SELECT name FROM customers
			WHERE city='Almaty';
			
SELECT code, budget FROM departments 
	WHERE budget>60000
		ORDER BY budget ASC, code DESC;
		
UPDATE departments SET budget=budget*0.9
	WHERE budget=(SELECT budget FROM departments 
					ORDER BY budget ASC LIMIT 1) returning *;
					
UPDATE employees SET department=14 
	WHERE department=77 returning *;
	
DELETE FROM employees
	WHERE employees.department=(SELECT code FROM departments 
									WHERE name='IT') returning *;
	


delete from employees where department=(select code from departments where name='IT');
UPDATE employees set department=(select code from departments order by budget desc limit 1 offset 0) where department=(select  code from departments order by budget acs limit 1 offset 0 )
select department, COUNT(*) from employees GROUP by department;
select city from employees GROUP by city;
select city, COUNT(*) from employees GROUP by city;
select DISTINCT on (department) name from employees;




DELETE FROM employees;
Select name from departments order by budget asc limit 1 offset 4;
Select name from departments order by budget asc,code desc;
delete from employees where department=(select code from departments order by budget asc limit 1 offset 0)
					
					

