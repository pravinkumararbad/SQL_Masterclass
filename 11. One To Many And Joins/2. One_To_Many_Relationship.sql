-- ------------------------------------------------------------------------------ 1 : Many Relationship -------------------------------------------------------------------- --
-- This is most commonly used relationship in SQL.
-- We will be dealing with customers, and orders table, to understand the relationship.
-- So on our example. every customer can make n number of orders, but each order belogs to only one customer.
-- In simple words, Joe, Archie, and Camren can make 15 orders each, but each order will only be traced back to one customer.

-- E.g. We want to store the data
--  A customer's first and last name
--  A customer's email
--  The date of purchase
-- The price of the order

-- We can store the data going straight ahead and adding all the attributes in a single table.

-- first_name | last_name | email | order_date | amount
--     AJ           PK               '22-1-1'     22.76
--     AJ           PK               '22-3-1'     29.99
--     KL           NK               '24-1-1'     22.76
--     AJ           PK               '21-1-1'     22.76
--    ANDY          Jr                 NULL        NULL
--    Blue          Joe                NULL        NULL

-- Let me be clear this is a very crude and wrong way to manage data as this will be clumsy and a lot of data duplication will come in picture.
-- Here as we are storing user and order data in same table, there could be scenario where Andy and Blue did not order anything but as they are being customer registered with store.
-- We see the first_name and last_name with order_date and amount being NULL.
-- If we mark the order_data and amaount to NOT NULL, user wont be able to sign up without making his first purchase in the store. There are many issues we have with this schema.

-- How to handle this scenario with good database design. Here is an idea lets make two tables to hold the data seperatly for Orders and Customers.

-- Customers_tbl            Orders_tbl
-- cust_id                  order_id
-- first_name               order_date
-- last_name                amount
-- email                    cust_id

-- Here customers and orders id has same field in the both the tables name cust_id. The cust_id field is referenced in the orders_tbl from customers_tbl.

-- Example Data
-- CUSTOMERS TABLE
-- customer_id     first_name     last_name        email
--      1          Boy            George           george@gmail.com
--      2          George         Michael          gm@gmail.com
--      3          David          Bowie            david@gmail.com
--      4          Blue           Steele           blue@gmail.com

-- ORDERS TABLE
-- order_id      order_date      amount     customer_id
--    1         '2016/02/10'      99.99         1
--    2         '2017/11/11'      35.50         1
--    3         '2014/12/12'     800.67         2
--    4         '2015/01/03'      12.50         2

-- Let us revisit some concepts discussed before and introduce some new.
-- PRIMARY KEY: Some perticular column in our table is always unique. This will help when we try to fetch teh data by referencing the column in different table.
--              There will be no data descripancy and duplication as well.
--              This is where AUTO_INCREMENT comes in picture, using this keyword we make sure the id is never duplicated.
--              Primary Key gives us primary way to refer the each entry in the given table. This is not the only thing that makes the entry unique, but it will be guaranteed to be unique.

-- FOREIGN KEY: Foreign keys are references to another table within a given table.
--              In above example customer_id is a foreign key because it is refering to a customer_id column from customers table in orders table.