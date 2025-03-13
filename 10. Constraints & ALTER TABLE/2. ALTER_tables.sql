-- ------------------------------------------------------------------------------ ALTER TABLES -------------------------------------------------------------------- --
-- ALTER command is used to update or change the database table schema.
use new_testing_db;

-- ------------------------------------------------------------------------------ ADDING NEW COLUMN INTO TABLE -------------------------------------------------------------------- --
ALTER TABLE companies ADD COLUMN city VARCHAR(25);
DESC companies;

-- We can add column, drop a column, and rename column.
-- We also have a choice to drop primary, foreign keys, add constraints, indexes etc.
-- This is one of those command which takes a lot of parameters and can be a pain to understand fully.
-- We can alwats visit the documentation to understand if we are facing any issue understanding any supported option.

SELECT * FROM companies;
ALTER TABLE companies ADD COLUMN phone VARCHAR(15);

-- The newly added column phone in the table companies, has default value as NULL for the existing entries.
-- We also have a choice to mark the column being added is NOT NULL.
-- There the default value will be added based on the data type that we are assigning for the column.

ALTER TABLE companies ADD COLUMN employee_count INT NOT NULL; -- With this the default value is added as 0 for existing table entries.
DESC companies;
SELECT * FROM companies;

-- We can also manage the default values for the column being added at the same time.
ALTER TABLE companies ADD COLUMN employee_count1 INT NOT NULL DEFAULT 1;
DESC companies;
SELECT * FROM companies;

-- ------------------------------------------------------------------------------ DROP A COLUMN FROM TABLE -------------------------------------------------------------------- --
-- This command can be used to drop the existing attribute column from the table.
ALTER TABLE companies DROP COLUMN phone;
DESC companies;

-- The phone column was an empty column, what if we try to drop a column which has some data populated. What happens in this case?
-- Correct, this works exactly like the DROP table works. The SQL commands does not care if there is data present in the DB table or now, the column will be dropped irrespective of data in the table column.
ALTER TABLE companies DROP COLUMN employee_count1;
DESC companies;
SELECT * FROM companies;

-- ------------------------------------------------------------------------------ RENAMING EXISTING TABLES -------------------------------------------------------------------- --
-- This command will help us rename the existing table from the DB.
RENAME TABLE companies TO suppliers;

-- This will give an error, as we have updated the table name from companies to suppliers.
-- Error Code: 1146. Table 'new_testing_db.companies' doesn't exist
DESC companies;

-- Let's check the table suppliers.
DESC suppliers;

-- There is another way to rename the table. Where we can use 'ALTER TABLE' syntax.
ALTER TABLE suppliers RENAME companies;

-- This will give an error, as we have updated the table name from suppliers to companies.
-- Error Code: 1146. Table 'new_testing_db.suppliers' doesn't exist
DESC suppliers;

-- Let's check the table companies.
DESC companies;

-- ------------------------------------------------------------------------------ RENAMING TABLE COLUMNS -------------------------------------------------------------------- --
-- As using ALTER TABLE command we can add, and drop columns. There is a way to rename the existing columns as well.
 
ALTER TABLE companies RENAME COLUMN address TO full_address;
DESC companies;

ALTER TABLE companies RENAME COLUMN name TO company_name;
DESC companies;

-- ------------------------------------------------------------------------------ MODIFY TABLE COLUMNS -------------------------------------------------------------------- --
-- Modify columns should not be confused with the rename of columns.
-- With modify we can change the existing column data type.
-- We need to careful while performing this option. Because assume a situation where we are updating DATE column to INT. This will cause many issue.

-- Let's try an example, modify a column city and update type from VARCHAR(25) to VARCHAR(50), and default value to 'unknown'.
DESC companies;

ALTER TABLE companies MODIFY city VARCHAR (50) DEFAULT 'unknown';
DESC companies;

-- With this command execution the city ill take value 'unknown' by default.
INSERT INTO companies ( company_name, full_address, employee_count ) VALUES ( "ABC Corp", 'Pune 123', 8 );
INSERT INTO companies ( company_name, full_address, employee_count, city ) VALUES ( "XYZ Corp", 'Pune 456', 14, 'Pune' );
SELECT * FROM companies;

-- If the requirement is to RENAME the COLUMN and change its data type. We can achieve the requirement like this.
ALTER TABLE companies CHANGE company_name company_full_name VARCHAR( 150 );
DESC companies;


-- IMPORTANT NOTE: When we are modifying the existing tables, we use MODIFY. When we are in need to update the column name along with data type we use CHANGE.

-- ------------------------------------------------------------------------------ ALTER TABLE CONSTRAINTS -------------------------------------------------------------------- --
CREATE TABLE houses (
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL
);
INSERT INTO houses  ( purchase_price, sale_price ) VALUES ( 100, 200 );
SELECT * FROM houses;

-- Now we are adding a constraint on 
ALTER TABLE houses ADD CONSTRAINT positive_price CHECK ( purchase_price >= 0 );
DESC houses;

-- As we have modified the existing column's constraint we can not have the purchase price below 0 and will get an error for below query execution.
-- Error Code: 3819. Check constraint 'positive_price' is violated.
INSERT INTO houses  ( purchase_price, sale_price ) VALUES ( -9, 200 );

-- We can also DROP existing constraint.
ALTER TABLE houses DROP CONSTRAINT positive_price;

-- As the constraint is dropped now, I can set the purchase_price below 0.
INSERT INTO houses  ( purchase_price, sale_price ) VALUES ( -9, 200 );
SELECT * FROM houses;