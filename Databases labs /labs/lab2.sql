CREATE DATABASE lab2;
CREATE TABLE countries
(
	country_id serial CONSTRAINT imp_key Primary key,
	country_name varchar,
	region_id integer,
	population integer
);
INSERT INTO countries 
VALUES (1111,'KZ',2,7777);
SELECT * FROM countries;
INSERT INTO countries (country_id, country_name)
VALUES(2222,'UK');
SELECT * FROM countries;
INSERT INTO countries(region_id) 
VALUES (NULL);
SELECT * FROM countries;
INSERT INTO countries 
VALUES
(3333,'UAE',4, 9999),
(4444,'RU',5,0000),
(5555,'USA',6,6666);
ALTER TABLE countries 
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
INSERT INTO countries(country_name)VALUES(DEFAULT);
INSERT INTO countries DEFAULT VALUES;
CREATE TABLE new_countries(lIKE countries);
INSERT INTO new_countries SELECT * FROM countries ;
SELECT * FROM new_countries ;
UPDATE new_countries 
SET region_id=1
where region_id IS NULL ;
UPDATE new_countries 
SET population=population*1.10
RETURNING country_name, population as NewPopulation;
DELETE FROM new_countries 
WHERE POPULATION<100000;
DELETE FROM new_countries 
USING countries 
where new_countries.country_id=countries.country_id
returning *;
DELETE FROM countries 
RETURNING *;
