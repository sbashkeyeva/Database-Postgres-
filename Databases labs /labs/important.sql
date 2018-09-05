
1. Write a query in SQL to display the first name, last name, department number, and department name for each employee.
SELECT E.first_name , E.last_name , 
       E.department_id , D.department_name 
        FROM employees E 
         JOIN departments D 
          ON E.department_id = D.department_id;

2.Write a query in SQL to display the first and last name, department, city, and state province for each employee. 

SELECT E.first_name,E.last_name, 
   D.department_name, L.city, L.state_province
     FROM employees E 
      JOIN departments D  
        ON E.department_id = D.department_id  
          JOIN locations L
           ON D.location_id = L.location_id;
3. Write a query in SQL to display the first name, last name, salary, and job grade for all employees.
SELECT E.first_name, E.last_name, E.salary, J.grade_level
 FROM employees E 
   JOIN job_grades J
     ON E.salary BETWEEN J.lowest_sal AND J.highest_sal;

4. Write a query in SQL to display the first name, last name, department number and department name, for all employees for departments 80 or 40.
SELECT E.first_name , E.last_name , 
       E.department_id ,  D.department_name 
         FROM employees E 
         JOIN departments D 
          ON E.department_id = D.department_id 
          AND E.department_id IN (80 , 40)
           ORDER BY E.last_name;

5. Write a query in SQL to display those employees who contain a letter z to their first name and also display their last name, department, city, and state province.
SELECT E.first_name,E.last_name,
   D.department_name, L.city, L.state_province
     FROM employees E 
      JOIN departments D  
       ON E.department_id = D.department_id 
        JOIN locations L 
         ON D.location_id = L.location_id 
           WHERE E.first_name LIKE  '%z%';

6. Write a query in SQL to display all departments including those where does not have any employee.
SELECT E.first_name, E.last_name, D.department_id, D.department_name 
 FROM employees E 
   RIGHT OUTER JOIN departments D
     ON E.department_id = D.department_id;

7. Write a query in SQL to display the first and last name and salary for those employees who earn less than the employee earn whose number is 182.
SELECT E.first_name, E.last_name, E.salary 
  FROM employees E 
   JOIN employees S
     ON E.salary < S.salary 
      AND S.employee_id = 182;
8. Write a query in SQL to display the first name of all employees including the first name of their manager
SELECT E.first_name AS "Employee Name", 
   M.first_name AS "Manager"
     FROM employees E 
       JOIN employees M
         ON E.manager_id = M.employee_id;

9. Write a query in SQL to display the department name, city, and state province for each department. 
SELECT D.department_name , L.city , L.state_province
  FROM  departments D 
    JOIN locations L 
      ON  D.location_id = L.location_id;
10. Write a query in SQL to display the first name, last name, department number and name, for all employees who have or have not any department.
SELECT E.first_name, E.last_name, E.department_id, D.department_name 
  FROM employees E 
   LEFT OUTER JOIN departments D 
     ON E.department_id = D.department_id;
11. Write a query in SQL to display the first name of all employees and the first name of their manager including those who does not working under any manager.
SELECT E.first_name AS "Employee Name",
   M.first_name AS "Manager"
    FROM employees E 
      LEFT OUTER JOIN employees M
       ON E.manager_id = M.employee_id;
12. Write a query in SQL to display the first name, last name, and department number for those employees who work in the same department as the employee who hold the last name as Taylor.
SELECT E.first_name , E.last_name , E.department_id 
 FROM employees E 
   JOIN employees S
     ON E.department_id = S.department_id
       AND S.last_name = 'Taylor';
13. Write a query in SQL to display the job title, department name, full name (first and last name ) of employee, and starting date for all the jobs which started on or after 1st January, 1993 and ending with on or before 31 August, 1997. 13. Write a query in SQL to display the job title, department name, full name (first and last name ) of employee, and starting date for all the jobs which started on or after 1st January, 1993 and ending with on or before 31 August, 1997. 
SELECT job_title, department_name, first_name || ' ' || last_name AS Employee_name, start_date 
	FROM job_history 
		JOIN jobs USING (job_id) 
			JOIN departments USING (department_id) 
				JOIN  employees USING (employee_id) 
					WHERE start_date>='1993-01-01' AND start_date<='1997-08-31';
