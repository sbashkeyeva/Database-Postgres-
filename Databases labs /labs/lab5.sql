CREATE TABLE customers(
	customer_id INTEGER,
	cust_name VARCHAR(255),
	city VARCHAR(255),
	grade INTEGER,
	salesman_id INTEGER
);


INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3002,'Nick Rimando','New York', 100,5001);
INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3006,'Nick sdfds','New York', 200,5001);
INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3003,'rewer weewrwe','fsdfsdf York', 121,5002);
INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3004,'sdgsd','vcmnbmvc', 120,5003);
INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3005,'oioio','mnbn', 313,5004);

SELECT * FROM customers WHERE grade > 100;

SELECT * FROM customers 
	WHERE city='New York' AND grade>100;

SELECT * FROM customers 
	WHERE city='New York' OR grade>100;

SELECT * FROM customers
	WHERE city='Rome' OR city='Paris';
	
SELECT * FROM customers 
	WHERE cust_name LIKE 'B%';
	
CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	description VARCHAR,
	purch_amt INTEGER
);
	
SELECT * FROM orders
	WHERE customer_id=(SELECT customer_id FROM customers 
						WHERE city='New York');
						
SELECT * FROM customers 
	WHERE customer_id=(SELECT customer_id FROM orders
						WHERE purch_amt>10);
				
SELECT SUM(purch_amt) FROM orders;

SELECT AVG(purch_amt) FROM orders;

SELECT * FROM customers 
	WHERE cust_name != NULL;

SELECT MAX(purch_amt) FROM orders;

