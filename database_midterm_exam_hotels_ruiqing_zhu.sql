DROP DATABASE IF EXISTS RSM;
CREATE DATABASE RSM;

USE RSM;

DROP TABLE IF EXISTS hotels;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS reservations;

CREATE TABLE hotels (
    `hotel_id` INT NOT NULL AUTO_INCREMENT,
    `hotel_name` VARCHAR(50),
    `street` VARCHAR(50),
    `state` VARCHAR(30),
    `country` VARCHAR(30),
    PRIMARY KEY (`hotel_id`)
);

CREATE TABLE clients (
    `client_id` INT NOT NULL AUTO_INCREMENT,
    `client_first_name` VARCHAR(30),
    `client_last_name` VARCHAR(30),
    `client_address` VARCHAR(50),
    `birth_date` DATE,
    `phone_number` VARCHAR(20),
    PRIMARY KEY (`client_id`),
    UNIQUE KEY (`phone_number`)
);

CREATE TABLE rooms (
    `room_number` INT NOT NULL AUTO_INCREMENT,
    `room_type` VARCHAR(30),
    `room_view` VARCHAR(30),
    `room_status` VARCHAR(30),
    `hotel_id` INT,
    PRIMARY KEY (`room_number`),
    FOREIGN KEY (`hotel_id`)
        REFERENCES hotels (`hotel_id`)
);

CREATE TABLE reservations (
    `reserve_num` INT NOT NULL AUTO_INCREMENT,
    `client_id` INT,
    `hotel_id` INT,
    `reserve_status` VARCHAR(30),
    `room_num` INT,
    `checkin_date` DATE,
    `checkout_date` DATE,
    PRIMARY KEY (`reserve_num`),
    FOREIGN KEY (`client_id`)
        REFERENCES clients (`client_id`),
    FOREIGN KEY (`hotel_id`)
        REFERENCES hotels (`hotel_id`),
    FOREIGN KEY (`room_num`)
        REFERENCES rooms (`room_number`)
);

INSERT INTO hotels (`hotel_name`, `street`, `state`, `country`)
VALUES
("Holiday Inn","Ap #586-5489 Hymenaeos. Rd.","North Region","Peru"),
("AppleTree","329-8461 Penatibus Rd.","QC","Canada"),
("Hilton","697-477 Congue. Rd.","Arequipa","Netherlands"),
("Fairmont","332-5810 Turpis Ave","QC","Canada"),
("Home Inn","815-1294 Nulla Street","Sachsen-Anhalt","Germany"),
("Marriot","P.O. Box 238, 1384 Leo, Rd.","Junín","Turkey"),
("Shangri-La","P.O. Box 296, 2377 Risus. St.","QC","Vietnam"),
("Novotel","Ap #648-1942 Orci Rd.","Warmińsko-mazurskie","Netherlands"),
("Westin","Ap #853-5561 Bibendum. St.","Akwa Ibom","Germany"),
("Crowne Plaza","P.O. Box 675, 3057 Pede Avenue","łódzkie","Vietnam");

INSERT INTO clients (`client_first_name`,`client_last_name`,`client_address`,`birth_date`,`phone_number`)
VALUES
  ("Noelle","Odysseus","9776 Sed Street","1994-02-04","(854) 880-5148"),
  ("Raya","Debra","Ap #181-1795 Tempor, Rd.","1996-09-29","(512) 305-0242"),
  ("Blake","Richard","P.O. Box 806, 6547 Non Av.","1997-03-01","(438) 305-0243"),
  ("Rafael","Hayes","Ap #879-3413 Nullam Rd.","1995-12-14","(438) 305-0242"),
  ("Dieter","Clio","621-8621 Donec Av.","2004-06-03","(157) 200-5346"),
  ("Camden","Orla","Ap #734-9390 Fermentum Ave","1991-07-13","(512) 305-0442"),
  ("Melodie","Jacob","P.O. Box 803, 5916 Nisi Street","1993-04-10","(843) 685-7288"),
  ("Quamar","Cheryl","592-767 Facilisis St.","1987-08-04","(900) 668-4118"),
  ("Kiara","Lunea","Ap #552-617 Ultrices St.","2003-10-07","(980) 694-4822"),
  ("Geraldine","Timothy","Ap #692-602 Consequat, Ave","1985-11-02","(438) 305-2242");

