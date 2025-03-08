-- Pre-requisite for this section is to run the create-databases.sql, to create the pre-requisite data.

USE sql_store;
SELECT * FROM customers;

-- ----------------------------------------------- AND, OR, and NOT conditions with WHERE CLAUSE -------------------------------------------- --
SELECT *
FROM customers
-- WHERE customer_id = 1
ORDER BY first_name;

-- How to combine the conditions using WHERE clause, using AND or OR operator
SELECT * FROM customers WHERE birth_date > '1990-01-01' AND points > 1000;
SELECT * FROM customers WHERE birth_date > '1990-01-01' OR points > 1000;
SELECT * FROM customers WHERE birth_date > '1990-01-01' OR points > 1000 AND state = 'VA';

-- Order of the AND and OR condition has the precedence, AND operator is evaluated always before the OR operator.
-- SELECT * FROM customers WHERE birth_date > '1990-01-01' OR points > 1000 AND state = 'VA'; For this example
-- Even if the birth_date condition is provided before points > 1000 AND state = 'VA', the condition with and operator points > 1000 AND state = 'VA' is evaluted first.
-- We can use parathesis (  ) to add the condition to change the precedence.

SELECT * FROM customers WHERE NOT( birth_date > '1990-01-01' OR points > 1000 );

-- ----------------------------------------------- IN OPERATOR -------------------------------------------- --
-- Instead of combining more that one condition in OR operator we can use IN operator ease.
SELECT * FROM sql_store.customers WHERE state = 'VA' OR  state = 'GA' OR state = ' FL';
SELECT * FROM sql_store.customers WHERE state IN ( 'VA', 'GA', ' FL' );

-- We can combine IN operator with NOT
SELECT * FROM sql_store.customers WHERE state NOT IN ( 'VA', 'GA', ' FL' );

-- ----------------------------------------------- BETWEEN OPERATOR -------------------------------------------- --
--  We can compare an attribute with a range of values we use WHERE clause wuth AND or OR operator
-- This requirement can also be achieved with BETWEEN OPERATOR
SELECT * FROM customers WHERE points >= 1000 AND points <= 3000;
SELECT * FROM customers WHERE points BETWEEN 1000 AND 3000;

-- ----------------------------------------------- REGEXP OPERATOR -------------------------------------------- --
-- Lets search customers who has 'field' in last_name
SELECT * FROM customers WHERE last_name LIKE '%field%';

-- This same can be achieved by the REGEXP
SELECT * FROM customers WHERE last_name REGEXP 'field';

-- ^: Must start with e.g. ^field
-- $: Must end with e.g. field$
-- |: To check the attribute value available anywhere in conjunction with or clause e.g. 'field|mac|rose'
-- '^field|mac|rose', this matches last name starting with field, or last name having mac or rose in it.
-- 'field$|mac|rose', this matches last name ending with field, or last name having mac or rose in it.
-- []: SELECT * FROM customers WHERE last_name REGEXP '[gim]e'. This matches any customer whi  has ge, ie, me in last name
--     SELECT * FROM customers WHERE last_name REGEXP 'e[gim]'. This matches any customer whi  has eg, ei, em in last name
--     [a-g]e is equivalent to [abcdefg]e

-- ^: beginning
-- $: end
-- |: logical
-- []: SELECT * FROM customers WHERE last_name REGEXP '[gim]e'. This matches any customer whi  has ge, ie, me in last name
--     SELECT * FROM customers WHERE last_name REGEXP 'e[gim]'. This matches any customer whi  has eg, ei, em in last name
--     [a-g]e is equivalent to [abcdefg]e

-- ----------------------------------------------- IS NULL OPERATOR -------------------------------------------- --
-- We will see here how can we check for the entry/record with a missing attribute.
SELECT * FROM customers;
SELECT * FROM customers WHERE phone IS NULL;
SELECT * FROM customers WHERE phone IS NOT NULL;