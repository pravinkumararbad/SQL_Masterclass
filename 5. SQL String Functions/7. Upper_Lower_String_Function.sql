--  Verify the correct database is selection for this section.
SELECT DATABASE();

-- ----------------------------------------------- UPPER, LOWER STRING FUNCTION -------------------------------------------- --
-- UPPER and LOWER string functions can be used to change the string case.

SELECT UPPER( 'HELLO WorLD!' );

SELECT LOWER( 'HELLO WORLD!' );

SELECT UPPER( title ) FROM books;

SELECT CONCAT( 'My favorite book name is the ', UPPER( title ) ) FROM books;

SELECT CONCAT( 'My favorite book name is the ', LOWER( title ) ) FROM books;