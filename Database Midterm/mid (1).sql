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
		WHERE (city = 'asd' OR city = 'zxc') AND size > 7;
	
SELECT id AS MovieID, CONCAT('The genre of ', title,' is ', genre) AS MovieInfo
    FROM movies ORDER BY id;

CREATE TABLE movietheaters(
	theater_id 	INTEGER REFERENCES theaters,
	movie_id 	INTEGER REFERENCES movies,
	rating 		INTEGER,
	
	PRIMARY KEY(theater_id, movie_id)
);

SELECT id FROM theaters EXCEPT SELECT theater_id FROM movietheaters;

SELECT rating, 
	CASE WHEN rating >=0 AND rating <=3 THEN 'Low_rating'
		WHEN rating >=4 AND rating <=7 THEN 'Med_rating'
		WHEN rating >=8 AND rating <=10 THEN 'H_rating'
		WHEN rating is null then 'no_rating'
	END
	FROM movies;
	
UPDATE movies SET rating = 1 WHERE rating IS NULL RETURNING *;


			




	


	
	


