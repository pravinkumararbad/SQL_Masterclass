-- Adding or Inserting data in Tables
-- INSERT INTO <table_name>( attr1, attr2 ) VALUES ( val1, val2 );

-- Order does matter
-- INSERT INTO <table_name>( attr2, attr1 ) VALUES ( val2, val1);

CREATE DATABASE cats_app;
USE cats_app;
CREATE TABLE cats( name VARCHAR(50), age INT );
INSERT INTO cats( name, age ) VALUES ( "Blue", 3 );
INSERT INTO cats( age, name ) VALUES ( 3, "Violet" );

-- Check if the data is populated in the table correctly. How to know it worked?
-- We will look into SELECT statement more in future.
SELECT * FROM cats;

-- Multiple insert
-- INSERT INTO <table_name>( attr1, attr2 ) VALUES ( val1, val2 ), ( val3, val4 );
INSERT INTO cats (name, age) VALUES ( "Peanut", 6 ), ( "Butter", 8 ), ("Jelly", 4);
SELECT * FROM cats;

-- Let's try a challenge for insert command.
-- Create a people table, with first_name 20 chars, last_name 20 chars, age int
-- insert a first person, "Tina Belcher" 13
-- insert a first person, "Bob Belcher" 42, use different insert order.
-- Multiple insert "Linda Belcher" 45, "Philip Frond" 38, "Calvin Fischoeder" 70.

CREATE TABLE people ( first_name VARCHAR(20), last_name VARCHAR (20), age INT );
INSERT INTO people ( first_name, last_name, age ) VALUES ( "Tina", "Belcher", 17 );
INSERT INTO people ( last_name, first_name, age ) VALUES ( "Belcher", "Bob", 42 );
INSERT INTO people ( first_name, last_name, age ) VALUES ( "Linda", "Belcher", 45 ), ( "Philip", "Frond", 38 ), ( "Calvin", "Fischoeder", 70 );
SELECT * FROM people;

-- A Note On Warnings in SQL --
INSERT INTO cats ( name, age ) VALUES ( "My name is Charlie, Charlie is also name of my Owner. Charlie is a very good owner. I also know two more Chalies.", 10 );

-- The data being inserted in the cats table is exceeding the character limit for name column. Here the data insert gives an error.
SHOW ERRORS;
SHOW WARNINGS;

SELECT * FROM cats;

-- Here the errors will not show anything as the last executed command did not give us any error or warnings.
SHOW ERRORS;
SHOW WARNINGS;

-- What is NULL column NOT_NULL.
-- NULL means the value is not known. This does not mean zero.
DESC cats;
INSERT INTO cats( name ) VALUES ( "Monty" );

-- Here we get the table showing the age for Monty is NULL, and not ZERO.
SELECT * FROM cats;

INSERT INTO cats () VALUES ();
-- Here the entry inserted in for name and age both are marked NULL 
SELECT * FROM cats;

-- HOW TO AVOID THIS COLUMNS TO NOT BE NULL --
-- This can be achieved by explicitly mentioning that the COLUMN values can not be NULL
CREATE TABLE cats2( name VARCHAR ( 50 ) NOT NULL, age INT NOT NULL );
DESC cats2;

-- Here the insert statements will give an error as the NULL values are restricted as invalid.
INSERT INTO cats2() VALUES ();
INSERT INTO cats2( name ) VALUES ( "Monty" );

--  Here we have to provide values for all the attributes which is defined NOT NULL
INSERT INTO cats2( name, age ) VALUES ( "Monty", 9 );
SELECT * FROM cats2;

-- Setting default values for the attributes, specifically which are marked as NOT NULL where it is more useful. --
-- Here DESC will return default as NULL, so let's defined some defaults for the attribute.
DESC cats2;
CREATE TABLE cats3 ( name VARCHAR(100) NOT NULL DEFAULT "unnamed", age INT DEFAULT 1 );
DESC cats3;
INSERT INTO cats3 () VALUES ();
SELECT * FROM cats3;

INSERT INTO cats3 (name) VALUES ("Angela");
SELECT * FROM cats3;

INSERT INTO cats3 (age) VALUES (3);
SELECT * FROM cats3;

