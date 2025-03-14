-- ---------------------------------------------------------------------------------- RIGHT JOIN ------------------------------------------------------------------------ --
-- This join is no where near how commonly the INNER JOIN is used.
-- This join is used select everything from right table along with any matching records in left table.

-- We have see the query above many times now. This iNNER JOIN query will get all the matching results from two tables.
SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON customers.id = orders.customer_id;

-- Lets try RIGHT JOIN
SELECT first_name, last_name, order_date, amount FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id;

-- If you have run both the queries, you might have noticed there is no differce in the result by running wither of these quries.
-- As by the schema we designed there is no order which do not have a customer associated with it, so we are getting the same result for both teh queries.

-- So of there is an order which does not have customer_id that would be the case where we would get a different result.
SELECT * FROM orders;

-- If you remember in Working_With_FOREIGN_KEY session we altered the table to have a constraint in customer_id FOREIGN key in orders to REFERENCE the customers customer_id.
-- ALTER TABLE orders ADD CONSTRAINT customer_id_foreign_key FOREIGN KEY (customer_id) REFERENCES customers(id);

-- Let's try adding new data in the orders table with incorrect customer_id
-- This command should give an error.
--  Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`shop`.`orders`, CONSTRAINT `customer_id_foreign_key` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`))
INSERT INTO orders  ( order_date, amount, customer_id ) VALUES ( CAST( '2016-02-10' AS DATE ), 319.99, 99 );

-- Let's try adding data without customer_id value.
INSERT INTO orders  (order_date, amount) VALUES ( CAST( '2016-02-10' AS DATE ), 319.99 );
INSERT INTO orders  ( order_date, amount, customer_id ) VALUES ( CAST( '2016-02-10' AS DATE ), 319.99, NULL );

-- Adding FOREIGN KEY with NULL is successful why?
-- Foreign Key Behavior with NULL Values
-- A FOREIGN KEY constraint only enforces referential integrity on non-null values.
-- A NULL value in customer_id is not checked against the customers(id) table because NULL is treated as "unknown" in SQL.
-- Since there’s no restriction preventing NULL values in foreign keys, the row gets inserted successfully.

-- If the usecase is to avoid FOREIGN KEY to be NOT NULL, we can achieve this by bewlo query.
-- ALTER TABLE orders MODIFY customer_id INT NOT NULL;

SELECT * FROM orders;

-- Now if we check the result from both the queries above, there would be a new entry added in result set for order id 10.
-- Earlier if we get the data for entire right table, or by matching the data using inner join there was no difference between then.
-- Try the queries.

SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON customers.id = orders.customer_id; -- We get 6 row(s) returned.

-- Lets try RIGHT JOIN
SELECT first_name, last_name, order_date, amount FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id; -- We get 7 row(s) returned.