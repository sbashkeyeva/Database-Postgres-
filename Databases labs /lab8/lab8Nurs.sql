CREATE DATABASE lab8;

CREATE TABLE salesman(
	salesman_id int, 
	name varchar,
	city varchar, 
	commision double precision
);

CREATE TABLE customers(
	customer_id int, 
	cust_name varchar, 
	city varchar, 
	grade int, 
	salesman_id int
);

CREATE TABLE orders(
	ord_no int, 
	purch_amt double precision, 
	ord_date date, 
	customer_id int, 
	salesman_id int 
);

CREATE ROLE junior_dev LOGIN;

CREATE VIEW myView1 AS
    SELECT * FROM salesman
    	WHERE city = 'New York';

/*5*/
CREATE VIEW myView2 AS
    SELECT salesman.name, customers.cust_name FROM orders, salesman, customers
		WHERE orders.salesman_id = salesman.salesman_id AND orders.customer_id = customers.customer_id;

GRANT ALL PRIVILEGES ON myView2 TO junior_dev;

/*6*/
CREATE VIEW myView3 AS 
	SELECT * FROM customers 
		WHERE grade=(SELECT max(grade) FROM customers);

GRANT SELECT ON myView3 TO junior_dev;

/*7*/
CREATE VIEW myView4 AS 
	SELECT city, count(city) FROM salesman 
		GROUP BY city;

/*8*/			
CREATE VIEW myView5
	AS SELECT * FROM salesman
		WHERE (SELECT COUNT(*) FROM customer
     		WHERE salesman.salesman_id = customer.salesman_id) > 1;

/*9*/
CREATE ROLE intern; 

GRANT junior_dev TO intern;

