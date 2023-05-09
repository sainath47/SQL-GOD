-- NOW TIME TO LEVEL UP THE BASIC CRUD OPERATIONS

-- STRING FUNCTIONS are bunch of functions which we can perfrom on text

create database books;
use books;
drop database some;
show databases;


desc books;
select * from books;


-- CONCAT
select concat (author_fname,' ' ,author_lname) as author_name from books;


-- CONCAT_WS
SELECT CONCAT_WS("-", title, author_fname,author_lname) from books;


-- SUBSTRING
select substring('hello world', 1,4);
-- if you will observe, the first index is from where do you wanna start, & 
-- 2nd argument is for , how many letters you wanna display from starting point
-- if last 2 characters are needed then use the -ve values

select substring(author_lname, 1,1) as initial, author_lname from books;

-- concat the title substring of 10 char with ..., eg. The Namesa...

select concat(substring(title,1,10), '...') as shortTitle from books;
select concat(substring(author_fname,1,1),'.',substring(author_lname,1,1),'.') as authorInitials from books;







