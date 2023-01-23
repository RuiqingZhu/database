-- Cinema online booking system

-- cinema_booking_system
create database cinema_booking_system;
use cinema_booking_system;

-- films
-- name, length
CREATE TABLE films (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    length_minutes INT,
    PRIMARY KEY (id)
);

-- customers
-- first_name, last_name, email
CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    PRIMARY KEY (id)
);

-- rooms
-- name, no_seats (number of seats, not seat numbers)
CREATE TABLE rooms (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    number_of_seats INT,
    PRIMARY KEY (id),
    UNIQUE KEY (name)
);

-- screening
-- film_id, room_id, start_time
CREATE TABLE screening (
    id INT NOT NULL AUTO_INCREMENT,
    film_id INT,
    room_id INT,
    start_time TIME,
    PRIMARY KEY (id),
    FOREIGN KEY (film_id)
        REFERENCES films (id),
    FOREIGN KEY (room_id)
        REFERENCES rooms (id)
);

-- seats
-- row, number, room_id
CREATE TABLE seats (
    id INT NOT NULL AUTO_INCREMENT,
    row_num INT,
    seat_number INT,
    room_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (room_id)
        REFERENCES rooms (id)
);

-- bookings
-- screening_id, customer_id
CREATE TABLE bookings (
    id INT NOT NULL AUTO_INCREMENT,
    screening_id INT,
    customer_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (screening_id)
        REFERENCES screening (id),
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
);

-- reserved_seats
-- booking_id, seat_id
CREATE TABLE reserved_seats (
    id INT NOT NULL AUTO_INCREMENT,
    booking_id INT,
    seat_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (booking_id)
        REFERENCES bookings (id),
    FOREIGN KEY (seat_id)
        REFERENCES seats (id)
);


insert into `films` (`name`,`length_minutes`)
values
("In condimentum. Donec",72),
("libero. Proin",63),
("Nunc laoreet lectus quis",91),
("nibh vulputate mauris sagittis",119),
("Nunc mauris.",63),
("ullamcorper eu, euismod",67),
("dis parturient",77),
("lobortis. Class",69),
("lectus convallis est, vitae",70),
("nec, imperdiet nec, leo.",64),
("Nullam feugiat",117),
("dui quis accumsan",100),
("ultrices a,",101),
("quis turpis vitae purus",106),
("accumsan",62),
("Phasellus ornare. Fusce mollis.",94),
("Nunc mauris. Morbi non sapien",84),
("Nunc pulvinar",86),
("suscipit nonummy. Fusce fermentum",97),
("tincidunt, neque vitae semper",86);

insert into `customers` (`first_name`, `last_name`, `email`)
values
("Tobias","Jarvis","enim.nec@aol.com"),
("Florence","William","aliquet@yahoo.org"),
("Burke","Steele","a@google.net"),
("Emerson","Steele","libero.donec@yahoo.edu"),
("Mary","Calderon","volutpat.nunc.sit@protonmail.net"),
("Dana","Bailey","blandit.mattis@icloud.edu"),
("Channing","Carney","condimentum.donec.at@yahoo.org"),
("Connor","Moore","vulputate@aol.net"),
("Jordan","Sherman","tempor.erat.neque@aol.edu"),
("Lavinia","Torres","vitae@google.net"),
("Kyra","Villarreal","tempus.lorem@protonmail.edu"),
("Miriam","Bowen","dolor.quisque@hotmail.couk"),
("Ferris","Price","sed.dolor@protonmail.edu"),
("Signe","Gilbert","cum.sociis.natoque@icloud.edu"),
("Pamela","Glass","molestie.sodales@outlook.net"),
("Dane","Lee","ullamcorper.velit@icloud.net"),
("Samson","Peck","sed@outlook.com"),
("Chadwick","Cole","orci@icloud.net"),
("Marvin","Dodson","orci.sem@icloud.net"),
("Malcolm","Ferguson","eget.laoreet.posuere@icloud.edu");
  
