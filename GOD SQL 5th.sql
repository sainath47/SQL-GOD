-- DEFAULT VALUE
-- create a table & give the default values to the keys
use some;

drop table s;
create table s(
kukud varchar(4999)  default "god", 
count int 
);

insert into s(kukud)
values (default);

CREATE TABLE unique_cats3(
cat_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
age INT
);

INSERT INTO unique_cats3(name,age)
VALUES ("godCAT",1),("godCat2",2);

select * from s; 
select * from unique_cats3; 
desc unique_cats3;
desc s;


-- exercise
CREATE TABLE Employees(
id INT AUTO_INCREMENT PRIMARY KEY,
last_name VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
middle_name VARCHAR(100) ,
age INT NOT NULL,
current_status VARCHAR(100) NOT NULL DEFAULT "employed"
);

desc employees;
 





show databases;
select database();