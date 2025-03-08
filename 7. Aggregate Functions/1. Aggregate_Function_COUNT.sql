-- ----------------------------------------------- AGGREGATE FUNCTION COUNT -------------------------------------------- --
-- Aggregate functions are inbuilt functions in SQL, which allow us to aggregate or combine the data to get the meaningful data.
-- Average, count, min, max, group by, and sum are some of the aggregate functions which we will see in coming sections.

-- COUNT function will basically give us the count for whichever attribute we ask for.

USE book_shop;
SELECT DATABASE();

-- How many books are in the database?
SELECT COUNT(*) FROM books;

-- How many author_fnames are in database?
SELECT COUNT(author_fname) FROM books;  -- 19

-- Here the query returns all the author_fnames in the books table. In this scenario one author might have published  more that 1 book.
-- There is a way to achieve this by using DISTINCT keyword that we seen in refining the query data.
SELECT COUNT( DISTINCT( author_fname ) ) FROM books; -- 12

-- This output may also be wrong as there may be author with same first name, let's rectify the query, assuming the author full name is unique.
SELECT COUNT( DISTINCT( CONCAT( author_fname, author_lname ) ) ) FROM books; -- There are indeed 12 unique authors
SELECT COUNT( DISTINCT author_fname, author_lname ) FROM books; -- There are indeed 12 unique authors

-- Let's try an interesting case here, how many titles contain the word 'the'?
SELECT COUNT( title ) FROM books WHERE title LIKE '%the%'; 

-- Now print all the books which has 'the' in the title.
SELECT title FROM books WHERE title LIKE '%the%'; 

