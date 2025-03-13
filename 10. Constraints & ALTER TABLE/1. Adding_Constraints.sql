-- ------------------------------------------------------------------------------ Constraints  & ALTER TABLE -------------------------------------------------------------------- --
-- Let's talk about more constraints that we can have on the database tables.
-- We saw some constrains before like NOT NULL, PRIMARY KEY

-- ------------------------------------------------------------------------------ UNIQUE CONSTRAINT -------------------------------------------------------------------- --
USE new_testing_db;

-- Create a new table contacts.
CREATE TABLE contacts (
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

-- Insert some data in table contacts.
INSERT INTO contacts ( name, phone ) VALUES ( 'billy', '7867656787' );
SELECT * FROM contacts;

-- We will get an error here, as we are provided duplicated phone number and constraint we added for phone attribute is UNIQUE.
-- Error Code: 1062. Duplicate entry '7867656787' for key 'contacts.phone'.
INSERT INTO contacts ( name, phone ) VALUES ( 'timmy', '7867656787' );
SELECT * FROM contacts;

INSERT INTO contacts ( name, phone ) VALUES ( 'billy', '7867656788' );

-- ------------------------------------------------------------------------------ CHECK CONSTRAINT -------------------------------------------------------------------- --
-- This keyword helps us to have some custom constrains in tables based on some conditions.
CREATE TABLE partiers (
    name VARCHAR( 50 ) NOT NULL,
    age INT CHECK ( age > 18 )
);

-- Here we will get an error as we have constraint in place to check the age to be strictly above 18 years for party.
-- Error Code: 3819. Check constraint 'partiers_chk_1' is violated.
INSERT INTO partiers ( name, age ) VALUES ( 'andy', 12 );
INSERT INTO partiers ( name, age ) VALUES ( 'andy', 18 );

-- Lets try a valid scenario
INSERT INTO partiers ( name, age ) VALUES ( 'andy', 19 );
SELECT * FROM partiers;

-- Try a new example
CREATE TABLE palindromes(
    word VARCHAR(100) CHECK ( REVERSE( word ) = word )
);
DESC palindromes;

-- We will get an error as we are violating the constraint added.
-- Error Code: 3819. Check constraint 'palindromes_chk_1' is violated.
INSERT INTO palindromes( word ) VALUES( 'Hello' );

-- Lets try a positive scenario.
INSERT INTO palindromes( word ) VALUES ( 'racecar' );
SELECT * FROM palindromes;

-- ------------------------------------------------------------------------------ NAMED CONSTRAINT -------------------------------------------------------------------- --
-- When we are adding a constraint in the database table. SQL itself is coming up with the name for the constraint.
-- If we check for above examples, we see the constraint name in the errors. [partiers_chk_1, palindromes_chk_1]
-- This follows the sequence and name of table as combination for the constraint name, but we can add a custom name to the constraint.
CREATE TABLE partiers2(
    name VARCHAR(50),
    age INT,
    CONSTRAINT age_over_18 CHECK ( age > 18 )
);

-- If we check the error generated here, the error is providing the named constraint unlike auto generated constraint name in the earlier examples.
-- Error Code: 3819. Check constraint 'age_over_18' is violated.
INSERT INTO partiers2 ( name, age ) VALUES ( 'Andy', 12 );

-- ------------------------------------------------------------------------- MULTIPLE COLUMN CONSTRAINT -------------------------------------------------------------- --
-- If the combination of one or more columns is to be validated based on some conditions. Then we can use multiple column constraints.
-- This is not far from what we have used so far. Lets see an example to understand the usecase.

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name, address)
);
INSERT INTO companies ( name, address ) VALUES ('GenericMotors', 'Pune');
INSERT INTO companies ( name, address ) VALUES ('GenericMotors', 'Mumbai');
INSERT INTO companies ( name, address ) VALUES ('SomeAutoMaker', 'Mumbai');

-- As we are dealing a with a constraint which is looking for the name, and address combination to be unique. Here we will get an error. As this entry combination is already present in table.
-- Error Code: 1062. Duplicate entry 'SomeAutoMaker-Mumbai' for key 'companies.name_address'
INSERT INTO companies ( name, address ) VALUES ('SomeAutoMaker', 'Mumbai');

SELECT * FROM companies;