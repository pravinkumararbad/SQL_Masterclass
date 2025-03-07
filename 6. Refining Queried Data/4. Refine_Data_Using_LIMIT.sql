-- ----------------------------------------------- LIMIT QUERIED DATA -------------------------------------------- --
-- LIMIT allows us to specify a number for how many results we want to select.
-- Let's take an example, what if I want a list of top 10 best selling books, or top ten recent books. We use LIMIT in this case.
-- We mostly use LIMIT in combination with ORDER BY ( sorting ), as we want the some specific number of output based on some criteria.

-- LIMIT in action, get the 2 books from books table.
SELECT title FROM books LIMIT 2;

--  Get 5 recent released books from books table.
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;

-- We can also write this query using SELECT attribute index.
SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 5;

-- We can use LIMIT in some variation.
-- This below query is exactly identical that we have writter for top 5 recent books.
-- Here the LIMIT is provided as index starting from 0.
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0, 5;
SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 0, 5;

-- This query will return top 5 books eliminating the most recent first book in the books table.
SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 1, 5;

-- What is the realistic scenario where we mostlty use LIMIT.
-- Lets assume we are shopping for T-shirt, we can order the t-shirts based on popularity.
-- We also have a selector how many t-shirt articles we can load on a single page, assume we have 100 t-shirts loaded.
-- When we click page 2 or next we see the next bunch of 100 popular t-shirts.
-- This is one of the real time examples where we can use ORDER BY and LIMIT in combination to provide the refined data.

-- FUN PART --
-- This is straight from the documentation page.
-- If we want to fetch all the data from a db table, there is no nice way.
-- Assume we want to get the sorted data based on some attribute from 8th row. This is how we fetch it.
SELECT * FROM books LIMIT 7, 18446744073709551615; -- 18446744073709551615 can be any extremely large number, far beyond the amount of data we have in the table.

--  IMPORTANT, We may use the count of data from table and use the starting data entry to compute the data left in table.