INSERT INTO cats3 (name, age) VALUES ("Snow", 6);
SELECT * FROM cats3;

-- Is this statement redundant? --
CREATE TABLE cats4 ( name VARCHAR(100) NOT NULL DEFAULT "unnamed", age INT NOT NULL DEFAULT 1 );
DESC cats4;

-- To answer the question on redundancy, no this is not redundant. As a user can manually set the value to NULL. --
-- Here we will get an error as we have defined the attributes as NOT NULL.
INSERT INTO cats4 ( name, age ) VALUES ( NULL, NULL );
SHOW ERRORS;

-- In this scenario, we are able to insert NULL in place of age attribute as this attribute has default value but is not marked as NOT NULL.
INSERT INTO cats3 ( name, age ) VALUES ( "Milo", NULL );
SELECT * FROM cats3;
SHOW ERRORS;

-- Little insight in KEY column --
-- Keys are marked as empty values.
DESC cats;
SELECT * FROM cats;
INSERT INTO cats ( name, age ) VALUES ( "Helena", 7 ), ( "Helena", 7 ), ( "Helena", 7 );
SELECT * FROM cats;

-- PRIMARY KEY --
-- In the data inserted above we have an issue, there are 3 cats aged 7, and named Helena, but there is not way to distinguish or to track these three cats as unique cats.
-- To make these cats unique we can add the ID.
-- This issue of identification can be solved by Primary Key, A Unique Identifier.
CREATE TABLE unique_cats( cat_id int NOT NULL, name VARCHAR(20) NOT NULL, age INT NOT NULL, PRIMARY KEY ( cat_id ) );
DESC unique_cats;
INSERT INTO unique_cats( cat_id, name, age ) VALUES ( 1, "Fred", 3 );
INSERT INTO unique_cats( cat_id, name, age ) VALUES ( 2, "Louise", 2 );

-- Error, '1062', Duplicate entry '2' for key 'unique_cats.PRIMARY' --
INSERT INTO unique_cats( cat_id, name, age ) VALUES ( 2, "Louise", 2 );
SHOW ERRORS;

-- So we can not manually keep track of the last primary key entry. So there is an attribute property just line NOT NULL, and DEFAULT.
-- This new addition to attribute property is AUTO_INCREMENT. This marks the primary key AUTO_INCREMENT.
CREATE TABLE unique_cats2( cat_id int NOT NULL AUTO_INCREMENT, name VARCHAR(20) NOT NULL, age INT NOT NULL, PRIMARY KEY ( cat_id ) );
DESC unique_cats2;
INSERT INTO unique_cats2 ( name, age ) VALUES ( "Skippy", 4 );
SELECT * FROM unique_cats2;
INSERT INTO unique_cats2 ( name, age ) VALUES ( "Jiff", 4 );
SELECT * FROM unique_cats2;
INSERT INTO unique_cats2 ( name, age ) VALUES ( "Jiff", 4 ), ( "Jiff", 4 ), ( "Jiff", 4 );

-- Here now we can uniquely identify all the Jiff based on primary key.
SELECT * FROM unique_cats2;

-- EXERCISE --
-- Define an employees table
-- 		id - number, auto increments, mandatoty, and primary key
-- 		last_name - text, mandatory
-- 		first_name - text, mandatory
--      middle_name - text, not mandatory
-- 		age - number mandatory
--  	current_status - text, mandatory, defaults to 'employed'
CREATE TABLE employees ( id INT NOT NULL AUTO_INCREMENT, first_name VARCHAR(50) NOT NULL, middle_name VARCHAR(50), last_name VARCHAR(50) NOT NULL, age INT NOT NULL, current_status VARCHAR(10) NOT NULL DEFAULT "Employed", PRIMARY KEY (id) );
DESC employees;

-- The table can also be created as
-- CREATE TABLE employees ( id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(50) NOT NULL, middle_name VARCHAR(50), last_name VARCHAR(50) NOT NULL, age INT NOT NULL, current_status VARCHAR(10) NOT NULL DEFAULT "Employed" );

INSERT INTO employees ( first_name, last_name, age ) VALUES ( "Pravinkumar", "Arbad", 31 );
SELECT * FROM employees;