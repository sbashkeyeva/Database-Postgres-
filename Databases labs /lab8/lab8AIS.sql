create database lab8;

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

create role junior_dev login;

create view new_york_salesmans as select * from salesman where city='New York';

create view orders_view as select orders.ord_no, salesman.name, customers.cust_name FROM orders 
join customers on ((orders.customer_id = customers.customer_id))
join salesman on ((orders.salesman_id = salesman.salesman_id));

grant all privileges on orders_view to junior_dev;

create view highest_grade as select * from customers where grade = (
	select grade from customers order by grade asc limit 1 offset 0
);

grant select on highest_grade to junior_dev;

create view city_view as select city, count(salesman_id) from salesman group by city;

create view more_than_one as select salesman_id from customers group by salesman_id having count(customer_id) > 1;

create role intern;

grant junior_dev to intern;
