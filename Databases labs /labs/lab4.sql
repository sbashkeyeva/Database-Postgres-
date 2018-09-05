CREATE TABLE Warehouses(
	Code INTEGER,
	Location VARCHAR(255),
	Capacity INTEGER
);

CREATE TABLE Boxes(
	Code VARCHAR,
	Contents VARCHAR(255),
	Value INTEGER,
	Warehouse INTEGER
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

SELECT * FROM Warehouses;

SELECT * FROM Boxes 
	WHERE Value > 150;

SELECT DISTINCT Contents, COUNT(*) FROM Boxes
	GROUP BY Contents;
	
SELECT Warehouse, COUNT(*) FROM Boxes 
	GROUP BY Warehouse; 
	
SELECT Warehouse, COUNT(*) FROM Boxes 
	GROUP BY Warehouse
		HAVING COUNT(*) > 2; 
		
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(6,'New York',3);
 
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('H5RT','Papers',200,2);

UPDATE Boxes 
	SET Value = Value * 0.85
		WHERE Value = (SELECT Value FROM Boxes 
						ORDER BY Value 
							DESC LIMIT 1 OFFSET 2);
							
DELETE FROM Boxes WHERE Value < 150;

DELETE FROM Boxes 
	WHERE Warehouse in (SELECT Code FROM Warehouses 
						WHERE Location = 'New York') 
		RETURNING *;

