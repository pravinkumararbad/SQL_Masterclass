-- ------------------------------------------------------------------------------ NOT EQUAL (!=) OPERATOR -------------------------------------------------------------------- --
USE book_shop;

-- SELECT books released exactly in released_year=2017
SELECT title, released_year FROM books WHERE released_year=2017;

-- SELECT books did not release in released_year=2017
SELECT title, released_year FROM books WHERE released_year!=2017;

-- SELECT books with author_name Harris
SELECT title, author_lname FROM books WHERE author_lname='Harris';

-- SELECT books from authors which do not have last name Harris
SELECT title, author_lname FROM books WHERE author_lname!='Harris';

-- ----------------------------------------------------------------------------------- NOT LIKE OPERATOR -------------------------------------------------------------------- --
-- Example for LIKE
SELECT title FROM books WHERE title LIKE 'w%';

-- Let's test what is NOT LIKE
-- SELECT all book titles which do not start with letter 'w'
SELECT title FROM books WHERE title NOT LIKE 'w%';

-- -------------------------------------------------------------------------------- GREATER THAN ( > ) OPERATOR -------------------------------------------------------------- --
-- Select all books released after year 2000
SELECT * FROM books WHERE released_year > 2000 ORDER BY released_year ;

-- --------------------------------------------------------------------------- GREATER THAN OR EQUAL TO( >= ) OPERATOR ---------------------------------------------------------- --
-- Select all books  released on and after 2000
SELECT * FROM books WHERE released_year >= 2000;

-- Select the books which has books quantity greater than or  equal to 100
SELECT * FROM books WHERE stock_quantity >= 100;

-- IMPORTANT NOTE: What do we expect?
SELECT 99 > 1; -- This returns boolean value in integer form for TRUE ( 1 )
SELECT 99 < 1; -- This returns boolean value in integer form for FALSE ( 0 )

-- Try these:
SELECT 100 > 5; -- 1
SELECT -15 > 15; -- 0
SELECT 9 > -10; -- 1
SELECT 1 > 1; -- 0
SELECT 1 >= 1; -- 1
SELECT 'a' > 'b'; -- 0
SELECT 'a' < 'b'; -- 1
SELECT 'A' > 'a'; -- 0
SELECT 'A' < 'a'; -- 0
SELECT 'A' >= 'a'; -- 1 This might feel surprising if youe are coming from any programming language. As SQL is not case sensitive A and a is same.
-- Important NOTE: Case in string comparison does not matter in SQL.

-- -------------------------------------------------------------------------------- LESS THAN ( < ) OPERATOR -------------------------------------------------------------- --
-- SELECT books released before the year 2000
SELECT * FROM books WHERE released_year < 2000;

-- --------------------------------------------------------------------------- LESS THAN OR EQUAL TO( <= ) OPERATOR ---------------------------------------------------------- --
-- SELECT books released on or before 2000
SELECT * FROM books WHERE released_year <= 2000;

-- Try these:
SELECT 3 < -10; -- 0
SELECT -10 < -9; -- 1
SELECT 42 <= 42; -- 1
SELECT 'h' < 'p'; -- 1
SELECT 'Q' <= 'q'; -- 1

-- --------------------------------------------------------------------------- LOGICAL AND ( && ) OPERATOR ---------------------------------------------------------- --
-- SELECT books written by Dave Eggers published after the year 2010
SELECT * FROM books WHERE CONCAT( author_fname, ' ', author_lname ) = 'Dave Eggers' && released_year>2010;

-- We and also use keyword AND for Logical And Operator.
SELECT * FROM books WHERE CONCAT( author_fname, ' ', author_lname ) = 'Dave Eggers' AND released_year>2010;

-- Try this:
SELECT 1 < 5 AND 7 = 9; -- 0
SELECT 1 < 5 && 7 = 9; -- 0
SELECT -10 > -20 && 0 <= 0; -- 1
SELECT 54 <= 54 AND 'a' = 'A'; -- 1

SELECT * FROM books WHERE author_lname='Eggers' AND released_year > 2010 AND title LIKE '%novel%';

-- --------------------------------------------------------------------------- LOGICAL OR ( || ) OPERATOR ---------------------------------------------------------- --