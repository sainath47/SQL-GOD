CREATE DATABASE GOD_HERE; 
USE GOD_HERE;
CREATE TABLE persons(
first_name varchar(20),
last_name varchar(20),
age INT
);

INSERT INTO persons(first_name, last_name, age)
VALUES ("god reddy","fullstop" ,85);

INSERT INTO persons(first_name, last_name, age)
VALUES ("god god", "reddy reddy", 92);

INSERT INTO persons(first_name, last_name, age)
VALUES ("god god", "reddy reddy", 92);


INSERT INTO persons(first_name, last_name, age)
VALUES ("chikni", "chameli", 3),
("jalebi", "bai",4),
("afgan", "jalebi",5),
("munni", "badnaam", 5);


select * from persons;

drop table persons;


select database();
show databases;
show tables;

drop database god_here;


-- drop database mysql;
-- drop database performance_schema;
-- drop database information_schema;