14. Write a query in SQL to display job title, full name (first and last name ) of employee, and the difference between maximum salary for the job and salary of the employee.  
SELECT job_title, first_name || ' ' || last_name AS Employee_name, 
	max_salary-salary AS salary_difference 
	FROM employees 
		NATURAL JOIN jobs;
15. Write a query in SQL to display the name of the department, average salary and number of employees working in that department who got commission. 
SELECT department_name, AVG(salary), COUNT(commission_pct) 
	FROM departments 
		JOIN employees USING (department_id) 
GROUP BY department_name;
16. Write a query in SQL to display the full name (first and last name ) of employee, and job title of those employees who is working in the department which ID is 80.
SELECT job_title, first_name || ' ' || last_name AS Employee_name, 
	max_salary-salary AS salary_difference
	FROM employees 
		NATURAL JOIN jobs 
			WHERE department_id  = 80;
17. Write a query in SQL to display the name of the country, city, and the departments which are running there.
SELECT country_name,city, department_name 
	FROM countries 
		JOIN locations USING (country_id) 
			JOIN departments USING (location_id);
18. Write a query in SQL to display department name and the full name (first and last name) of the manager.
SELECT department_name, first_name || ' ' || last_name AS name_of_manager
	FROM departments D 
		JOIN employees E 
			ON (D.manager_id=E.employee_id);
19. Write a query in SQL to display job title and average salary of employees.
SELECT job_title, AVG(salary) 
	FROM employees 
		NATURAL JOIN jobs 
			GROUP BY job_title;
20. Write a query in SQL to display the details of jobs which was done by any of the employees who is presently earning a salary on and above 12000.
SELECT a.*
	FROM  job_history a 
		JOIN employees m 
			ON (a.employee_id = m.employee_id)
WHERE salary >= 12000;
21.Write a query in SQL to display the country name, city, and number of those departments where at leaste 2 employees are working.
SELECT country_name,city, COUNT(department_id)
	FROM countries 
		JOIN locations USING (country_id) 
		JOIN departments USING (location_id) 
WHERE department_id IN 
    (SELECT department_id 
		FROM employees 
	 GROUP BY department_id 
	 HAVING COUNT(department_id)>=2)
GROUP BY country_name,city;
22. Write a query in SQL to display the department name, full name (first and last name) of manager, and their city.
SELECT department_name, first_name || ' ' || last_name AS name_of_manager, city 
	FROM departments D 
		JOIN employees E 
			ON (D.manager_id=E.employee_id) 
				JOIN locations L USING (location_id);
23. Write a query in SQL to display the employee ID, job name, number of days worked in for all those jobs in department 80.
SELECT employee_id, job_title, end_date-start_date DAYS 
	FROM job_history 
		NATURAL JOIN jobs 
			WHERE department_id=80;
24. Write a query in SQL to display the full name (first and last name), and salary of those employees who working in any department located in London. 
SELECT first_name || ' ' || last_name AS Employee_name, salary
	FROM employees 
		JOIN departments USING (department_id) 
		JOIN  locations USING (location_id) 
	WHERE  city = 'London';
25. Write a query in SQL to display full name(first and last name), job title, starting and ending date of last jobs for those employees with worked without a commission percentage. 
SELECT first_name || ' ' || last_name AS Employee_name, 
   job_title, start_date, end_date
	FROM job_history a 
		JOIN jobs b USING (job_id) 
		JOIN employees c  
	ON ( a.employee_id = c.employee_id)
WHERE commission_pct IS NULL;
26. Write a query in SQL to display the department name and number of employees in each of the department.
SELECT department_name, COUNT(*) 
	FROM employees 
		NATURAL JOIN departments
			GROUP BY department_name;
27. Write a query in SQL to display the full name (firt and last name ) of employee with ID and name of the country presently where (s)he is working. 
SELECT first_name || ' ' || last_name AS Employee_name, 
	employee_id, country_name 
		FROM employees 
			JOIN departments USING(department_id) 
JOIN locations USING( location_id) 
JOIN countries USING ( country_id);
