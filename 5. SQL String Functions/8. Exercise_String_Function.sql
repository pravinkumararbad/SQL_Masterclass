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

-- Print author's full name in caps
SELECT UPPER( CONCAT( author_fname, ' ', author_lname ) ) FROM books;

-- Form a string <title> was released in <release date>. Put a lable for column.
SELECT CONCAT( title, ' was released in ', released_year, '.' ) AS details FROM books;

-- Print a book name and character count in two seperate columns and provide approperiate column label.
SELECT title, CHAR_LENGTH( title ) AS character_count FROM books;