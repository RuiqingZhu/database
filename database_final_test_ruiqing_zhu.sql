drop database if exists `furnitureRentals`;
create database `furnitureRentals`;
use `furnitureRentals`;

drop table if exists `Customers`;
create table `Customers` (
`customerId` smallint not null,
`firstName` varchar(30),
`address` varchar(100),
`city` varchar(20),
`state` char(2) not null,
`zip` int not null,
`telephone` varchar(20) not null,
`email` varchar(20) null,
primary key (`customerId`)
);

drop table if exists `Inventory`;
create table `Inventory` (
`itemId` char(5) not null,
`description` varchar(30) not null,
`pricePerMonth` smallint not null,
primary key (`itemId`)
);

alter table `Inventory`
add unique key (`description`);

drop table if exists `Rentals`;
create table `Rentals` (
`rentalNumber` smallint not null auto_increment,
`customerId` smallint not null,
`dateRental` date not null,
`dateReturn` date null,
primary key (`rentalNumber`),
foreign key (`customerId`) references `Customers`(`customerId`)
);

alter table `Rentals`
add check (`dateReturn` > `dateRental`);

drop table if exists `RentalLine`;
create table `RentalLine` (
`rentalId` smallint not null,
`itemId` char(5) not null,
`quantity` smallint not null,
primary key (`rentalId`, `itemId`),
foreign key (`rentalId`) references `Rentals`(`rentalNumber`),
foreign key (`itemId`) references `Inventory`(`itemId`)
);

alter table `RentalLine`
alter `quantity` set default 1;

insert into `Customers`
values
(101, 'John', '34 Redback Road', 'Austin', 'TX', 78701, '(512)998-0675', 'jsmith@pcp.net'),
(102, 'Mary', '9 Elm Rich Road', 'WoodsHol', 'MA', 02543, '(508)443-3212', '');

insert into `Inventory`
values
('C‐101' , 'desk chair' , 15),
('C‐102' , 'kitchen chair' , 12),
('D‐101' , 'single dresser' , 30),
('D‐102' , 'double dresser' , 35);

insert into `Rentals` (`customerId`, `dateRental`, `dateReturn`)
values
(101, '2016-08-30', '2016-12-05'),
(102, '2016-08-15', null);

insert into `RentalLine`
values
(1,'D‐101',1),
(1,'D‐102',1),
(2,'C‐101',1),
(2,'C‐102',2);

-- 1‐ show which customers rented specific items.
select c.firstName Name, i.description Item
from Customers c
inner join Rentals r
on c.customerId = r.customerId
inner join RentalLine rl
on r.rentalNumber = rl.rentalId
inner join Inventory i
on rl.itemId = i.itemId
where description like '%dresser%';

-- 2‐ students who have not returned their rented items after 1 year.
select c.firstName Name, r.dateRental 'Rental Date', r.dateReturn 'Return Date'
from Customers c
inner join Rentals r
on c.customerId = r.customerId
where r.dateReturn - dateRental > 365 or r.dateReturn is null;

-- 3‐ The most popular furniture for rental so it can plan future marketing promotion and warehouse stocking
select i.description Item, rl.quantity 'Times Rented'
from Inventory i
inner join RentalLine rl
on i.itemId = rl.itemId
order by rl.quantity desc;

-- 4‐ Calculate and then shows all the rental money billed to the student for the year 2022
select c.firstName Name, (i.pricePerMonth * 12) 'Yearly Rental Cost 2022'
from Rentals r
inner join RentalLine rl
on r.rentalNumber = rl.rentalId
inner join Inventory i
on rl.itemId = i.itemId
inner join Customers c
on r.customerId = c.customerId
where dateRental like '2022%';

-- 5‐ Show the city which has the highest rate of rentals
select c.city City, count(r.rentalNumber) 'Rate of Rentals' -- Rate of Rentals here means how many times things have been rented by this city
from Rentals r
inner join RentalLine rl
on r.rentalNumber = rl.rentalId
inner join Inventory i
on rl.itemId = i.itemId
inner join Customers c
on r.customerId = c.customerId
group by city
order by count(r.rentalNumber);

-- 6‐ Create a view of all the items and add a column in the report to show the items that are rented as ‘rented’ and the one that are not rented as ‘available’
create view rentalStatus
as
select i.itemId 'Item ID', i.description Item, r.dateRental 'Rental Date', r.dateReturn 'Return Date'
from Customers c
inner join Rentals r
on c.customerId = r.customerId
inner join RentalLine rl
on r.rentalNumber = rl.rentalId
inner join Inventory i
on rl.itemId = i.itemId;

-- to report: Not sure how to achieve this. Sorry...
select Item
from rentalStatus;