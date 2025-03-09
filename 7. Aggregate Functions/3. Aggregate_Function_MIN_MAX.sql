-- ----------------------------------------------- AGGREGATE FUNCTION MIN, MAX -------------------------------------------- --
-- MIN and MAX without GROUP BY
USE book_shop;

-- Find minimum release year
SELECT MIN( released_year ) FROM book_shop.books;

-- Find minimum page length
SELECT MIN( pages ) FROM books;

-- Find minimum length of title
SELECT MIN( CHAR_LENGTH(title) ) FROM books;

-- Find maximum page length
SELECT MAX( released_year ) FROM book_shop.books;

-- Print the pages of the max number of pages in book.
SELECT MAX( pages ) FROM books;

-- print the length of longest book count
SELECT MAX( CHAR_LENGTH(title) ) FROM books;

-- Write a query to print the length of longest titled book and the title of the same book
-- We may think the below query would work but it does not, we have to use subqueries.
SELECT MAX( pages ), title FROM books;

-- With the query above we will receive the solution table as below, and it is incorrect title.
-- title           MAX( pages )
-- "The Namesake"  634

-- Aggregate functions in SQL work by processing multiple rows and returning a single result. We seen this in GROUP BY clause.
-- When an aggregate function is used without a GROUP BY clause, it combines all the rows into one summary result.
-- Any other column selected alongside the aggregate function (without aggregation) will return only one arbitrary value,
-- which may not be meaningful or correct.

-- Let's think of one possible solution called subquery.
-- Here we are using subquery, this thing we will explore in the upcoming sections.
SELECT title, CHAR_LENGTH(title) AS title_length FROM books WHERE CHAR_LENGTH(title) = (SELECT MAX(CHAR_LENGTH(title)) FROM books);
SELECT title, CHAR_LENGTH(title) AS title_length FROM books WHERE pages = ( SELECT MAX(pages) FROM books );

-- IMPORTANT NOTE: Subqueries are slow, as this seems like a single query but underneath it runs two queries.
-- We also have an alternative for that if high performance is important.
SELECT * FROM books ORDER BY pages DESC LIMIT 1;
SELECT * FROM books ORDER BY CHAR_LENGTH(title) DESC LIMIT 1;

-- IMPORTANT NOTE: MySQL does not know how to apply an aggregate function in ORDER BY when the main query is non-aggregated.
-- As a rule of thumb, when using aggregate functions in ORDER BY or for data filtering, ensure the query is properly aggregated using GROUP BY or a subquery to avoid errors.

-- ----------------------------------------------- USING MIN, MAX WITH GROUP BY -------------------------------------------- --
-- Find the year each author published their first book
SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_fname, author_lname;

-- We got the output with the first release for each other.
-- author_fname            author_lname        MIN(released_year)
-- Jhumpa                  Lahiri              1996
-- Neil                    Gaiman              2001
-- Dave                    Eggers              2001
-- Michael                 Chabon              2000
-- Patti                   Smith               2010
-- Raymond                 Carver              1981
-- Don                     DeLillo             1985
-- John                    Steinbeck           1945
-- David                   "Foster Wallace"    2004
-- Dan                     Harris              2014
-- Freida                  Harris              2001
-- George                  Saunders            2017

-- What if we group by the last name
SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname;

-- We got the output with the first release for each other as we want but there were 2 authors with lastname harris.
-- So we get the row entry for Dan Harris and the GROUP BY will group 2  entries merged into single row.
-- This row will include Dan Harris, and Freida Harris.
-- As we are looking for first release by each author here the information returned is also incorrect.
-- Dan Harris release his first book in 2014 and not in 2001.

-- author_fname            author_lname        MIN(released_year)
-- Jhumpa                  Lahiri              1996
-- Neil                    Gaiman              2001
-- Dave                    Eggers              2001
-- Michael                 Chabon              2000
-- Patti                   Smith               2010
-- Raymond                 Carver              1981
-- Don                     DeLillo             1985
-- John                    Steinbeck           1945
-- David                   "Foster Wallace"    2004
-- Dan                     Harris              2001
-- George                  Saunders            2017

-- If the below variables are set to ONLY_FULL_GROUP_BY mode, this makes using SQL strict and error proof.
-- If some queries due to involvement of aggregate function, or any other reason tends to give incorrect behavior.
-- It returns an error and do not execut the query.
SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY';
SET GLOBAL sql_mode = 'ONLY_FULL_GROUP_BY';

-- If at all user want to see the incorrect result and not restrict the execution of query we can use below commands to reset the mode.
SET GLOBAL sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
SET SESSION sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));

-- Find the longest page count for each author
SELECT * FROM books;
SELECT title, MAX(pages) FROM books GROUP BY author_fname, author_lname ORDER BY MAX(pages);
SELECT title, MAX(pages) AS max_pages FROM books GROUP BY author_fname, author_lname ORDER BY max_pages;

SELECT CONCAT( author_fname, ' ', author_lname ) AS author_fullname, MAX( pages ) AS max_pages FROM books GROUP BY author_lname, author_fname;