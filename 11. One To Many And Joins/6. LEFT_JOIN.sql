-- ---------------------------------------------------------------------------------- LEFT JOIN ------------------------------------------------------------------------ --
-- This join is no where near how commonly the INNER JOIN is used.
-- This join is used select everything from left table along with any matching records in right table.

USE shop;

-- Let's try an example
-- Select first_name, last_name, order_date, and amount using left join.
-- With this query we will get all the data from left table and everyhing that is matched by the JOIN condition.
-- If there is not condition being matched we will receive values for left table attributes and right table attributes are marked as NULL.
SELECT first_name, last_name, order_date, amount FROM customers LEFT JOIN orders ON orders.customer_id = customers.id;

-- The data result changes completely based on modifications to the left and right tables, as many customers have not made a single purchase.
-- In this case, when the customers table is the left table, all entries, including those for customers who have not placed any orders, will be included in the result.
-- When we set the orders table as the left table, all orders will be displayed in the result. Since the join is based on id, no entry for a customer with zero orders will be included in the result.
SELECT first_name, last_name, order_date, amount FROM orders LEFT JOIN customers ON orders.customer_id = customers.id;

-- ---------------------------------------------------------------------------------- INNER JOINS WITH GROUP BY ------------------------------------------------------------------------ --
-- Let's see the example of left join in conjunction with GROUP BY
-- We will also be introducing a in build function IFNULL

SELECT first_name, last_name, SUM(amount) AS money_spent FROM customers LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY first_name, last_name;

-- We have got the result set for the left join made based on the id and customer_id. There are some entries which hold value NULL.
-- If we do not want the NULL value printed and want the NULL value is to be substituted by the deafault value provided, we can make use of the IFNULL function.

-- How to use IFNULL? IFNULL ( value_to_be_checked_for_NULL, default_value )
SELECT IFNULL( NULL, 0 );

-- Lets updated the left join query with group by to eliminate the SUM of money_spent with 0 is sum turns out to be NULL.
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS money_spent FROM customers LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY first_name, last_name;