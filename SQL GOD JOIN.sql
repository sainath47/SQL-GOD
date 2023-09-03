-- related data
-- one to one relationship(user & his detail=> address.., his password)
-- one to many relationships (BOOK TO REVIEWS)
-- many to many relationships (BOOKS TO AUTHORS)(books can have many authors & authors have many books)
SHOW DATABASES;
SHOW TABLES;
CREATE DATABASE SHOP;
USE SHOP;
DROP DATABASE BOOKS;
DROP TABLE customers,orders;

-- one to many(customers & orders)
-- so why not store the customer details + orders , whats wrong with that, redundancy & time of search is reduced

-- so to establish this relationship, the cutomerID will be common in customer & orders table


CREATE TABLE customers(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name  VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL
);


CREATE TABLE orders(
id INT AUTO_INCREMENT PRIMARY KEY,
order_date DATE,
amount DECIMAL(8,2),
customer_id INT ,
FOREIGN KEY(customer_id) REFERENCES customers(id)
);

-- FORIEGN KEY PROVIDES THE CONSTRAINT WHILE CREATING THE ORDER HERE THE customer_id have to be a valid customer_id from the customer table 
-- if you add for eg . the 935 as the customerId , which is not present in the customer table, then error of foreign will come up

INSERT INTO customers(first_name, last_name, email)
VALUES('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders(order_date, amount, customer_id)
VALUES('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);




DELETE FROM customers;
DELETE FROM orders;



-- now that we have created the tables with foriegn key, how to cross join them

-- orders by george
SELECT id FROM customers WHERE last_name='Georeg';
SELECT * FROM orders WHERE customer_id =1;

-- so how about when we want amount & first_name right next to one another, how to display that

SELECT * FROM orders WHERE customer_id=(SELECT id FROM customers WHERE last_name='Georeg');

-- cross join
SELECT * FROM customers,orders;
-- the above example is just some simple nonsensical join, where all orders are mapped to all users, at first the first order is mapped to every user

-- 2 types of joins we are gonna briefly cover, ignoring the simple non-sensical join
-- LEFT JOIN 
-- INNER JOIN
SELECT * FROM customers
JOIN orders
ON customers.id = orders.customer_id;

SELECT first_name,last_name, order_date, amount FROM customers
JOIN orders
ON customers.id = orders.customer_id;
-- you joined by customers above, you can also join by orders
SELECT * FROM orders
JOIN customers
ON orders.customer_id =  customers.id;

-- if you even wanna join by key which is not even by foreign key, only by the id of the order table.
SELECT * FROM orders
INNER JOIN customers
ON orders.id =  customers.id;
-- inner join & join are nothing but same


SELECT * FROM customers;
SELECT * FROM orders;

-- INNER JOIN WITH GROUP BY
-- find the total amount which each customer spent


-- i was thinking of displaying the firstname & last name togetherr with alias in a single table, unfortuatly it is not possible

SELECT first_name,last_name, SUM(amount) as total FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY first_name, last_name
ORDER BY total;
-- group by with join is super common

-- Difference between left & inner join is that, inner join is that , left join is stricly joining the data considering left columns as base., where as the inner joins according to the foriegn key provided, & inner join dont care intrechanging of left or right
-- you can see the difference by below codes of inner & left join
SELECT first_name, last_name, order_date, amount from customers
LEFT JOIN orders
ON customers.id = orders.customer_id;
-- left join here will be useful for knowing out the customers who didn't order 
SELECT * FROM customers;
SELECT * FROM orders;
-- inner join
SELECT * FROM customers
JOIN orders
ON customers.id = orders.customer_id;


SELECT first_name, last_name, IFNULL(SUM(amount),0) from customers
LEFT JOIN orders
ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

-- Right Join


-- CASCADE DELETE (this will create problem when you are deleting customer & customerId exists as reference as foreign key in other table

-- do the exercise
-- students id , first_name
create database students;
use students;

create table students(
id int auto_increment primary key,
first_name varchar(20) 
);

create table papers(
title varchar(50),
grade int,
student_id int ,
foreign key (student_id) references students(id)
);

drop table papers;

insert into students (first_name) values ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
insert into papers (student_id, title, grade) values (1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select * from students;
select * from papers;

-- papers title,grade,student_id
SELECT first_name, title,grade FROM students
inner JOIN papers
ON students.id = papers.student_id
order by grade desc;

select first_name, title,grade from students
left join papers 
on students.id = papers.student_id;


desc students;


-- if null show something

select first_name, ifnull(avg(grade),0) as average from students 
left join papers on papers.student_id = students.id
group by first_name
order by average desc;

-- now adding passing status coloumn

select 
first_name, ifnull(avg(grade),0) as average ,
case 
when ifnull(avg(grade),0) >= 75 then 'passing'
else 'failing'
end  as passing_status
from students 
left join papers on students.id = papers.student_id
group by first_name
order by average desc;



-- MANY TO MANY REALATIONSHIP
-- eg. tv shows & reviewers & reviews they write , books - authors, blog posts - tags, students -classes, each student have many classes but each class will have many students
-- tv-show have many reviews by reviewers & reviewers have many reviews (netflix)

create database manytomany;
use manytomany;

create table reviewers(
id int auto_increment primary key,
first_name varchar(30),
last_name varchar(30)
);

create table reviews(
id int auto_increment primary key,
rating decimal(2,1),
series_id int,
reviewer_id int,
foreign key (series_id) references series(id),
foreign key (reviewer_id) references reviewers(id)
);

create  table series(
id int auto_increment primary key,
title varchar(50),
released_year int,
genre varchar(30)
);

drop table reviews;

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');


INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
    INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
    select * from series;
    select * from reviews;
    select * from reviewers;
    
    
    select title, rating from series
    join reviews
    on series.id = series_id; 
    
    
    select title , round(avg(rating),2) as avg_rating from series
    join reviews
    on series.id = series_id
    group by title
    order by avg_rating asc;
    
    select first_name, last_name ,rating from reviews
    join reviewers
    on reviewer_id = reviewers.id;


    -- unreviewed_series
    select title as unreviewed_shows from series 
    left join reviews on series.id=series_id
    where rating is null;
    
    -- avg rating grouped by genere
    select genre, avg(rating) as avg_rating from series
    join reviews 
    on series.id = reviews.series_id
    group by genre;
    
    
   -- select first_name, last_name, count, min, max, avg, status (these are the coloumns needed)
   
   
   select first_name,
   last_name,
   count(rating) as COUNT,
ifnull(avg(rating),0)  as AVG,
ifnull(min(rating),0) as min,
ifnull(max(rating),0) as max,
case
when count(rating)=0 then 'INACTIVE'
else 'ACTIVE'
end  as STATUS
   from reviewers
   left join reviews
   on reviewers.id = reviews.reviewer_id
   group by reviewer_id;
   
   -- reviewer name should be displayed 
   
   select title, rating, concat(first_name, last_name) as reviewer from reviews 
inner join reviewers
   on reviews.reviewer_id = reviewers.id
   inner join series
   on series.id = reviews.series_id
   order by title
   ;
   
    
    
    