-- create a table which cant take a input as null

Create database exer3;
use exer3;
CREATE TABLE GODs(
FirstName varchar(20) NOT NULL,
age INT NOT NULL
);
CREATE TABLE GOD(
name varchar(20) NOT NULL,
age INT NOT NULL
);

drop table god;

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

INSERT INTO god(name)
VALUES ("chamcha");

INSERT INTO god(age)
VALUES (15);

SELECT * FROM GOD;

show databases;
show tables;
desc persons;
desc god;
desc gods;
select database()


