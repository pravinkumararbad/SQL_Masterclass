-- ------------------------------------------------------------------------------ NUMBERS -------------------------------------------------------------------- --
-- There are quite a lot of numberic datatypes.
-- The one we have been using for some time is INT, which is used to represent whole numbers.

-- DECIMAL, the data type used represent numeric values whioch hold some value after the decimal points.

-- DECIMAL ( 5, 2 ) --> 999.99, 145.98, etc.
-- 5 represents the number of digits the numberic value can have, it includes the number after decimal point.
-- 2 represents the number of digits those fall after the decimal points.

USE new_testing_db;
SELECT database();

CREATE TABLE items ( price DECIMAL( 5, 2 ) );

-- These inserts works fine as these values fall in DECIMAL( 5, 2 ).
INSERT INTO items ( price ) VALUE ( 8 );
INSERT INTO items ( price ) VALUE ( 45.87 );

-- This insert will execute with warning and the largest possible value will be added in the table i.e. 999.99.
INSERT INTO items ( price ) VALUE ( 75876879 );

-- This insert will execute with warning and the decimal value will be added in the table as 45.86.
INSERT INTO items ( price ) VALUE ( 45.875 );  

-- This will adjust the decimals and as the value is ending with .9999 the adjustment will be made to 299.
INSERT INTO items ( price ) VALUE ( 298.9999 );

-- This will adjust the decimals and as the value is ending with .9999 the adjustment will be made to 2.
INSERT INTO items ( price ) VALUE ( 1.9999 );
SELECT * FROM items;