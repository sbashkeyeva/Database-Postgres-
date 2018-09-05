create table Highschooler(ID int, name text, grade int);
create table Friend(ID1 int, ID2 int);
create table Likes(ID1 int, ID2 int);
insert into Highschooler values (1510, 'Jordan', 9);
insert into Highschooler values (1689, 'Gabriel', 9);
insert into Highschooler values (1381, 'Tiffany', 9);
insert into Highschooler values (1709, 'Cassandra', 9);
insert into Highschooler values (1101, 'Haley', 10);
insert into Highschooler values (1782, 'Andrew', 10);
insert into Highschooler values (1468, 'Kris', 10);
insert into Highschooler values (1641, 'Brittany', 10);
insert into Highschooler values (1247, 'Alexis', 11);
insert into Highschooler values (1316, 'Austin', 11);
insert into Highschooler values (1911, 'Gabriel', 11);
insert into Highschooler values (1501, 'Jessica', 11);
insert into Highschooler values (1304, 'Jordan', 12);
insert into Highschooler values (1025, 'John', 12);
insert into Highschooler values (1934, 'Kyle', 12);
insert into Highschooler values (1661, 'Logan', 12);

insert into Friend values (1510, 1381);
insert into Friend values (1510, 1689);
insert into Friend values (1689, 1709);
insert into Friend values (1381, 1247);
insert into Friend values (1709, 1247);
insert into Friend values (1689, 1782);
insert into Friend values (1782, 1468);
insert into Friend values (1782, 1316);
insert into Friend values (1782, 1304);
insert into Friend values (1468, 1101);
insert into Friend values (1468, 1641);
insert into Friend values (1101, 1641);
insert into Friend values (1247, 1911);
insert into Friend values (1247, 1501);
insert into Friend values (1911, 1501);
insert into Friend values (1501, 1934);
insert into Friend values (1316, 1934);
insert into Friend values (1934, 1304);
insert into Friend values (1304, 1661);
insert into Friend values (1661, 1025);
insert into Friend select ID2, ID1 from Friend;

insert into Likes values(1689, 1709);
insert into Likes values(1709, 1689);
insert into Likes values(1782, 1709);
insert into Likes values(1911, 1247);
insert into Likes values(1247, 1468);
insert into Likes values(1641, 1468);
insert into Likes values(1316, 1304);
insert into Likes values(1501, 1934);
insert into Likes values(1934, 1501);
insert into Likes values(1025, 1101);

select h1.name, h2.name from Highschooler h1 join Friend f1 on h1.ID=f1.ID1 join Highschooler h2 on h2.ID=f1.ID2 where h1.name='Gabriel' or h2.name='Gabriel';

select h1.name, h1.grade,h2.name,h2.grade from Highschooler h1 join Likes l on h1.ID=l.ID1 join Highschooler h2 on h2.ID=l.ID2 where (h1.grade-h2.grade)>=2;
select h1.name from Highschooler h1 inner join Likes l on h1.id = l.id2
where (select count(id1) from Likes where id2 = h1.id) > 1;
select distinct h1.ID, h2.ID from highschooler h1 join friends h1 on h1.id=f1.id1 join highschooler h2 on h2.id=f1.id2 where h1.grade=h2.grade;

SELECT name, grade
FROM Highschooler H1
WHERE ID NOT IN (
  SELECT ID1
  FROM Friend, Highschooler H2
  WHERE H1.ID = Friend.ID1 AND H2.ID = Friend.ID2 AND H1.grade <> H2.grade
)
ORDER BY grade, name;
SELECT H1.name, H1.grade, H2.name, H2.grade
FROM Highschooler H1, Highschooler H2, Likes L1, Likes L2
WHERE (H1.ID = L1.ID1 AND H2.ID = L1.ID2) AND (H2.ID = L2.ID1 AND H1.ID = L2.ID2) AND H1.name < H2.name
ORDER BY H1.name, H2.name;






