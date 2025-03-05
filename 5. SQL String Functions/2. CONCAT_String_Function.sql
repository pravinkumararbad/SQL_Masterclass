--  Verify the correct database is selection for this section.
SELECT DATABASE();

-- There are a lot of string functions, we can refer to the documentation for complete list.
-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html
-- We will be going through the most commonly used functions.

-- ----------------------------------------------- CONCAT STRING FUNCTION -------------------------------------------- --
-- Used for combining  data for cleaner output.
-- Usage CONCAT( attr1, attr2, " ", ""any_string )

SELECT CONCAT ( 'Hello', ' ', 'World!' ) AS Example;
SELECT CONCAT( author_fname, ' ', author_lname) AS "Full Name" FROM books;
SELECT author_fname AS first, author_lname AS last, CONCAT ( author_fname, ' ', author_lname ) AS 'Full Name' FROM books;
SELECT author_fname AS first, author_lname AS last, CONCAT ( author_fname, ', ', author_lname ) AS 'Full Name' FROM books;

-- ----------------------------------------------- CONCAT_WS STRING FUNCTION -------------------------------------------- --
-- CONCAT_WS stands for concat with seperator.
SELECT CONCAT(title, '-', author_fname, '-', author_lname) AS INFO FROM books;

--  The same CONCAT output can be achived by the CONCAT_WS with much less effort.
SELECT CONCAT_WS(' - ', title, author_fname, author_lname) AS INFO FROM books;