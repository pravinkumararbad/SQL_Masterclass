-- ----------------------------------------------- REFINING SEARCH EXERCISES -------------------------------------------- --

USE book_shop;
SELECT DATABASE();

-- Select all story coillections , titles that contain stories.
SELECT * FROM books where title LIKE '%stories%';

-- Find the longest book, print out the titke and page count.
SELECT title, pages FROM books ORDER BY CHAR_LENGTH(title) DESC, pages DESC LIMIT 1;
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- Print a summary containing the title and year, for the 3 most recent books
SELECT CONCAT ( title, ' - ', released_year ) AS summary FROM books ORDER BY released_year DESC LIMIT 0, 3;
SELECT CONCAT ( title, ' - ', released_year ) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

-- Find all books with an author_lname that contains a space( " " )
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

-- Find the 3 books with the lowest stock. Select title, year, and stock
SELECT title, author_lname, stock_quantity FROM books ORDER BY 3 LIMIT 3;
SELECT title, author_lname, stock_quantity FROM books ORDER BY 3 LIMIT 0, 3;
SELECT title, author_lname, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;
SELECT title, author_lname, stock_quantity FROM books ORDER BY stock_quantity LIMIT 0, 3;

-- Print title, and author_lname, sorted first by author_lname and then by title.
SELECT title, author_lname FROM books ORDER BY 2, 1;
SELECT title, author_lname FROM books ORDER BY 2, 1 ASC;
SELECT title, author_lname FROM books ORDER BY author_lname, title;
SELECT title, author_lname FROM books ORDER BY author_lname, title ASC;

-- Sort the data alphabatically by last name with string ( MY FAVORITE AUTHOR IS < Author full name in caps >! )
SELECT CONCAT( 'MY FAVORITE AUTHOR IS ', UPPER(author_fname), ' ', UPPER(author_lname), '!' ) AS yell FROM books ORDER BY author_lname;
SELECT UPPER( CONCAT( 'MY FAVORITE AUTHOR IS ', author_fname, ' ', author_lname, '!' ) ) AS yell FROM books ORDER BY author_lname;
SELECT UPPER( CONCAT( 'my favorite author IS ', author_fname, ' ', author_lname, '!' ) ) AS yell FROM books ORDER BY author_lname;