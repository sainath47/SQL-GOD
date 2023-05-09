-- CRUD
-- create MEANS INSERT INTO <tableName>(name, age) VALUES ("god", 12)
-- READING(SELECT KEYWORD) 
select database();
show databases;
use some;
show tables;

CREATE TABLE cats(
cat_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
breed VARCHAR(100),
age INT

);
  
  INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
       
       -- officially introducing SELECT keyword
       SELECT * FROM cats;
       SELECT name,age FROM cats;
       -- what is the meaning of the above , select all the "COLUMNS" of the cats table
       
       -- WHERE KEYWORD, we are getting all rows, all time, we applying filter for which rows to return
       SELECT name,breed FROM cats WHERE age=4;
       
       
       -- rapid exercise
       SELECT cat_id FROM cats;
       SELECT name,breed FROM cats;
       SELECT name,age FROM cats WHERE breed='tabby';
       SELECT cat_id,age FROM cats WHERE cat_id=age;
       
       -- ALIASES
       SELECT cat_id AS id,name FROM cats;
       
       
       
       
       
       
       
       
       
       SELECT * FROM cats;
       -- UPDATING 
       -- so before updating do check the where condition are they in muliple in number , or you may end up editing multiple things in table , which you never wanted to update
       -- UPDATE cats SET col=val, another_col = val WHERE name = 'chicken';
       -- update jacksos's name to jack
       -- update ringo's breed to "british shorthair"
       -- update both maine coon's ages to be 12
       
       
       
       UPDATE cats SET name='Jack' WHERE name='Jackson';
       UPDATE cats SET breed='Brtish ShortHair' WHERE name='Ringo';
       UPDATE cats SET age=12 WHERE breed='Maine coon';
       




          SELECT * FROM cats;
       -- DELETING
       DELETE FROM cats WHERE name='Egg';
       -- delete all 4 year old cats 
       -- delete cats whoose id is same as age of cats
       -- delete all 
       
       SELECT * FROM cats WHERE age=4;
       DELETE FROM cats WHERE age=4;
       
       SELECT * FROM cats WHERE cat_id=age;
       DELETE FROM cats WHERE cat_id=age;
       
       DELETE FROM cats;
       
       
       
       
       
       
       
  
  