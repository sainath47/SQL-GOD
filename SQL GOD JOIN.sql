-- related data
-- one to one relationship(user & his detail=> address.., his password)
-- one to many relationships (BOOK TO REVIEWS)
-- many to many relationships (BOOKS TO AUTHORS)(books can have many authors & authors have many books)


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


SELECT * FROM customers;
SELECT * FROM orders;

DELETE FROM customers;
DELETE FROM orders;

SHOW DATABASES;
CREATE DATABASE SHOP;
USE SHOP;
DROP DATABASE BOOKS;
DROP TABLE customers,orders;

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

SELECT * FROM customers
JOIN orders
ON customers.id = orders.id;










