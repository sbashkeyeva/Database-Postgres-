create database lab4;

create table warehouses(
	code integer primary key,
	location varchar(255),
	capacity integer
);

create table boxes(
	code varchar(4),
	contents varchar(255),
	value real,
	warehouse integer
);

INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

 select *from warehouses

 select *from boxes where contents='Rocks';

 select distinct on(warehouse) *from boxes;

 select contents,count(contents) from boxes group by contents;

 select contents,count(contents) from boxes group by contents having contents='Rocks';

 insert into warehouses(code,location,capacity) values(6,'New York',5);

 insert into boxes(code,contents,value,warehouse) values('H5RT','Rocks',120,1);

 update boxes set value=value*0.8 where value=(select value from boxes order by value desc offset 2 limit 1);

 delete from boxes where value<150;

 delete from boxes where warehouse in (select code from warehouses where location='New York') returning boxes.code,boxes.warehouse;
 


































