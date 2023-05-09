create database shirts_db;
SELECT database();
use shirts_db;

-- creating table is same as creating a schema,model
CREATE TABLE shirts(
shirt_id INT AUTO_INCREMENT PRIMARY KEY,
article varchar(100) NOT NULL,
color varchar(100) NOT NULL,
shirt_size varchar(100) NOT NULL,
last_worn INT DEFAULT 0
);

DESC shirts;

INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

SELECT * FROM shirts;


INSERT INTO shirts(article, color,shirt_size,last_worn)
VALUES ('polo shirt','Purple' ,'M', 50);

SELECT article, color FROM shirts;
SELECT article, color,shirt_size,last_worn FROM shirts WHERE shirt_size='M';

SELECT * FROM shirts WHERE article="polo shirt";
UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';

SELECT * FROM shirts WHERE last_worn=15;
UPDATE shirts SET last_worn=0 where last_worn=15;

SELECT * FROM shirts WHERE color='off white';
UPDATE shirts SET shirt_size='XS' ,color='off white' WHERE color='white';

SELECT * FROM shirts WHERE last_worn=200;
DELETE FROM shirts WHERE last_worn=200;

SELECT * FROM shirts WHERE article='tank top';
DELETE FROM shirts WHERE article='tank top';

SELECT * FROM shirts;
DELETE FROM shirts;

DROP TABLE shirts;











