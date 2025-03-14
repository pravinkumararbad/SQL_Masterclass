-- ---------------------------------------------------------------------------------- JOINS ------------------------------------------------------------------------ --
USE shop;
SELECT DATABASE();
SHOW TABLES;

-- Select all orders placed by Boy George.
-- Let's try the approach that we know as of now.
SELECT id FROM customers WHERE last_name='George'; -- 1
SELECT * FROM orders WHERE customer_id=1;

-- In the above example we used all the understanding we have on SQL and databases, and by using 2 queries we were able to get the order details by Boy George.
-- Let's go one step ahead and get the data using single query. As this approach is very clunky and there can be more that 1 customers with same name.
-- What if we want to know the customer name and the order amount in a single table. This is not possible with this approach. What can we do now?
-- I think we are going to the same route, yes we did talk briefly about the subqueries we can also use that.
SELECT * FROM orders WHERE customer_id = ( SELECT id FROM customers WHERE last_name='George' );

-- By using sub query approach we are able to get the data by executing a single query. But the core issue of getting the first name or any customers data in the result is still not possible.
-- This is where JOIN clause comes into picture, where user want to get the data based on joining multiple tables.

-- ---------------------------------------------------------------------------------- CROSS JOIN ------------------------------------------------------------------------ --
-- With this join we get all possible combination of the data from given table.
-- This is a vert dumb join and is not at all useful for most of the scenarios.
-- With this kind of join we get all the entries matched with all entries from all the given tables. Basically cross multiplying the entries.
SELECT * FROM customers, orders; -- We receive 30 entries in return.