-- CRUD [ Create Read Update Delete ]
-- CREATE using INSERT command
-- E.g. INSERT INTO <table_name> ( attr1, atrr2 ) VALUES ( val1, val2 );

-- Let's create a new Data for CRUD operations.
-- Clean database, delete all the tables and create a new data from scratch
-- Delete tables
DROP table cats;
DROP table people;

-- Create a new cats table
CREATE TABLE cats( 
    cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    breed VARCHAR(50),
    age INT
--  PRIMARY KEY (cat_id)
 );
 
 -- Check the table is created successfully.
 DESC cats;
 -- --------------------------------------------CREATE----------------------------------------------- --
 
 -- Create some data in cats table.
 INSERT INTO cats ( name, breed, age )
	VALUES ('Ringo', 'Tabby', 4),
	       ('Cindy', 'Maine Coon', 10),
           ('Dumbledore', 'Maine Coon', 11),
           ('Egg', 'Persian', 4),
           ('Misty', 'Tabby', 13),
           ('George Michael', 'Ragdoll', 9),
           ('Jackson', 'Sphynx', 7);

-- Validate data is created successfully.
-- Let's officially start the SELECT command.
-- * is a regex like statement that we are using to tell the command that get all the data from the tables.
SELECT * FROM cats;

-- --------------------------------------------READ----------------------------------------------- --

-- Select Expression, what column do we want in return?
SELECT name FROM cats;
SELECT age FROM cats;
SELECT cat_id FROM cats;
SELECT breed FROM cats;

-- Often time we need more that one information from the table data.
-- Here in this case name, age acts as the select expression.
SELECT name, age FROM cats;

-- We can mix and match any number of fields, and the order in input does matter when we get the output.
SELECT name, age, breed FROM cats;
SELECT age, breed, name FROM cats;

-- Inroduction to WHERE clause. Lt's get more specific while fetching the dat based on conditions.
-- We use where clause all the time, it is not specific to SELECT statement. We use it in update, insert, delete all kind of statements.
-- Let's consider we want to update the age of all the cats with breed Tabby, we use where.
SELECT name FROM cats WHERE breed='Tabby';
SELECT name FROM cats WHERE age=4;
SELECT * FROM cats WHERE age=4;
SELECT * FROM cats WHERE name='Egg';

-- What happens if I search the cat  with name EGG instead of Egg?
-- We do get the same return by default the values stored in the DB are also case insensitive.
SELECT * FROM cats WHERE name='EGG';
SELECT * FROM cats WHERE name='EGg';

-- EXERCISES: Let's complete some simple exercises for SELECT.
-- 1. Select all the cats by cat_id.
SELECT cat_id FROM cats;

-- 2. Select name and breed of all the cats.
SELECT name, breed FROM cats;

-- 3. Select the cats with breed tabby but select only the name and age.
SELECT name, age FROM cats WHERE breed='tabby';

-- 4. Select the cats by cat_id and age where the cat_id and age are same.
SELECT cat_id, age FROM cats WHERE cat_id=age;

-- Introduction to Aliases
-- Aliases can be used to simplify reading the results from SQL statements.
-- By using aliases we can provide a different name for the columns being selected.
-- This functionality will come in handy when we will discuss the joins, when we join multiple table with same attribute names, this functionality will help with read the results easily

-- In the below example we are using ID as an alias for cat_id.
SELECT cat_id AS ID, name FROM cats;
SELECT name as "Cat Name", breed AS "Kitty Breed" FROM cats;

-- This will not change the attribute/field names in table. Verify with below command.
DESC cats;

-- --------------------------------------------UPDATE----------------------------------------------- --

-- Update command. This command will help us update the existing data.
-- How to  update / alter the existing data using update?
-- The useful keywords are UPDATE SET WHERE
-- UPDATE <table_name> SET <statment> WHERE <condition>
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
SELECT * FROM cats;

UPDATE cats SET age=14 WHERE name='Misty';
SELECT * FROM cats;

-- IMPORTANT NOTE: It is always a good practise to SELECT the data before UPDATE.
-- This will help us target the correct data before we update, and eliminate the chances of accidental updates.

-- EXERCISES: Let's complete some simple exercises for UPDATE.
-- 1. Update the Jackson's name to Jack.
SELECT name FROM cats WHERE name='Jackson';
UPDATE cats SET name='Jack' WHERE name='Jackson';
SELECT * FROM cats;

-- 2. Change Ringo's breed to British Shorthair.
SELECT * FROM cats WHERE name='Ringo';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
SELECT * FROM cats WHERE name='Ringo';

-- 3. Update the Maine Coons ages to 12. 
SELECT * FROM cats WHERE breed='Maine Coon';
UPDATE cats SET age=12 WHERE breed='Maine Coon';
SELECT age FROM cats WHERE breed='Maine Coon';

-- --------------------------------------------DELETE----------------------------------------------- --
-- How to delete things from table using DELETE.
-- This is very similar to SELECT command, instead of SELECT we just use DELETE to delete the specified entries from the table.

SELECT * FROM cats WHERE name='Egg'; -- Select the cat with name Egg.
DELETE FROM cats WHERE name='Egg';   -- Delete the data selected.
SELECT * FROM cats;                  -- Verify the entry for Egg has been removed.
SELECT * FROM cats WHERE name='Egg';

-- This command will remove all entries from cats table. As there is not condition clause using WHERE.
-- This command is different from DROP table. As the table will stay put only the entries will be removed from the table.
DELETE FROM cats;

-- IMPORTANT NOTE: The cat_id will not be updated and the cat_id mapped for Egg will be removed but will not be reassigned to other objects automatically.

-- EXERCISES: Let's complete some simple exercises for DELETE.
-- 1. DELETE all cats that are 4 years old.
SELECT * FROM cats WHERE age=4;
DELETE FROM cats WHERE age=4;
SELECT * FROM cats WHERE age=4;

-- 2. DELETE cats whose age is the same as their cat_id .
SELECT * FROM cats WHERE cat_id=age;
DELETE FROM cats WHERE cat_id=age;
SELECT * FROM cats WHERE cat_id=age;

-- 3. DELETE all cats.
SELECT * FROM cats;
DELETE FROM cats;
SELECT * FROM cats;
