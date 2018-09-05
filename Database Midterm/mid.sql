CREATE TABLE movies(
	id 		SERIAL,
	title 	VARCHAR(255) 	NOT NULL,
	rating 	INTEGER,
	genre 	VARCHAR(50) 	NOT NULL,
	
	UNIQUE(title),
	PRIMARY KEY(id)
);

CREATE TABLE theaters(
	id 		SERIAL,
	name 	VARCHAR(255)	NOT NULL,
	size 	INTEGER 		NOT NULL,
	city 	VARCHAR(50)		NOT NULL,
	
	PRIMARY KEY(id),
	UNIQUE(name),
	CHECK(size >= 3)
);

INSERT INTO movies(title, rating, genre) values
	('QWERTY', 5, 'asd'),
	('ZXCVBN', 6, 'asd'),
	('ASDFGH', 7, 'zxc');


INSERT INTO movies(title, rating, genre) values
	('FGHJKL', NULL, 'zxc');

	
INSERT INTO theaters(name, size, city) values
	('QWERTY', 5, 'asd'),
	('ZXCVBN', 6, 'asd'),
	('ASDFGH', 7, 'zxc');
	
SELECT DISTINCT ON(genre) title FROM movies;

SELECT * FROM movies 
	ORDER BY rating ASC LIMIT 3;
	
SELECT * FROM theaters
	ORDER BY size ASC 
		LIMIT 1 OFFSET 2;
		
SELECT * FROM movies
	WHERE rating IS NULL;
	
SELECT * FROM theaters
		WHERE theaters.city = ('asd' OR 'zxc')
			AND movies.rating > 5;
	

	
	


