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
select distinct on(city) name from theaters;
select * from theaters order by size desc limit 3 offset 0;
select * from movies order by rating desc limit 1 offset 2;
select * from movies where rating is not null;
select * from movies where (genre='Comedy' or genre='Fantasy') and rating is not null;
 select id as MovieID,
case when rating>=0 and rating<=3 then format('The rating of %s is Low',title)
     when rating>=4 and rating<=7 then format('The rating of %s is Medium',title)
     when rating>=8 and rating<=10 then format('The rating of %s is High', title)
     else 'no rating'
end  as MovieInfo from movies;
create table movietheaters (
	theater_id references theaters,
	movie_id references movies,
	rating integer,
	primary key(theater_id,movie_id)
);
select * from movies where id is not in (select movie_id from movietheaters group by(movie_id));
select upper(title), substring(title from 4 for char_length(title)-3) from movies;
select overlay(title placing ' ' from 1 for 3) from movies;
select char_length(title) from movies ;
delete from movies where id not in (select movie_id from movietheaters ) returning*;
update movies set rating=1 where rating is null;
select * from movies  where title like 'S%o_';
select avg(size), city from theaters group by city;
select * from movies where id in(select movie_id from movietheaters group by movie_id having count(theater_id)>2);

