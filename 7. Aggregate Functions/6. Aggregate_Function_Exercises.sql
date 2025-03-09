-- ----------------------------------------------- AGGREGATE FUNCTIONS EXERCISES -------------------------------------------- --
USE book_shop;
SELECT database();

-- Print the number of books in the database
SELECT COUNT(*) FROM books;

-- Print out how many books were released in each year
SELECT released_year, COUNT( title ) AS books_released FROM books GROUP BY released_year ORDER BY released_year;

-- Print out the total number of books in stock
SELECT SUM( stock_quantity ) AS n_books FROM books;

-- Find the average released_year for each author
SELECT CONCAT (author_fname, ' ', author_lname) AS auth_fullname, AVG (released_year) AS avg_rel_yr_for_auth FROM books GROUP BY author_fname, author_lname;

-- Find the full name of the author who wrote the longest book by title length and page count.
SELECT CONCAT( author_fname, ' ', author_lname ) AS writer FROM books WHERE ( SELECT MAX( CHAR_LENGTH( title ) ) FROM books ) = CHAR_LENGTH( title );
SELECT CONCAT( author_fname, ' ', author_lname ) AS writer FROM books WHERE pages = ( SELECT MAX( pages ) FROM books );

SELECT CONCAT( author_fname, ' ', author_lname ) AS writer FROM books ORDER BY CHAR_LENGTH( title ) DESC LIMIT 1;
SELECT CONCAT( author_fname, ' ', author_lname ) AS writer FROM books ORDER BY pages DESC LIMIT 1;
SELECT * FROM books ORDER BY released_year;

-- Make this happen
-- Year #Books avg_pages
SELECT released_year AS Year, COUNT( title ) AS '#Books', AVG ( pages ) avg_books FROM books GROUP BY released_year ORDER BY released_year ASC;