insert into `rooms` (`name`,`number_of_seats`)
values
("ligula",304),
("sagittis.",280),
("dui",399),
("et",261),
("adipiscing,",269),
("auctor,",278),
("eget",216),
("non",203),
("odio",251),
("Mullia",273),
("justo",322),
("Aliquam",210),
("augue",373),
("lectus",229),
("in",304),
("dolor.",219),
("jut",312),
("nulla",263),
("sit",241),
("at",227);
  

insert into `screening` (`film_id`,`room_id`,`start_time`)
values
(12,60,"10:32"),
(2,56,"23:10"),
(5,49,"09:15"),
(11,60,"04:16"),
(6,53,"04:34"),
(6,45,"22:22"),
(14,47,"06:25"),
(11,48,"16:04"),
(14,43,"23:21"),
(3,51,"15:55"),
(15,43,"05:59"),
(3,55,"06:57"),
(3,58,"00:49"),
(8,57,"06:02"),
(8,58,"12:04"),
(16,51,"05:50"),
(6,49,"01:39"),
(13,56,"22:35"),
(3,50,"17:34"),
(7,44,"06:13");

insert into `seats` (`row_num`,`seat_number`,`room_id`)
values
(19,10,59),
(7,18,44),
(10,2,55),
(5,5,57),
(17,6,43),
(5,1,47),
(1,11,52),
(6,18,49),
(8,13,44),
(5,10,41),
(7,8,50),
(6,3,52),
(3,5,50),
(5,7,49),
(13,19,54),
(20,17,52),
(8,10,59),
(14,13,57),
(7,1,45),
(8,12,49);

insert into `bookings` (`screening_id`,`customer_id`)
values
(28,19),
(22,1),
(25,9),
(25,15),
(37,15),
(39,16),
(22,15),
(37,15),
(29,14),
(34,5),
(30,4),
(28,19),
(28,12),
(27,16),
(29,9),
(34,16),
(34,19),
(38,17),
(22,14),
(33,18);

insert into `reserved_seats` (`booking_id`,`seat_id`)
values
(25,33),
(39,31),
(31,24),
(28,29),
(38,39),
(32,32),
(35,22),
(24,24),
(34,37),
(34,29),
(36,22),
(25,36),
(26,28),
(27,25),
(28,22),
(24,24),
(24,29),
(26,26),
(32,26),
(25,24);


-- Create the tables, create the diagram with respect to foreign keys and primary keys. Whenver it is needed, add Unique key. Add primary key columns in each table as needed.
-- for example, add an id column for "films" table and set it as PK, etc.

-- Have some queries:
-- 1. List of all the customers who do not have an email
select *
from customers
where email is null;

-- 2. List of all the rooms that play the film "Nullam feugiat"
select r.name, f.name, scr.start_time
from rooms r
inner join screening scr
on r.id = scr.room_id
inner join films f
on scr.film_id = f.id
and f.name = "Nullam feugiat";

-- 3. List of all the reserved seats that are related to customer name "Pamela"
select s.row_num 'Row Number', s.seat_number 'Seat Number', r.name Room
from seats s
inner join reserved_seats rs
on s.id = rs.seat_id
inner join bookings b
on rs.booking_id =b.id
inner join customers c
on b.customer_id = c.id
inner join rooms r
on s.room_id = r.id
and c.first_name = 'Pamela';

-- 4. Show the count of seats that are in each room
select number_of_seats, name
from rooms;

-- 5. List all the films that are longer than 2 hours
select *
from films
where length_minutes > 120;

-- 6. Show all the rooms sorted by number of seats descending
select *
from rooms
order by number_of_seats desc;

-- 7. Show the row number and seat number that are occupied by "Pamela"
select s.row_num 'Row Number', s.seat_number 'Seat Number', r.name Room, c.first_name 'Taken by'
from seats s
inner join reserved_seats rs
on s.id = rs.seat_id
inner join bookings b
on rs.booking_id =b.id
inner join customers c
on b.customer_id = c.id
inner join rooms r
on s.room_id = r.id
and c.first_name = 'Pamela';