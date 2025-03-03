-- CREATE A DATABASE
CREATE DATABASE hello_world_db;

-- SHOW DATABASES
SHOW DATABASES;

-- DELETE DATABASES
DROP DATABASE hello_world_db;

-- USING DATABASES USE <database_name>
CREATE DATABASE dog_walking_app;

-- Show all available databases.
SHOW DATABASES;

-- Use the database of our choice for performing SQL operations.
USE dog_walking_app;

-- SELECT DATABASE() command will show the current working database
SELECT DATABASE();
DROP DATABASE dog_walking_app;

-- As we dropped the current using database we will get NULL result.
SELECT DATABASE();

-- Use new pre-existing database and check the selected database.
USE mysql;
SELECT DATABASE();

-- TABLES --
-- Database is just a bunch of tables. This is a case atleast for relational database.
-- Example CAT Table!
-- This can have information like, Name, Breed, and Age.
-- Columns are headers or attributes.
-- Rows are actual data.
-- Database is made up of multiple tables.

-- Data Types --
-- Number Types --       -- String Types --       -- Date Types --
-- INT                   -- Char                  -- DATE
-- SMALLINT              -- VARCHAR               -- DATETIME
-- TINYINT               -- BINARY                -- TIMESTAMP
-- MEDIUMINT             -- VAR BINARY            -- TIME
-- BIGINT                -- BLOB                  -- YEAR
-- DECIMAL               -- TINYBLOB
-- NUMERIC               -- MEDIUMBLOB
-- FLOAT                 -- LONGBLOB
-- DOUBLE                -- TEXT
-- BIT                   -- TINYTEXT
                         -- MEDIUMTEXT
                         -- LONGTEXT 
                         -- ENUM

-- So for now we wont mess up with all these data types. We will stick with INT, and VARCHAR.
-- INT, A whole number, with maximum value of 4294967295.
-- VARCHAR, A Variable Length String, it varies between 1-255 characters. E.g. varchar(100)

-- Example for the data types session --
-- Draw a Tweets Table, at a minimum the columns must include:
--     1. A username (max 15 chars)
--     2. The tweet content (max 140 chars)
--     3. Number of favorites

-- SOLUTION --
-- username varchar(15)
-- content varchar(140)
-- favorites int

-- Creating our first table

-- CREATE TABLE <table_name>
--     (
--         column_name data_type,
--         column_name data_type
--     );

CREATE DATABASE cat_app;
USE cat_app;
SELECT DATABASE();
CREATE TABLE cats
(
	name VARCHAR(100),
    age  INT
);

-- See if the table is created successfully in the database.
SHOW TABLES;

-- How to know if the columns are created in the table created.
-- SHOW COLUMNS FROM <table_name>
SHOW COLUMNS FROM cats;

-- DESC command
-- DESC <table_name>;
DESC cats;

-- Deleting tables
-- DROP TABLE <table_name>
DROP TABLE cats;
DESC cats;
SHOW TABLES;

-- Use our learning from the section with solving following example.
-- Create a pastries table, it should have atleast 2 columns: name and quantity. Name should be atleast 50 characters long.
-- Inspect the tbale/columns.
-- Delete the table created.

CREATE DATABASE pastry_shop_app;
USE pastry_shop_app;
SELECT DATABASE();
CREATE TABLE pastries
(
	name VARCHAR(50),
    quantity INT
);
SHOW TABLES;
SHOW COLUMNS FROM pastries;
DESC pastries;
DROP TABLE pastries;
DROP DATABASE pastry_shop_app;
