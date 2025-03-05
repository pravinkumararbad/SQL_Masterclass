-- Let's try some CRUD challenges to have good hands-on.

-- ----------------------------------------------- Annual Closet Inventory ----------------------------------------------- --
-- Create a new DB
CREATE DATABASE shirts_db;

-- Create a new table with fields, shirt_id (int) Priamry Key Not Null, article (string), color (string), shirt_size (char), last_worn (int).
-- Try to avoid using size, as this is a reverved keyword and used internally in database. That is the reason we names the field shirt_size.
USE shirts_db;
CREATE TABLE shirts 
      ( 
          shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          article VARCHAR(10),
          color VARCHAR(10),
          shirt_size VARCHAR(5),
          last_worn INT
      );

SHOW DATABASES;
SELECT DATABASE();
SHOW TABLES;

-- Insert data in the shirts table in shirt_db
INSERT INTO shirts ( article, color, shirt_size, last_worn )
VALUES ( 't-shirt', 'white', 'S', 10 ),
       ( 't-shirt', 'green', 'S', 200 ),
       ( 'polo shirt', 'black', 'M', 10 ),
       ( 'tank top', 'blue', 'S', 50 ),
       ( 't-shirt', 'pink', 'S', 0 ),
       ( 'polo shirt', 'red', 'M', 5 ),
       ( 'tank top', 'while', 'S', 200 ),
       ( 'tank top', 'blue', 'M', 15 );

-- Validate the data is created successfully and  correctly.
SELECT * FROM shirts;

-- INSERT a single entry in the shirts table, Purple Polo Short, size M last worn 50 days ago.
INSERT INTO shirts ( color, article, shirt_size, last_worn ) VALUES ( 'purple', 'polo shirt', 'M', 50 );
SELECT * FROM shirts;

-- SELECT all shirts but only print article and color
SELECT article, color FROM shirts;

-- SELECT all medium shirts, print out everything but the shirt_id
SELECT color, article, shirt_size, last_worn FROM shirts;

-- Update all polo shirts, and change the size to L.
SELECT * FROM shirts WHERE article='polo shirt';
UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
SELECT * FROM shirts WHERE article='polo shirt';

-- Update the shirt last worn 15 days ago, and change value of last_worn to 0.
SELECT * FROM shirts WHERE last_worn=15;
UPDATE shirts SET last_worn=0 WHERE last_worn=15;
SELECT * FROM shirts WHERE last_worn=0;

-- Update all white shirts, change the size to xs and color to 'off white'
SELECT * FROM shirts WHERE color='white';
UPDATE shirts SET shirt_size='XS', color='off white' WHERE color='white';
SELECT * FROM shirts WHERE color='off white';

-- Delete all old shirts, last worn 200 days ago
SELECT * FROM shirts WHERE last_worn=200;
DELETE FROM shirts WHERE last_worn=200;
SELECT * FROM shirts WHERE last_worn=200; -- We should get 0 entries in return.

-- DELETE all tank tops
SELECT * FROM shirts WHERE article='Tank Top';
DELETE FROM shirts WHERE article='Tank Top';
SELECT * FROM shirts WHERE article='Tank Top'; -- We should get 0 entries in return.

-- DELETE all shirts
DELETE FROM shirts;
SELECT * FROM shirts; -- All the entries from the shirts table is deleted. We should receive 0 entries in result.

-- DROP the shirts table.
DROP table shirts;

-- Describe shirts table
DESC shirts; -- Error Code: 1146. Table 'shirts_db.shirts' doesn't exist [We deleted the shirts table.]