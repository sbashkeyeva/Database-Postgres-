create table Products(
	code integer primary key,
	name varchar(255),
	price numeric,
	manufacturer integer
);
create table Manufacturers(
	code integer primary key,
	name varchar(255)
);
INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

select name from products;
select name, price from products;
select name from products where price<=200;
select * from products where price>60 and price<120;
select * from products where price between 60 and 120;
select name, price from products where price>=180 order by (price) desc, (name) asc;
select avg(price), manufacturer from products group by manufacturer;
select avg(price), manufacturers.name from products inner join manufacturers 
   ON Products.Manufacturer = Manufacturers.Code group by manufacturers.name having avg(price)>=150; 
SELECT AVG(Price), Manufacturers.Code
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Code
   HAVING AVG(Price) >= 150;
   select name, price from products order by price asc limit 1 offset 1;
select name, price from products where price=(select min(price) from products);
insert into products (code, name, price, manufacturer) values (11,'Loudspeakers',70,2);
update products set name='Laser Printer' where code =8;
update products set price=price-(price*0.1);
update products set price=price-(price*0.1) where price>=120;