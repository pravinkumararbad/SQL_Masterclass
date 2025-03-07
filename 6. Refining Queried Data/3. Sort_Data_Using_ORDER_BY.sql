-- ----------------------------------------------- SORTING QUERIED DATA USING ORDER BY -------------------------------------------- --

-- ORDER BY is used to sort the data based on order by some attribute.
SELECT author_lname FROM books ORDER BY author_lname;

-- The ORDER BY attribute need not be the same attribute that is being selected.
SELECT author_lname FROM books ORDER BY author_fname;

-- Let's try some other attribute for the query.
SELECT title FROM books ORDER BY title;
SELECT title FROM books ORDER BY released_year;

-- As you might have noticed in the earlier examples we are mentioning a attribute but not the order in which the ORDER BY should work.
-- That is an excellent observation. SQL takes ASC order by default for sorting/ordering the data when we use ORDER BY.
-- Let's verify that is true.

-- Here the DB will take course and get the data as we have inserted in DB
SELECT author_fname FROM books;

-- Try the ORDER BY without prividing sorting order.
SELECT author_fname FROM books ORDER BY author_fname;

-- Try the ORDER BY, prividing sorting order explicitly.
SELECT author_fname FROM books ORDER BY author_fname ASC;

-- Lets try and get the data in DESC order
SELECT author_fname FROM books ORDER BY author_fname DESC;

-- The ORDER BY will also works with integers
SELECT author_fname FROM books ORDER BY released_year DESC;

-- EXAMPLES --
SELECT title, released_year, pages FROM books ORDER BY released_year;

-- If we want to have the sorting order based on the attribute present in the SELECT criterio, we can add the index of the attribute based on index starting  from 1.
-- Here 2 represents released_year
SELECT title, released_year, pages FROM books ORDER BY 2;

--  Below given is very interesting example for understanding the ORDER BY
--  Here the query sorts the results in ascending order based on
--  released_year (primary sorting criterion)
--  pages (secondary sorting criterion if multiple books have the same released_year)
SELECT title, released_year, pages FROM books ORDER BY released_year, pages ASC;

-- We can use index based attributes in primary and secondary sorting criteria as well.
-- Here 2 represents released_year ( Primary Criteria ), 3 represents pages ( secondary criteria ).
SELECT title, released_year, pages FROM books ORDER BY 2, 3 DESC;