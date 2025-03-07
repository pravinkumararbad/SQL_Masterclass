-- ----------------------------------------------- QUERY DISTINCT DATA -------------------------------------------- --

-- Distinct is something that we use in conjunction with SELECT. 
-- If we query and select some data from database table, we get all the data from the table.
-- Using distinct will make sure that our query will only return the distinct selection data from the database table.

-- Let's try a simple example in use.
SELECT COUNT(  DISTINCT(author_lname) ) FROM books; -- 11
SELECT DISTINCT author_lname FROM books;

-- Verify we are getting the distinct author names by getting count of the selected objects.
SELECT COUNT( author_lname ) FROM books; -- 19

-- Let's check some integer data as well, to verify this works with intger data as well.
SELECT released_year FROM books;
SELECT DISTINCT ( released_year ) FROM books;

-- Let's try some advance examples. Try combining the string function concat to form the full name and try DISTINCT query.
SELECT DISTINCT( CONCAT( author_fname, ' ', author_lname ) ) AS DISTINCT_AUTHORS FROM books;
SELECT COUNT(  DISTINCT( CONCAT( author_fname, ' ', author_lname ) ) ) FROM books; -- 12

-- Is there any other way, surprise surprise there actually is. We need not use the CONCAT explicitly.
-- SQL can do it for us if we select multiple columns.
SELECT DISTINCT author_fname, author_lname FROM books;

-- Let's check the count returned. We will get the similar results as before when we used CONCAT string function.
SELECT COUNT(  DISTINCT author_fname, author_lname ) AS DISTINCT_AUTHORS_COUNT FROM books; -- 12