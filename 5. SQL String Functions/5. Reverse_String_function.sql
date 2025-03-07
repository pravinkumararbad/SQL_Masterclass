--  Verify the correct database is selection for this section.
SELECT DATABASE();

-- ----------------------------------------------- REVERSE STRING FUNCTION -------------------------------------------- --
--  Reverese reverses the result string.
SELECT REVERSE('Hello World'); -- 'dlroW olleH'

SELECT REVERSE( 'mow meow' );

SELECT REVERSE( author_fname ) FROM books;

-- We can combine all the string functions as discussed.
SELECT CONCAT( 'woof', REVERSE( 'woof' ) );

SELECT CONCAT( author_fname, ' ', REVERSE( author_fname ) ) FROM books;