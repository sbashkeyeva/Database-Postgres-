
select distinct on(manufacturer) name from products;
select code, manufacturer from products limit 3;
select name, price from products where price>=120;
select name from products where manufacturer=(select code from manufacturers where name='Sony');
select products.name from products inner join manufacturers on manufacturers.code=products.manufacturer where manufacturers.name='Sony';
select name, price from products where price<=110 order by price asc,manufacturer desc;
select manufacturer,count(manufacturer) from products group by manufacturer;
select manufacturer, count(*) from products group by manufacturer;
delete from manufacturers where code in (select manufacturer from products group by manufacturer having count(*)<1);
update products set price=price+10 where price =(select price from products order by price  limit 1 offset 2) returning name,price;
alter table products alter column price set default 0;
insert into products ( code,name, price, manufacturer) values (12,'Loudspekers',default,2);
update products set price=price-(price*0.2) where manufacturer=(select code from manufacturers where name ='Fujitsu');
update products set price=price*0.9 where price between 50 and 200;
