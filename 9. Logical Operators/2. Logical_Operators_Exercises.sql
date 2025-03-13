-- ------------------------------------------------------------------------------ LOGICAL OPERATORS EXERCISES -------------------------------------------------------------------- --

-- Evaluate the following
SELECT 10 != 10; -- 0
SELECT 15 > 14 && 99 - 5 <= 94; -- 1
SELECT 1 IN ( 5, 3 ) || 9 BETWEEN 8 AND 10; -- 1
SELECT 9 BETWEEN 8 AND 10; -- 1
SELECT 1 IN ( 5, 3 ); -- 0

-- Select all books written before 1980
SELECT * FROM books WHERE released_year < 1980;

-- Select all books written by Eggers or Chabon
SELECT * FROM books WHERE author_lname='Eggers' OR author_lname='Chabon';
SELECT * FROM books WHERE author_lname='Eggers' || author_lname='Chabon';
SELECT * FROM books WHERE author_lname IN ( 'Eggers', 'Chabon' );

-- Select all books written by Lahiri, published after 2000
SELECT * FROM books WHERE author_lname='Lahiri' AND released_year > 2000;
SELECT * FROM books WHERE author_lname='Lahiri' && released_year > 2000;

-- Select all books with page count between 100 and 200
SELECT * FROM books WHERE pages >= 100 AND pages <= 200;
SELECT * FROM books WHERE pages >= 100 && pages <= 200;
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

-- Select all books where author_lname starts with a 'C' or and 'S'
SELECT * FROM books WHERE author_lname LIKE 'c%' OR author_lname LIKE 'S%';
SELECT * FROM books WHERE author_lname LIKE 'c%' || author_lname LIKE 'S%';

-- If title contains 'stories' -> Short Stories
-- Just Kids and A Heartbreaking Work -> Memoir
-- Everything else -> Novel
SELECT title,
       author_lname,
       CASE
           WHEN title LIKE '%stories%' THEN 'Short Stories'
           WHEN title LIKE '%just kids%'
                OR title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
           ELSE 'Novel'
       END AS TYPE
FROM books;

-- Make this happen
-- Title author_lname COUNT
SET GLOBAL sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
SET SESSION sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));

SELECT title,
       author_lname,
       CASE
           WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), ' ', 'books')
           ELSE CONCAT(COUNT(*), ' ', 'book')
       END AS COUNT
FROM books
GROUP BY author_fname,
         author_lname
ORDER BY author_lname;