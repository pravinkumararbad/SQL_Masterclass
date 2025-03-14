-- ---------------------------------------------------------------------------------- INNER JOIN ------------------------------------------------------------------------ --
-- There are 3 main type of joins ignoring the CROSS JOIN that we have already discussed in brief.
-- This join is used to select all data records from tables where JOIN condition is met.
-- E.g. Select all records from Table A and Table B where the join condition is met.

USE shop;
SELECT * FROM customers;
SELECT * FROM orders;

-- Select all data from customer, and orders table where the customers(id) matches with orders table's customer_id attribute.
-- Here the customers table act as Left Table, and orders table acts as Right Table.
 SELECT * FROM customers JOIN orders ON customers.id = orders.customer_id;
 
-- Here the customers table act as right Table, and orders table acts as left Table
SELECT * FROM orders JOIN customers ON customers.id = orders.customer_id;

-- Choose which all columns should be shown in the result.
-- For * ( all selection ), we receive left and right table columns based on the sequence.
SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON orders.customer_id = customers.id;

-- The INNER in the JOIN here is implicit. We can use JOIN or INNER JOIN to use inner joins.

-- Both queries below are logically identical. When the INNER keyword is omitted, it is implicit.
SELECT * FROM orders INNER JOIN customers ON customers.id = orders.customer_id;
SELECT * FROM orders JOIN customers ON customers.id = orders.customer_id;

-- ---------------------------------------------------------------------------------- INNER JOINS WITH GROUP BY ------------------------------------------------------------------------ --
-- Select first_name, last_name, and cummuative sum of shopping done till date for  each customer.
SELECT first_name, last_name, SUM(amount) AS total FROM customers JOIN orders ON orders.customer_id = customers.id GROUP BY first_name, last_name ORDER BY total DESC;