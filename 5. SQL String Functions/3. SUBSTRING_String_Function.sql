--  Verify the correct database is selection for this section.
SELECT DATABASE();

-- ----------------------------------------------- SUBSTRING STRING FUNCTION -------------------------------------------- --
-- Used to select individual parts or portians of the string.
-- Usage CONCAT( 'Hello World', startIndx [index_starts_at_1 in sql], endIndx )
--    SELECT SUBSTRING( 'Hello World', 1, 4 ); -> 'Hell'
--    SELECT SUBSTRING( 'Hello World', 7 );    -> World
--    SELECT SUBSTRING( 'Hello World', -3 );   -> rld

SELECT SUBSTRING( 'Hello World', 1, 4 );
SELECT SUBSTRING( 'Hello World', 7 );
SELECT SUBSTRING( 'Hello World', -3 ); -- Only length of the string in negative length is valid input.

-- SELECT SUBSTRING( 'Where I'm Calling From: Selected Stories', 1, 10 ) FROM books; // This is invalid case as the appostopy is being considered as quote in this case
SELECT SUBSTRING( "Where I'm Calling From: Selected Stories", 1, 11 ) FROM books;
SELECT SUBSTRING( 'Where I''m Calling From: Selected Stories', 1, 11 ) FROM books; -- Here single  quote used 2 times works as a escape character.

-- Get SUBSTRING of the book title for all books from the books table.
SELECT title FROM books;
SELECT SUBSTRING( title, 1, 10 ) AS 10_length FROM books;

-- SUBSTR also works. We can use SUBSTRING or SUBSTR both methods for having substring functionality.
SELECT title FROM books;
SELECT SUBSTR( title, 1, 10 ) AS 10_length FROM books;

-- IMPORTANT NOTE: We can combine the CONCAT and SUBSTRING, or any string functions.

-- What if we want to not abruptly end the title but to add ... after the title is shortened with SUBSTRING.
SELECT CONCAT( SUBSTR( title, 1, 10 ), '...' ) AS 'short title' FROM books; 