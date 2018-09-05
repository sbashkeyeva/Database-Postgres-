create role junior_dev with login password '123';
create table salesman(
salesman_id integer primary key,
name varchar(255),
city varchar(255),
commision float);

create table customers(
customer_id integer primary key,
cust_name varchar(255),
city varchar(255),
grade integer,
salesman_id integer references salesman);

create table orders(
ord_no integer primary key,
purch_amt float,
ord_date date,
customer_id integer references customers,
salesman_id integer references salesman);

create view view1 as select salesman_id, name, city from salesman;

create view view2 as select * from salesman where city='New York' and commision>0.13;
grant all privileges on view2 to junior_dev;

create view view3 as select * from customers where grade=(select max(grade) from customers);
grant select on view3 to junior_dev;

create view view4 as select city, count(city) from salesman group by city;

create view view5 as select salesman_id, count(salesman_id) from customers group by salesman_id having count(salesman_id)>1;

create role intern;
reassign owned by junior_dev to intern;