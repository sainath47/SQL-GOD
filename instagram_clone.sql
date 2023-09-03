-- likes on the photo
-- followers & following
-- users ,  photos , comments , hastags

-- user=> _id , username
-- photo(post can have multiple photos) => _id , likes=>array of userIds , imageURL, userID
-- likes have a total different schema=> user_id, photo_id, created_at
-- comments => _id , parentCommentId , userId, photoID


CREATE DATABASE ig_clone;
USE ig_clone;
SHOW DATABASES;
SHOW TABLES;
DESCRIBE comments;


CREATE TABLE users (
id INTEGER AUTO_INCREMENT PRIMARY KEY, 
username VARCHAR(255) UNIQUE,
created_at TIMESTAMP DEFAULT NOW()
);

DESCRIBE users;

INSERT INTO users (username) VALUES
('sainath'),
('balaji'),
('maa');

SELECT * FROM users;


CREATE TABLE photos(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
image_url VARCHAR(255) NOT NULL,
user_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO photos (image_url, user_id) VALUES 
('/jklasdkls',1),
('/jklas3kls',3),
('/jklas3kls',2),
('/jklasd4ls',3),
('/bjsdfljs',2),
('/aklsjdfkl',1);

SELECT image_url , username FROM photos JOIN users ON photos.user_id = users.id;

CREATE TABLE comments(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
comment_text VARCHAR(255) NOT NULL,
user_id INTEGER NOT NULL,
 photo_id INTEGER NOT NULL,
 created_at TIMESTAMP DEFAULT NOW(),
 FOREIGN KEY(user_id) REFERENCES users(id),
 FOREIGN KEY(photo_id) REFERENCES photos(id) 
 );

DESCRIBE comments; 

INSERT INTO comments(comment_text, user_id, photo_id) VALUES
('BE CALM!, cause you are what?', 1, 2),
('GOD!', 2, 2),
('GOD!', 3, 2),
('GOD!', 2, 2),
('Nice Shot', 2, 1),
('Yoooooo, Lets Go', 3, 1),
('Goooooo, where though?', 1, 1);


CREATE TABLE likes(
user_id INTEGER NOT NULL,
photo_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES users(id),
FOREIGN KEY(photo_id) REFERENCES photo(id),
PRIMARY KEY(user_id, photo_id)
);
-- how to make just add 1 like by one person only
-- userid & photoid inserted should be unique 


INSERT INTO likes(user_id, photo_id) VALUES 
(1,1),
(2,1),
(1,2),
(1,3),
(3,3);
INSERT INTO likes(user_id, photo_id) VALUES 
(1,1);


CREATE TABLE follows(

follower_id INTEGER NOT NULL,
followee_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (follower_id) REFERENCES users(id),
FOREIGN KEY (followee_id) REFERENCES users(id),
PRIMARY KEY(follower_id, followee_id) 
);


INSERT INTO follows(follower_id, followee_id) VALUES
(1,2),
(2,3),
(1,3),
(2,1);
-- we still dont want the same able to be follow the same person
-- here order does matter who follows who


-- hash tags
-- a different schema for it, problems 



