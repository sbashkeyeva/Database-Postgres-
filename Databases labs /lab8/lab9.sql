CREATE DATABASE lab9;
create table reviewer (
	rID integer primary key,
	name varchar(255),
);
create table rating (
	rID integer references Reviewer,
    mID integer references Movie
	stars integer,
	ratingDate date,
	name varchar(255),
);
create table movie (
	mID integer primary key,
	director varchar(255),
	title varchar(255),
);
--2
create view counter_of_raitings as select name from reviewer join rating using (rID) group by rID having count(*) >= 3
--3
create index speedy_Blitz on reviewer(rID);
--4
create role admin WITH LOGIN CREATEROLE;
--5
create role root with createdb ;
create role newRoot;
grant root to newRoot;
--6
reassign owned by root to newRoot;


