-- --------------------------------------------------------------------------------------------------EXERCISES------------------------------------------------------------------------------------------------------- --

-- ----------------------------------------------- EXCERCISE FOR SELECT CLAUSE -------------------------------------------- --
-- Return all products selecting the columns name, unit price, new price ( unit_price*1.1 )
SELECT name, unit_price, unit_price*1.1 AS new_price FROM sql_store.products;

-- ----------------------------------------------- EXCERCISE FOR WHERE CLAUSE -------------------------------------------- --
-- Get the orders placed this year
SELECT * FROM sql_store.orders; 
SELECT * FROM sql_store.orders WHERE order_date >= '2019-01-01';

-- ----------------------------------------------- EXCERCISE FOR AND OR NOT OPERATOR -------------------------------------------- --
-- From the order_items table, get the items for order#6 where the total price is greated than 30
SELECT * FROM sql_store.order_items WHERE order_id=6 AND quantity*unit_price > 30;

-- ----------------------------------------------- EXCERCISE IN OPERATOR -------------------------------------------- --
-- Return product with quantity in stock equal to 49, 38, 72
SELECT * FROM products WHERE quantity_in_stock IN ( 49, 38, 71 );

-- ----------------------------------------------- EXCERCISE BETWEEN OPERATOR -------------------------------------------- --
-- Return customers born between 1.1.1990 and 1.1.2000
SELECT * FROM customers WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- ----------------------------------------------- EXCERCISE LIKE OPERATOR -------------------------------------------- --
-- Get the customers whose address contains TRAIL or AVENUE
SELECT * FROM customers WHERE address LIKE '%trail%' OR address LIKE '%avenue%';

-- Get the customers whose number end with 9
SELECT * FROM customers WHERE phone LIKE '%9';

-- Get the customers whose number dont end with 9
SELECT * FROM customers WHERE phone NOT LIKE '%9';

-- ----------------------------------------------- EXCERCISE REGEXP OPERATOR -------------------------------------------- --
-- Get the customers whose
--    first name are ELKA or AMBUR
SELECT * FROM customers WHERE first_name REGEXP 'ELKA' OR first_name REGEXP 'AMBUR';
SELECT * FROM customers WHERE first_name REGEXP 'ELKA|AMBUR';

--    last name ends with EY or ON
SELECT * FROM customers WHERE last_name REGEXP 'EY$' OR last_name REGEXP 'ON$';
SELECT * FROM customers WHERE last_name REGEXP 'EY$|ON$';

--    last name starts with MY or contains SE
SELECT * FROM customers WHERE last_name REGEXP '^MY' OR last_name REGEXP 'SE';
SELECT * FROM customers WHERE last_name REGEXP '^MY|SE';

--    last name contains B followed by R or U
SELECT * FROM customers WHERE last_name REGEXP 'b[ru]';
SELECT * FROM customers WHERE last_name REGEXP 'br|bu';

-- ----------------------------------------------- EXCERCISE IS NULL OPERATOR -------------------------------------------- --
-- Get the orders that are not shipped
SELECT * FROM sql_store.orders WHERE shipper_id IS NULL;

-- ----------------------------------------------- EXCERCISE ORDER BY OPERATOR -------------------------------------------- --
-- Select all the items with order_id 2 and sort them by total price in descending order
SELECT order_id, product_id, quantity, unit_price FROM sql_store.order_items WHERE order_id = 2 ORDER BY quantity*unit_price DESC;
SELECT order_id, product_id, quantity, unit_price, quantity*unit_price AS total_price FROM sql_store.order_items WHERE order_id = 2 ORDER BY 5 DESC;
SELECT order_id, product_id, quantity, unit_price, quantity*unit_price AS total_price FROM sql_store.order_items WHERE order_id = 2 ORDER BY total_price DESC;

-- ----------------------------------------------- EXCERCISE LIMIT OPERATOR -------------------------------------------- --
-- Get the top three loyal customers.
SELECT *  FROM sql_store.customers ORDER BY POINTS DESC LIMIT 0, 3;
SELECT *  FROM sql_store.customers ORDER BY POINTS DESC LIMIT 3;