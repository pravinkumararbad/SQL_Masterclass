-- ---------------------------------------------------------------------------------- ON DELETE CASCADE ------------------------------------------------------------------------ --
-- This session covers the scenario for the FOREIGN KEY and its deletion.
-- In current example we have a orders.customer_id as FOREIGN KEY, which has reference over customers.id.

-- If we take a closer look, we can have a customer in the table who does not have a single order made. This is completely valid.
-- But what should happen when we delete the customer from table.
-- If Boy George is deleted from the customers table, what should happen to the orders made by Boy George in orders table.

-- Let's check what happens in current scenario.
DELETE FROM customers WHERE last_name='George';

-- We get an error which mentions can not delete or uipdate a parent row
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`shop`.`orders`, CONSTRAINT `customer_id_foreign_key` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`))
-- This error means that when we delete a customer from the customers table, who has made an order and is referenced in other table. This violdated the customer_id_foreign_key CONSTRAINT we had put on orders.

-- There are different ways to handle this scenario.
-- 1. We can update the customer_id when we delete a customer.
-- 2. We can delete all the orders made by customer when we delete a customer from the table.

-- These all the possible scenarios for the update can be handlled by ON DELETE CASCADE using ALTER TABLE.
-- We can also do this in schema at the time of creating the table.
-- MySQL does not support modifying foreign keys directly with ALTER TABLE MODIFY. The only way is to drop and recreate it. The attribute with ALTER TABLE.

ALTER TABLE orders DROP FOREIGN KEY customer_id_foreign_key; -- We have to provide a constraint name provided

-- Check the orders table schema, we added the CONSTRAINT to make the customer_id foreign key.
-- Make sure the column customer_id is present but the key is not mentioned as FOREIGN KEY
DESC orders;
SHOW COLUMNS FROM orders;

-- With this command we added the customer_id as FOREIGN KEY again which is REFERENCING customers.id and we also added ON DELETE CASCADE.
ALTER TABLE orders ADD CONSTRAINT update_foreign_key_on_delete FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE;

-- Now try deleting the customer Boy George from customers table.
-- This command for delete should execute successfully and the orders made by the deleted customer should also get deleted due to ON DELETE CASCADE.
DELETE FROM customers WHERE last_name='George';

-- Verify the customer with last_name George is deleted.
SELECT * FROM customers;

-- verify all the orders made by George are also deleted from orders table.
SELECT * FROM orders;