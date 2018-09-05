select name from reviewer join rating using rID group by rID having count(*)>=3;
select name from reviewer r where(select count(*) from rating where rating.rID=r.rID)>=3;
select r.name from reviewer r inner join rating rt on r.rID=rt.rID where rt.ratingDate is null;
select title, max(stars) from movie join rating using(mID) group by mID order by title;
select mv.title , max(stars) from Movie mv inner join Rating rt 
on mv.mID = rt.mID where rt.mID != null group by mv.title;

select r.name from reviewer r inner join rating rt on r.rID=rt.rID where rt.ratingDate is null;
select rw.name from Reviewer rw inner join Rating rt
on rw.rID = rt.rID where rt.ratingDate = null;
create view view1 as select title from movie where director='Steven Spielberg';
create view Simba as select title from Movie where director = 'Steven Spielberg';
create role Alikh;
grant select, insert on Simba to Alikh;