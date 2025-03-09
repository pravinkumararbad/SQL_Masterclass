-- ----------------------------------------------- AGGREGATE FUNCTION SUM -------------------------------------------- --
-- Surprise, Surprise! sum will add the things together.
-- SUM all the pages in the entire database;
-- This works in integers.

USE book_shop;
SELECT SUM(pages) FROM books;

SELECT SUM( released_year ) FROM books;

-- Find which author cummulatively has written the most nnumber of pages.
SELECT author_fname, SUM( pages ) AS cummulative_pages FROM books GROUP BY author_fname, author_lname;
SELECT author_fname, SUM( released_year ) AS cummulative_release FROM books GROUP BY author_fname, author_lname;