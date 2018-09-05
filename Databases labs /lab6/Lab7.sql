CREATE INDEX countries_name ON countries(countries.name);
CREATE INDEX employees_name ON employees(employees.name,employees.surname);
CREATE UNIQUE INDEX employees_salary ON employees(employees.salary);
CREATE INDEX  ind_subst ON employees (substring(name from 1 for 4));
CREATE INDEX inx ON departments(department_id) 
CREATE INDEX in ON employees(department_id)
CREATE INDEX ic ON employees(employees.salary) 
CREATE INDEX ind_join_dep ON departments (departments.budget);

