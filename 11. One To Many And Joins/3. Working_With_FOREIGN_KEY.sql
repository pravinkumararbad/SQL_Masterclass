-- ------------------------------------------------- Let's Define 1:Many Relationship Tables -------------------------------------------------------------- --
CREATE DATABASE shop;
USE shop;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- NOT NULL, AUTO_INCREMENT, and UNIQUE all seems to be excessive and not needed here.
    first_name VARCHAR( 50 ) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT no_duplicate_user UNIQUE ( first_name, last_name, email ) 
);

DESC customers;

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    order_date DATE NOT NULL, -- DEFAULT NOW(), the default date setting is available only for TIMESTAMP and DATETIME data types.
    amount DECIMAL ( 8,2 ) NOT NULL,
    customer_id INT
);

-- Verify both the tables are successfully created.
SHOW TABLES;

-- Let's populate some data in the tables.

INSERT INTO customers (first_name, last_name, email)
VALUES ( 'Boy', 'George', 'george@gmail.com'),
       ( 'George', 'Michael', 'gm@gmail.com'),
       ( 'David', 'Bowie', 'david@gmail.com'),
       ( 'Blue', 'Steele', 'blue@gmail.com'),
       ( 'Dette', 'Davis', 'bette@gmail.com');
       
INSERT INTO orders ( order_date, amount, customer_id )
VALUES ( '2016-02-10', 99.99, 1 ),
	   ( '2017-11-11', 35.50, 1 ),
       ( '2014-12-12', 800.67, 2 ),
       ( '2015-01-03', 12.50, 2 ),
       ( '1999-04-11', 450.25, 5 );
       
-- We can successfully verify that the data has been successfully added in tha DB tables.
SELECT * FROM customers;
SELECT * FROM orders;

-- This way we can manage the data in multiple tables and reduce the data redundancy, but there is a major flaw in this.
-- If a user tries to add the data in the orders table using some customer_id which is not yet added in the customers table.
INSERT INTO orders ( order_date, amount, customer_id ) VALUES ( '2018-01-23', 89.99, 245 );

-- Here we have incorrect data as we are adding order details with customer_id which is not availble in customers table.
SELECT * FROM orders;

-- With the current design we will be able to add this kind of data ans the SQL will not stop us from doing that, and we lead to have incorrect data in the system.
-- How to avoid this scenario. That is when we indroduce the FOREIGN KEY.
-- Lets alter the table using ALTER TABLE command. We can use ADD CONSTRAINT and not MODIFY to update FOREIGN AND PRIMARY KEY

-- Here we will face an issue, because we have added a orders entry for the value which is not available in the customers table.
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`shop`.`#sql-1734_d`, CONSTRAINT `customer_id_foreign_key` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`))
ALTER TABLE orders ADD CONSTRAINT customer_id_foreign_key FOREIGN KEY (customer_id) REFERENCES customers(id);

-- Delete the entry for which the ALTER TABLE for ADD CONSTRAINT has failed.
DELETE FROM orders WHERE customer_id=245;

-- Now ALTER TABLE
ALTER TABLE orders ADD CONSTRAINT customer_id_foreign_key FOREIGN KEY (customer_id) REFERENCES customers(id);

-- We can and should add the FOREIGN KEY at the time of creating the table as given below
-- CREATE TABLE orders (
--     id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
--     order_date DATE NOT NULL, -- DEFAULT NOW(), the default date setting is available only for TIMESTAMP and DATETIME data types.
--     amount DECIMAL ( 8,2 ) NOT NULL,
--     customer_id INT,
--     FOREIGN KEY (customer_id) REFERENCES customer(id)
-- );

-- Try adding the incorrect data now and see if we get an error.
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`shop`.`orders`, CONSTRAINT `customer_id_foreign_key` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`))
INSERT INTO orders ( order_date, amount, customer_id ) VALUES ( '2018-01-23', 89.99, 245 );

-- Try a successful command as well.
INSERT INTO orders ( order_date, amount, customer_id ) VALUES ( '2018-01-23', 89.99, 4 );

SELECT * FROM orders;
SELECT * FROM customers;