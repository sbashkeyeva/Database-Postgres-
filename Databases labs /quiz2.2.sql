select m.title, avg(stars) from movie m inner join rating rt on m.mID=rt.mID group by mID order by avg(stars) desc, title asc ;
select m.title, min(stars) from movie m inner join rating rt on m.mID=rt.mID group by m.title order by title;
select title, min(stars) from movie innner join rating using (mID) group by mID order by title;
create materialized view  Alikh as select distinct( title) from movie left  join rating using( mID )  where stars is Null;