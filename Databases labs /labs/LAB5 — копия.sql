CREATE DATABASE lab5;
CREATE TABLE customers(
	customer_id int,
	cust_name varchar(255),
	city varchar(255),
	grade int,
	salesman_id int
);
CREATE TABLE orders (
	ord_no int,
	purch_amt real,
	ord_date date,
	customer_id int,
	salesman_id int
);
SELECT SUM(purch_amt) FROM orders;
SELECT AVG(purch_amt) FROM orders;
SELECT COUNT(cust_name) FROM customers WHERE cust_name IS NOT NULL GROUP BY cust_name;
SELECT MIN(purch_amt) FROM orders;
SELECT * FROM customers WHERE cust_name LIKE '%b';
SELECT ord_no FROM orders WHERE customer_id in (SELECT customer_id FROM customers WHERE city='New York');
SELECT * FROM customers WHERE customer_id in(SELECT customer_id FROM orders WHERE purch_amt>10);
SELECT SUM(grade) FROM customers;
SELECT * FROM customers WHERE cust_name IS NOT NULL;
SELECT MAX(grade) FROM customers;
SELECT format('%s from %s',cust_name, city) as INFO FROM customers;
ALTER TABLE customers 
ADD COLUMN avg_grade int;
ALTER TABLE customers 
ALTER COLUMN avg_grade SET DEFAULT 100;
SELECT ceil(grade/avg_grade) AS AVG FROM customers;



