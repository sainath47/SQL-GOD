
SHOW databases;
use GOD_STARTED;
SELECT database();

CREATE DATABASE GOD_STARTED;

CREATE TABLE cats (
name varchar(50),
age int
);


CREATE TABLE dogs (
name varchar(50),
breed varchar(50),
age INT 
);

SHOW TABLES;
SHOW COLUMNS FROM cats;
SHOW COLUMNS FROM dogs;

DESCRIBE cats;
desc cats;


-- create table pastries, name & quantity, inspect your table ,
-- delete your table

create table pastries(
name varchar(50),
quantity INT 
);

desc pastries;
show tables;
show columns from pastries;


drop table pastries;


INSERT INTO cats (name, age)
VALUES('Blue Steele' , 5);

-- HOW DO YOU KNOW THAT INSERT WORKED & HOW TO SHOW
SELECT * FROM cats;

INSERT INTO cats (age, name)
VALUES(12, "god cat");

INSERT INTO cats(name, age)
VALUES("GodCat1" , 1),
("GodCat2", 2),
("GodCat3",3);

SELECT * FROM cats;



