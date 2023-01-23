CREATE DATABASE mobiles;

use mobiles;

CREATE TABLE users (
id INT NOT NULL AUTO_INCREMENT,
Firstname varchar(30) DEFAULT NULL,
Lastname varchar(30) DEFAULT NULL,
Address varchar(100) DEFAULT NULL,
Birthday date DEFAULT NULL,
bad_credit boolean,
overall_usage double(100, 4),
PRIMARY KEY (id)
);

alter table users
modify column bad_credit boolean NOT NULL DEFAULT 0;

insert into users (Firstname, Lastname, Address, Birthday, bad_credit, overall_usage)
values
('Juan', 'Taylor', '123 a street', '1999-01-01', 0, 300),
('Daniel', 'Morton MD', '234 b street', '1998-02-01', 0, 421.50),
('Anthony', 'Rodriguez', '345 c street', '1997-03-01', 0, 101.25),
('Erin', 'Lucero', '456 d road', '1996-04-01', 0, 489.04),
('Steven', 'King', '567 e road', '1995-05-01', 0, 8000.02),
('Stephanie', 'Johnson', '678 f road', '1994-06-01', 1, 13000),
('Sara', 'Welch', '789 g boulevard', '1996-01-02', 1, 202020),
('George', 'Johnson', '890 h boulevard', '1993-05-03', 0, 620.888),
('Michael', 'Ramsey', '901 i avenue', '1998-01-30', 0, 90.398),
('Sarah', 'Carpenter', '1010 j avenue', '1990-02-25', 0, 666);

select * from users;

update users
set Firstname = 'Ruiqing', Lastname = 'Zhu'
where id = 10;

truncate users;

drop table users;