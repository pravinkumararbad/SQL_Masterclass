--  Verify the correct database is selection for this section.
SELECT DATABASE();

-- ----------------------------------------------- STRING FUNCTION EXERCISES -------------------------------------------- --

-- Reverse and Uppercase the following sentence. 'Why  does my cat look at me with such hatred?'
SELECT UPPER( REVERSE('Why  does my cat look at me with such hatred?') );

-- What would this query will print?
SELECT REPLACE( CONCAT( 'I', ' ', 'like', ' ', 'cats'), ' ', '-' ); -- I-like-cats

-- Replace the space with arrow for all book titles from books table.
SELECT REPLACE( title, ' ', '->' ) FROM books;

-- Print the data in format given below.
-- forwards        backwords
-- author_fname    author_fname_reverse

SELECT author_fname AS forwards, REVERSE( author_fname ) AS backwords FROM books;