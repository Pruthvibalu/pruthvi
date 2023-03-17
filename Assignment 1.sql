show databases;
use edyoda_practice;
create table SalesPeople(Snum int,Sname varchar(15),city varchar(15),Comm int,primary key(Snum));
drop table SalesPeople;
desc table SalesPeople;
insert into SalesPeople values
(1001,'Peel','London',12),
(1002,'Serres','Sanjose',13),
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10);
select * from SalesPeople;
create table Customers(Cnum int,Cname varchar(15),city varchar(15),Snum int,primary key(Cnum),foreign key(Snum) references SalesPeople(Snum) );
desc customers;
drop table customers;
insert into Customers values
(2001,'Hoffman','London',1001),
(2002,'Giovanni','Rom',1003),
(2003,'Liu','Sanjose',1002),
(2004,'Grass','Berlin',1002),
(2006,'Clemens','London',1001),
(2008,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);
select * from customers;

create table Orders(Onum int,Amt float,Odate varchar(15),Cnum int,Snum int,primary key(Onum),foreign key(Cnum) references customers(Cnum),foreign key(Snum) references SalesPeople(Snum));
desc Orders;
drop table Orders;
insert into Orders values
(3001,18.69,'3-10-1990',2008,1007),
(3003,767.19,'3-10-1990',2001,1001),
(3002,1900.10,'3-10-1990',2007,1004),
(3005,5160.45,'3-10-1990',2003,1002),
(3006,1098.16,'3-10-1990',2008,1007),
(3009,1713.23,'4-10-1990',2002,1003),
(3007,75.75,4-10-1990,2004,1002),
(3008,4273.00,'5-10-1990',2006,1001),
(3010,1309.95,'6-10-1990',2004,1002),
(3011,9891.88,'6-10-1990',2006,1001);
select * from orders;

-- #1. Count the number of Salesperson whose name begin with ‘a’/’A’.
select Sname,count(Sname)
from SalesPeople
where Sname like 'A%';

-- 2.Display all the Salesperson whose all orders worth is more than Rs. 2000.
select s.Sname as Salesperson,o.Amt as Amount
from SalesPeople s,Orders o
where Amt>2000 and
s.Snum=o.Snum;

-- 3.Count the number of Salesperson belonging to Newyork.
select count(city) 
from SalesPeople
where city='Newyork';

-- 4. Display the number of Salespeople belonging to London and belonging to Paris
select count(city) 
from SalesPeople
where city='london' or city='psris';

-- 5.Display the number of orders taken by each Salesperson and their date of orders. 
select s.Sname,count(o.Onum) as num_of_orders,o.Odate
from SalesPeople s,Orders o 
where s.Snum=o.Snum
group by s.Snum;
