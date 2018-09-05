--1 Askhat
SELECT reviewer.name FROM reviewer INNER JOIN rating USING(rID)
  WHERE rating.stars >= 3;
--1
--Find the names of all reviewers who have contributed
-- three or more ratings. (As an extra challenge, try writing 
--the query without HAVING or without COUNT.)
select name 
from reviewer join rating using (rid) 
group by rid 
having count(*) >= 3
--1
select name 
from reviewer r 
where 3<=(select count(*) 
          from rating 
          where rating.rid = r.rid)
--2
--For each movie that has at least one rating, find the highest number of stars 
--that movie received. Return the movie title and number of stars. Sort by movie title.
select title, max(stars)
from movie join rating using (mid)
group by title
order by title
--2 Askhat
SELECT movie.title, rating.stars from movie inner join rating using(mID) 
where rating.stars=(select max(stars) from rating) order by movie.title ASC;
--3
--Some reviewers didn't provide a date with their rating. Find the names of all
-- reviewers who have ratings with a NULL value for the date.
select name from reviewers join rating using(rid) where ratingdate is null;
--3 Askhat
select reviewer.name from reviewer inner join rating using(rid) where ratingdate is null;
create view view1 on 
 select title from movie where director="sdfsdfas";