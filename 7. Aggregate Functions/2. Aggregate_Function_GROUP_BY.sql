-- ----------------------------------------------- AGGREGATE FUNCTION GROUP BY -------------------------------------------- --

-- GROUP BY is also a very important concept, and little tricky that what we have seen so far.
-- 'GROUP BY' summarizes or aggregates identical data into single rows.

USE book_shop;
SELECT DATABASE();

-- Let's go step by step to understand GROUP BY
SELECT title, author_fname, author_lname FROM books;

-- Now introduce the GROUP BY clause
-- With this we may get an error based on the mysql configuration.
-- Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'book_shop.books.title' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by

-- For time being we will update sql_mode=only_full_group_by to SET GLOBAL sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
SET GLOBAL sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
SET SESSION sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
SELECT @@GLOBAL.sql_mode, @@SESSION.sql_mode;
SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;

-- The output for the above query will be like this
-- title                                                  author_fname   author_lname
-- "The Namesake"                                         Jhumpa         Lahiri
-- "Norse Mythology"                                      eil            Gaiman
-- "A Hologram for the King: A Novel",                    ave            Eggers
-- "The Amazing Adventures of Kavalier & Clay"            Michael        Chabon
-- "Just Kids"                                            Patti          Smith
-- "What We Talk About When We Talk About Love: Stories"  Raymond        Carver
-- "White Noise"                                          Don            DeLillo
-- "Cannery Row"                                          John           Steinbeck
-- "Oblivion: Stories",                                   David          Foster Wallace
-- "10% Happier"                                          Dan            Harris
-- "Lincoln In The Bardo"                                 George         Saunders

-- With this query we will get the result of 11 rows in return, but some rows are grouped by the author_lname.
-- This will create a mega row for the author in background and will have all the book entries written by author but will only show the first book entry.
-- This is not useful for us. So improve the query now to atleast get the count of all the entries in each GROUP BY row  formed.
SELECT title, author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;

-- title                                                  author_fname   author_lname    count( * )
-- "The Namesake"                                         Jhumpa         Lahiri          2
-- "Norse Mythology"                                      eil            Gaiman          3
-- "A Hologram for the King: A Novel",                    ave            Eggers          3
-- "The Amazing Adventures of Kavalier & Clay"            Michael        Chabon          1
-- "Just Kids"                                            Patti          Smith           1
-- "What We Talk About When We Talk About Love: Stories"  Raymond        Carver          2
-- "White Noise"                                          Don            DeLillo         1
-- "Cannery Row"                                          John           Steinbeck       1
-- "Oblivion: Stories",                                   David          Foster Wallace  2
-- "10% Happier"                                          Dan            Harris          2
-- "Lincoln In The Bardo"                                 George         Saunders        1

-- This result confirms that we indeed have mumtiple entries in a column but are not visible.
-- Here the data is very inconsistant as we can check in the DB, Dan Harris only has one book and it shows count as 2.
-- As we have  grouped the data by author_lname the  query grouped Dan Harris, and Freida Harris in one row which is incorrect.
SELECT * FROM books;

-- Let's rectify that by grouping the data using author_fname, and author_lname
SELECT title, author_fname, author_lname, COUNT(*) FROM books GROUP BY author_fname, author_lname;

-- With the updated query now we have received the correct data.
-- title                                                  author_fname   author_lname    count( * )
-- "The Namesake"                                         Jhumpa         Lahiri          2
-- "Norse Mythology"                                      eil            Gaiman          3
-- "A Hologram for the King: A Novel",                    ave            Eggers          3
-- "The Amazing Adventures of Kavalier & Clay"            Michael        Chabon          1
-- "Just Kids"                                            Patti          Smith           1
-- "What We Talk About When We Talk About Love: Stories"  Raymond        Carver          2
-- "White Noise"                                          Don            DeLillo         1
-- "Cannery Row"                                          John           Steinbeck       1
-- "Oblivion: Stories",                                   David          Foster Wallace  2
-- "10% Happier"                                          Dan            Harris          1
-- "Lincoln In The Bardo"                                 George         Saunders        1
-- "fake_book"                                            Freida,        Harris          1

-- Let's GROUP the data by released_year
SELECT released_year FROM books;
SELECT released_year, COUNT( * ) FROM books GROUP BY released_year;
SELECT CONCAT( 'In ', released_year, ' ', COUNT( * ), ' book(s) released') AS year FROM books GROUP BY released_year ORDER BY released_year;