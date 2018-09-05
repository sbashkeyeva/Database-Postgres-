
create table movies(
	id serial primary key,
	title varchar(255) not null unique,
	rating integer,
	genre varchar(50) not null
);
create table theaters(
	id serial primary key,
	name varchar(255) not null unique,
	size integer check(size>=3) not null,
	city varchar(50) not null
);
INSERT INTO movies(title, rating, genre) VALUES
('Citizen Kane', 5, 'Drama'), 
('Singin in the rain', 7, 'Comedy'),
('The Wizard of Oz', 7, 'Fantasy'),
('The Quiet Man', null, 'Comedy'),
('North by Northwest', null, 'Thriller'),
('The Last Tango in Paris', 9, 'Drama'),
('Some Like It Hot', 4, 'Comedy'),
('A Night at the Opera', null, 'Comedy');

INSERT INTO theaters(name, size, city) VALUES 
('Kinopark Esentai', 15, 'Almaty'),
('Star Cinema Mega', 7, 'Almaty'),
('Kinopark 8', 9, 'Shymkent'),
('Star Cinema 15', 11, 'Astana'),
('Cinemax', 4, 'Aktau');
select distinct on (genre) title from movies;
select title from movies order by rating desc nulls last limit 3 offset 0 ;
select name from theaters order by size desc limit 1 offset 2;
select * from movies where rating is null;
select * from theaters where (city='Almaty' or city='Shymkent') and size>7;
select id as MovieID, format('The genre of %s is %s',title, genre) as MovieInfo from movies;
create table movietheaters(
	theater_id references theaters ,
	movie_id references movies ,
	rating integer
	primary key(theater_id,movie_id)
);
select * from theaters where id not in (select theater_id from movietheaters);
select rating,
case when rating>0 and rating<3 then 'Low rating'
when rating>4 and rating<7 then 'Medium rating'
when rating>8 and rating<10 then 'High rating'
else 'No rating'
end
from movies;
update movies set rating=1 where rating is null returning*;
delete from movies where id not in(select movie_id from movietheaters ) returning*;
select * from movies where title like 'T_e%n';
select genre, avg(rating)from movies group by genre;
select * from theaters where id in(select theater_id from movietheaters group by(theater_id) having count(*)>1);


