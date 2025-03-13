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
SELECT * FROM books WHERE CONCAT( author_fname, ' ', author_lname ) = 'Dave Eggers' || released_year > 2010;
SELECT * FROM books WHERE CONCAT( author_fname, ' ', author_lname ) = 'Dave Eggers' OR released_year > 2010;
SELECT * FROM books WHERE CONCAT( author_fname, ' ', author_lname ) = 'Dave Eggers' OR released_year > 2010 || stock_quantity > 100;

-- Try this:
SELECT 40 <= 100 || -2 > 0; -- 1
SELECT 10 > 5 || 5 = 5; -- 1
SELECT 'a' = 5 || 3000 > 2000; -- 1

-- --------------------------------------------------------------------------- BETWEEN OPERATOR ---------------------------------------------------------- --
-- This operator helps us select the values between lower and upper range provided.
-- Select all books published between 2004 and 2015
SELECT * FROM books WHERE released_year >= 2004 AND released_year <= 2015;

-- Achive the same usecase by using BETWEEN keyword.
SELECT * FROM books WHERE released_year BETWEEN 2004 AND 2015;

-- We can combine NOT with BETWEEN operator.
SELECT * FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year;

-- IMPORTANT NOTE: For better results when using BETWEEN with date or time values, use CAST() to explicitly convert the values to  the desired data type.
-- E.g. If we compare a DATETIME to two DATE values, convert the DATE values to DATETIME values. If we are using a string constant such as '2001-1-1' in a comparison to DATE. Cast the string to a DATE.
-- Let's check how CAST works;
SELECT CAST( '2017-05-02' AS DATETIME );
SELECT CAST( '2017-05-02 00:23:45' AS TIME );

use new_testing_db;
SELECT * FROM people WHERE birthdate BETWEEN '1980-01-01' AND '2000-01-01' ;
SELECT * FROM people WHERE birthdate BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);

-- --------------------------------------------------------------------------- IN and NOT IN OPERATOR ---------------------------------------------------------- --
-- This operator allows us to provide a set of values and then check if the given column values are in given set of vakues.
-- Select all books written by Corver or Lahiri or Smith. Now this we can anyway achieve using OR operator.
-- Using IN operator is more of a ease of redability and complexity to write.
USE book_shop;
SELECT * FROM books WHERE author_lname='Lahiri' OR author_lname='Corver' or author_lname='Smith';

-- Let's achive the same result using IN operator.
SELECT * FROM books WHERE author_lname IN ('Lahiri', 'Corver', 'Smith');
SELECT * FROM books WHERE released_year IN ( 2017, 1985 );

-- Select all book written by author other than these ('Lahiri', 'Corver', 'Smith');
SELECT * FROM books WHERE author_lname NOT IN ('Lahiri', 'Corver', 'Smith');

-- Select all books not published in 2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016
SELECT * FROM books WHERE released_year != 2000 AND released_year != 2002 AND released_year != 2004 AND released_year != 2006 AND released_year != 2008 AND released_year != 2010 AND released_year != 2012 AND released_year != 2014 AND released_year != 2016 ORDER BY released_year;

-- Let's achieve the same requirement using IN operator.
SELECT * FROM books WHERE released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016) ORDER BY released_year;

-- VERY IMPORTANT NOTE: There is still a better way to fetch the data without using IN or NOT IN operator.
-- The solution is to use % ( modulo operator ). This operator can help us know the given number is even or an odd number
-- Select all books which are released after year 2000 and are released in odd year ( 2001, 2003, etc )
SELECT * FROM books WHERE released_year >= 2000 AND released_year % 2 != 0 ORDER BY released_year;

-- --------------------------------------------------------------------------- CASE STATEMENTS ---------------------------------------------------------- --
-- In any programming language cases are used to execute some conditional statements. We can also do that in SQL as well.
-- E.g. Select columns from books showing titl, released_year, and Genre ( this is not an attribute in the database ).
-- released__year >= 2000: Modern Lit Else 20th Century Lit
SELECT title,
       released_year,
       CASE
           WHEN released_year >= 2000 THEN 'Modern Lit'
           ELSE '20th Century Lit'
       END AS GENRE
FROM books;