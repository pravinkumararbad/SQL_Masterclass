-- ----------------------------------------------- AGGREGATE FUNCTION AVG -------------------------------------------- --
-- This function helps us average the data.
-- Calculate the average released_year across all books

USE book_shop;

SELECT AVG( released_year ) FROM books; -- 1999.7895

-- CEIL the average data
SELECT CEIL ( AVG( released_year ) ) FROM books; -- 2000

-- FLOOR the average data
SELECT FLOOR ( AVG( released_year ) ) FROM books; -- 1999

-- Calculate average stock quantity for books released in same year
SELECT AVG(stock_quantity) FROM books GROUP BY released_year;

SELECT released_year, CEIL( AVG(stock_quantity) ) AS avg_stock_qty FROM books GROUP BY released_year ORDER BY released_year;

SELECT author_fname, author_lname, AVG( pages )FROM books GROUP BY author_lname, author_fname;

SELECT author_fname, author_lname, CEIL( AVG( pages ) ) FROM books GROUP BY author_lname, author_fname;