INSERT INTO rooms (`room_type`, `room_view`, `room_status`, `hotel_id`)
VALUES
("Single Bed", "Garden View", "Vacant", "1"),
("Single Bed", "Garden View", "Vacant", "2"),
("Twin Bed", "Ocean View", "Reserved", "1"),
("Double Bed", "Balcony View", "Reserved", "3"),
("Queen Bed", "Park View", "Vacant", "4"),
("King Bed", "Garden View", "Vacant", "2"),
("Single Bed", "Mountain View", "Reserved", "6"),
("Double Bed", "Ocean View", "Reserved", "2"),
("Honeymoon Suite", "Garden View", "Vacant", "1"),
("Presidential Suite", "Mountain View", "Vacant", "9"),
("Single Bed", "Garden View", "Vacant", "5"),
("Single Bed", "Garden View", "Vacant", "7"),
("Twin Bed", "Ocean View", "Reserved", "8"),
("Double Bed", "Balcony View", "Reserved", "4"),
("Queen Bed", "Park View", "Vacant", "6"),
("King Bed", "Garden View", "Vacant", "4"),
("Single Bed", "Mountain View", "Reserved", "9"),
("Double Bed", "Ocean View", "Reserved", "10"),
("Honeymoon Suite", "Garden View", "Vacant", "10"),
("Presidential Suite", "Mountain View", "Vacant", "3");

INSERT INTO reservations (`client_id`, `hotel_id`, `reserve_status`, `room_num`, `checkin_date`, `checkout_date`)
VALUES
(6,9,"Reserved",17,"2023-02-11","2023-02-12"),
(3,3,"Reserved",18,"2023-02-13","2023-03-20"),
(3,6,"Reserved",9,"2022-12-10","2023-03-17"),
(4,7,"Reserved",4,"2022-12-22","2023-01-18"),
(3,6,"Reserved",4,"2022-12-05","2022-12-10"),
(7,2,"Reserved",20,"2022-11-27","2023-05-06"),
(7,3,"Vacant",8,NULL,NULL),
(7,2,"Reserved",13,"2022-12-13","2023-03-20"),
(9,6,"Reserved",16,"2022-12-28","2022-12-31"),
(4,3,"Reserved",9,"2022-12-23","2023-01-19"),
(9,5,"Reserved",14,"2022-12-30","2023-05-20"),
(8,5,"Reserved",19,"2023-01-15","2023-01-21"),
(1,5,"Reserved",4,"2023-01-05","2023-01-25"),
(10,7,"Reserved",16,"2023-04-13","2023-05-07"),
(6,5,"Vacant",9,NULL,NULL),
(10,1,"Reserved",16,"2022-12-20","2023-01-06"),
(5,8,"Vacant",16,NULL,NULL),
(8,2,"Reserved",4,"2022-12-05","2022-12-10"),
(1,8,"Reserved",16,"2022-12-05","2023-02-19"),
(7,4,"Vacant",20,NULL,NULL),
(9,6,"Vacant",20,NULL,NULL),
(5,9,"Vacant",7,NULL,NULL),
(7,7,"Vacant",14,NULL,NULL),
(2,1,"Vacant",13,NULL,NULL),
(2,4,"Reserved",4,"2022-12-06","2022-12-09"),
(8,6,"Vacant",10,NULL,NULL),
(3,9,"Vacant",18,NULL,NULL),
(2,2,"Reserved",2,"2022-12-15","2023-03-08"),
(9,2,"Reserved",8,"2023-01-07","2023-01-30"),
(6,9,"Reserved",17,"2023-01-11","2023-01-20"),
(2,8,"Vacant",12,NULL,NULL);

-- 1- Create a query to give all the hotels in ‘QC’ which is in Canada
SELECT *
FROM hotels
WHERE state = 'QC' AND country = 'Canada';

-- 2- Create a query that returns all the first_name and last_name with “: ” seperated (Reza:Shalchian) as 1 field ‘client_name’ who have birthday in March
SELECT concat_WS(':', client_first_name, client_last_name) client_name
FROM clients
WHERE birth_date like '%-03-%';

-- 3- Create a query to give all the rooms that are ‘single bed’ and not reserved as status
SELECT *
FROM rooms
WHERE room_type = 'Single Bed' AND room_status != 'Reserved';

-- 4- Create a query that return count of all the reservations that the status of reservation is confirmed.
SELECT count(*)
FROM reservations
WHERE reserve_status = 'Reserved';

-- 5- Create a query to show all reservations that checking in dates are in 2023-02
SELECT *
FROM reservations
WHERE checkin_date like '%2023-02%';

-- 6- Create a query that shows all the room types and count of each.
-- a. ‘single bed’, 6
-- b. ‘double’, 2
-- c. ‘honeymoon suite’ , 1
SELECT room_type, count(room_type)
FROM rooms
GROUP BY room_type;

-- 7- Create a query that sorts all the client by their birthdate and shows 3 of oldest customers
SELECT *
FROM clients
ORDER BY birth_date
LIMIT 3;

-- 8- Create a query that gives the customers who have a phone number that has area code 438 or 512
SELECT *
FROM clients
WHERE phone_number like '(438)%' or phone_number like '(512)%';