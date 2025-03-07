--  Verify the correct database is selection for this section.
SELECT DATABASE();

-- ----------------------------------------------- CHAR_LENGTH STRING FUNCTION -------------------------------------------- --
-- This also is very quick function to study, this counts the character length of the string.

SELECT CHAR_LENGTH('Hello World!');

SELECT CHAR_LENGTH(author_fname) FROM books;

SELECT CONCAT( author_fname, ' ', CHAR_LENGTH(author_fname) ) FROM books;

SELECT CONCAT( author_fname, ' is ', CHAR_LENGTH(author_fname), ' characters long.'  ) AS 'AUTHOR NAME LENGTH' FROM books;

-- NOTE: WE CAN USE SQL FORMATTERS TO MAKE THE SQL LOOK PRETTY.
SELECT CONCAT(author_fname, ' is ', CHAR_LENGTH(author_fname),
       ' characters long.') AS
       'AUTHOR NAME LENGTH'
FROM  books;