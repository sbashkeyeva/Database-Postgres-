1) CREATE INDEX index_name 
	ON countries(name);

2) CREATE INDEX index_name_surname 
	ON employees(employees.name, surname);

3) CREATE UNIQUE INDEX index_salary ON employees (salary)


4) CREATE INDEX index_substring
	ON employees (substring(employees.name from 1 for 4));

5) CREATE INDEX index_join_employees ON employees (department_id, salary)
   CREATE INDEX index_join_departments ON departments (department_id, budget)