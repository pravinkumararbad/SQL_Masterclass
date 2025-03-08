-- ----------------------------------------------- SEARCH DATA WITH LIKE KEYWORD  -------------------------------------------- --
-- LIKE is a important and useful keyword for better searching the data.
-- Like allows us to find the data, when we do not exactly know the attribute value from table but partial data.

-- We use wildcards to use the LIKE clause.
-- We have 2 wildcards % and _.

USE book_shop;
SELECT DATABASE();

-- ----------------------------------------------- Let's discuss % wildcard  -------------------------------------------- --
SELECT * FROM books WHERE author_fname LIKE '%da%';

-- Here %% symbol is known as wildcard.

-- SELECT data where author_fname starts with da and contains i anywhere in the name.
SELECT * FROM books WHERE author_fname LIKE 'da%i%';

-- SELECT data where author_fname starts with da
SELECT * FROM books WHERE author_fname LIKE 'da%';

-- SELECT data where title matches with 'the'
SELECT * FROM books WHERE title LIKE '%the%';

-- ----------------------------------------------- Let's discuss _ wildcard  -------------------------------------------- --
-- Underscore wildcard is used to mention exactly one character.
SELECT * FROM books;

--  Select data where the stock_quantity is 4 letter (char length) long.
SELECT * FROM books WHERE stock_quantity LIKE '____';

-- This query will return books where author name has fifth character d.
SELECT * FROM books WHERE author_fname LIKE '____d%';

-- What if we have _ or % in the attribute value for some entry, how do we fetch that data?
-- We use the escape character, just like any othe programming language.
SELECT title FROM books WHERE title LIKE '%\%%';
SELECT title FROM books WHERE title LIKE '%\_%'

-- IMPORTANT NOTE: We can deep dive into regular expression. To take  a better advantage of LIKE keyword.