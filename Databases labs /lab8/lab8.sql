CREATE DATABASE lab8;
create table salesman (
	salesman_id integer primary key,
	name varchar(256),
	city varchar(256),
	commission real
);

create table customers (
	customer_id integer primary key,
	cust_name varchar(256),
	city varchar(256),
	grade integer,
	salesman_id integer references salesman
);

create table orders (
	ord_no integer primary key,
	purch_amt real,
	ord_date date,
	customer_id integer references customers, 
	salesman_id integer references salesman
);
--3
CREATE ROLE junior_dev WITH LOGIN PASSWORD 'DatabaseIsLife';
--4
CREATE VIEW avg_total_ord as SELECT s.name, AVG(o.purch_amt), SUM(o.purch_amt)  FROM salesman s JOIN orders o using(salesman_id) GROUP BY s.name;
--5 join zhasau kerek
CREATE VIEW num_in_city AS SELECT  customers.city, count(orders.ord_no) FROM customers JOIN orders USING(customer_id) GROUP BY(city);
GRANT ALL PRIVILEGES ON view_one TO junior_dev;
--6
CREATE VIEW view_two AS SELECT*FROM customers WHERE grade=(SELECT grade FROM customers  ORDER BY grade  ASC LIMIT 1 OFFSET 0);
GRANT SELECT on view_two TO junior_dev;
--7
CREATE VIEW customer_grade AS SELECT count(*), grade FROM customers GROUP BY grade;
--8
CREATE VIEW view_four AS SELECT salesman_id FROM customers GROUP BY salesman_id having COUNT(ord_no)>1
--9
CREATE ROLE intern;
REASSIGN OWNED BY junior_dev TO intern;


