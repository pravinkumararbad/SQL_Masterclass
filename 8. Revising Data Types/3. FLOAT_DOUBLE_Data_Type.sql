-- ------------------------------------------------------------------------------ FLOAT AND DOUBLE -------------------------------------------------------------------- --
-- There are some more types to represent data which is not whole numbers.

-- DIfference between all these types DECIMAL, FLOAT, and DOUBLE is little bit technical. It is related to how things are stored in memory.
-- The technocal difference between these types is not a lot that concerns us, but how it differs in functionality.

 -- The DECIMAL data tyoe is a fixed-point type and calculations are exact.
 -- The FLOAT and DOUBLE data types are floating point data types and calculations are approx. In MySQL, types that are synonymous with FLOAT or DOUBLE are DOUBLE PRECISION and REAL.
 
-- FLOAT and DOUBLE stores larger numbers using less space. But it comes at the cost of precision.

-- Data Type    Memory Needed       Precision Issues
-- FLOAT        4 Bytes             ~7 Digits
-- DOUBLE       8 Bytes             ~15 Digits

-- In this given number 1000001. We can run into problem as the last digit 1, can not be precise.

-- Which numberic data type should we use.
-- Always try and use DECIMAL, if the the data we are using is high precision. E.g. Banking Data

CREATE TABLE thingies ( price FLOAT );
INSERT INTO thingies ( price ) VALUES ( 88.45 );
INSERT INTO thingies ( price ) VALUES ( 8877.45 );

-- Here we will get some weird behavior as the precision for FLOAT is for 7 digits.
-- SO when we insert data for more than 7 digit length, the data stored will be not as per our expectation.
INSERT INTO thingies ( price ) VALUES ( 8877665544.45 );
SELECT * FROM thingies; -- 8877670000

-- If we use DOUBLE instead of FLOAT the precision digit supported will be to 15 digits.