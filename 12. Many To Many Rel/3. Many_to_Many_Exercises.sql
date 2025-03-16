-- ------------------------------------------------------------------------------ TV Series Challenge #1 -------------------------------------------------------------------- --
use tv_db;
SELECT DATABASE();

-- Select title, and all review placed on that series title.
-- Let's go step by step how we can fetch the data using join.

-- First select and print all the titles from series.
SELECT title FROM series;

-- Now next thing we need is rating, rating is coming from the ratings table.
SELECT rating FROM reviews;

-- Now let's try and find out attribute on which we can perform join.
SELECT * FROM reviews;

-- Now from the last query result we know, we want to match the series_id for each rating which matches with the id of series table.
-- This is because the series_id from reviews tables is a FOREIGN KEY and references series.id.
-- We want a overlap so we need not worry about RIGHT or LEFT JOIN.
SELECT title, rating FROM series JOIN reviews ON series.id = reviews.series_id;

-- ------------------------------------------------------------------------------ TV Series Challenge #2 -------------------------------------------------------------------- --
-- Average rating for each of our TV series from series table, and sort it based on the average rating.
SELECT title, AVG(rating) AS avg_rating FROM series JOIN reviews ON series.id = reviews.series_id GROUP BY title ORDER BY avg_rating;

-- There are some functions to round the diven decimal like FLOOR, CEIL, ROUND, etc.
-- FLOOR: Rounds the given DECIMAL, FLOAT, DOUBLE to the next highest whole value.
-- E.g.:
SELECT FLOOR( 10.5497); -- 10

-- CEIL: Rounds the given DECIMAL, FLOAT, DOUBLE to the previous whole value.
-- E.g.:
SELECT CEIL( 10.5497); -- 11

-- ROUND: Rounds off the number to the closest whole number.
-- E.g.:
SELECT ROUND( 10.5497); -- 11
SELECT ROUND( 10.4997); -- 10

-- With ROUND( DECIMAL, INT ): Rounds off the number to decimal points provided by INT and not to whole number.
--  E.g.:
SELECT ROUND( 10.5497, 2 ); -- 10.55

-- Let's make the output more precise by using ROUND
SELECT title, ROUND( AVG(rating), 2 ) AS avg_rating FROM series JOIN reviews ON series.id = reviews.series_id GROUP BY title ORDER BY avg_rating;

-- ------------------------------------------------------------------------------ TV Series Challenge #3 -------------------------------------------------------------------- --
-- Select the first, and last name of the reviewers with any review rating that they have provided.
-- Lets go step by step. Select first and last name of all the reviewers.
SELECT first_name, last_name FROM reviewers;

-- Now next thing we need is rating, rating is coming from the ratings table.
SELECT rating FROM reviews;

-- Now let's try and find out attribute on which we can perform join.
SELECT * FROM reviews;

-- Now from the last query result we know, we want to match the reviewer_id for each rating which matches with the id of reviewers table.
-- This is because the reviewer_id from reviews tables is a FOREIGN KEY and references reviewers.id.
-- We want a overlap so we need not worry about RIGHT or LEFT JOIN.

-- Lets print commplete table, and then select only required columns.
SELECT * FROM reviewers JOIN reviews ON reviews.reviewer_id = reviewers.id;
SELECT first_name, last_name, rating FROM reviewers JOIN reviews ON reviews.reviewer_id = reviewers.id;

-- ------------------------------------------------------------------------------ TV Series Challenge #4 -------------------------------------------------------------------- --
-- Identify the series which has no reviews.
-- Lets try using JOIN to find the data using INNER JOIN, here in response we will find the data where the series.id and reviews.series_id matches. This is not our requirement.
SELECT * FROM series JOIN reviews ON series.id = (reviews.series_id);

-- What can we do now?
-- When we are selecting data FROM series, series is considered as the LEFT TABLE. If we JOIN tables using LEFT JOIN we will get all the series data.
-- Let's try the query.
SELECT * FROM series LEFT JOIN reviews ON series.id = (reviews.series_id);

-- After inspecting the data we see some of the series insatnces has NULL rating.
-- We have our answer we want only the series which has not been yet reviewed.
SELECT * FROM series LEFT JOIN reviews ON series.id = reviews.series_id WHERE reviews.rating IS NULL;

-- Let's filter the columns which are not required.
SELECT title AS unreviewed_series FROM series LEFT JOIN reviews ON series.id = reviews.series_id WHERE reviews.rating IS NULL;

-- Let's try same solution using RIGHT JOIN
SELECT title AS unreviewed_series FROM reviews RIGHT JOIN series ON series.id = reviews.series_id WHERE reviews.rating IS NULL;

-- ------------------------------------------------------------------------------ TV Series Challenge #5 -------------------------------------------------------------------- --
-- Select the genres and find the average rating for each genre.
SELECT genre, AVG( rating ) avg_rating FROM series JOIN reviews ON reviews.series_id = series.id GROUP BY genre ORDER BY avg_rating DESC;

-- ------------------------------------------------------------------------------ TV Series Challenge #6 -------------------------------------------------------------------- --
-- Select and print each reviewer name, no of review counts, min and max review rating, average rating, and status ( if reviewer placed a review then status active else inactive )
SELECT first_name, last_name, COUNT(rating) AS COUNT, MIN( rating ), MAX( rating ), AVG( rating ) FROM reviews RIGHT JOIN reviewers ON reviewers.id = reviews.reviewer_id GROUP BY first_name, last_name;

SELECT first_name,
       last_name,
       COUNT(rating) AS COUNT,
       MIN(rating),
       MAX(rating),
       AVG(rating),
       CASE
           WHEN COUNT(rating) > 0 THEN "ACTIVE"
           ELSE "INACTIVE"
       END AS STATUS
FROM reviews
RIGHT JOIN reviewers ON reviewers.id = reviews.reviewer_id
GROUP BY first_name,
         last_name;
         
-- Let's beautify the result.
SELECT first_name,
       last_name,
       COUNT(rating) AS COUNT,
       IFNULL ( MIN(rating), 0 ) AS min_rating,
       IFNULL ( MAX(rating), 0 ) AS max_rating,
       IFNULL ( ROUND( AVG(rating), 2 ), 0 ) AS avg_rating,
       CASE
           WHEN COUNT(rating) > 0 THEN "ACTIVE"
           ELSE "INACTIVE"
       END AS status
FROM reviews
RIGHT JOIN reviewers ON reviewers.id = reviews.reviewer_id
GROUP BY first_name,
         last_name;

-- We have used case for determining the status of the reviewer. This is good when we have multiple cases/conditions to check.
-- But for the scenario we have where only only check one condition/case and fall to else, we have easier option to achieve it.
-- Let's see that.
SELECT first_name,
       last_name,
       COUNT(rating) AS COUNT,
       IFNULL ( MIN(rating), 0 ) AS min_rating,
       IFNULL ( MAX(rating), 0 ) AS max_rating,
       IFNULL ( ROUND( AVG(rating), 2 ), 0 ) AS avg_rating,
       IF( count( rating ) > 0, 'ACTIVE', 'INACTIVE' ) AS rating
FROM reviews
RIGHT JOIN reviewers ON reviewers.id = reviews.reviewer_id
GROUP BY first_name,
         last_name;
         
-- With CASE we will get flexibility.
SELECT first_name,
       last_name,
       COUNT(rating) AS COUNT,
       IFNULL ( MIN(rating), 0 ) AS min_rating,
       IFNULL ( MAX(rating), 0 ) AS max_rating,
       IFNULL ( ROUND( AVG(rating), 2 ), 0 ) AS avg_rating,
       CASE
           WHEN COUNT(rating) >= 10 THEN "POWERHOUSE"
           WHEN COUNT(rating) > 0 THEN "ACTIVE"
           ELSE "INACTIVE"
       END AS status
FROM reviews
RIGHT JOIN reviewers ON reviewers.id = reviews.reviewer_id
GROUP BY first_name,
         last_name;

-- ------------------------------------------------------------------------------ TV Series Challenge #7 -------------------------------------------------------------------- --
-- Get the output like title, rating, reviewer
-- Let't join all the 3 tables using JOIN and see if we are able to get all the data in return.
SELECT * FROM reviews JOIN reviewers ON reviewers.id = reviews.reviewer_id JOIN series ON reviews.series_id = series.id;

-- Now that we have joined all the 3 tables, just try and select the required data title, rating, reviewer_fullname
SELECT title, rating, CONCAT( first_name, ' ', last_name ) FROM reviews JOIN reviewers ON reviewers.id = reviews.reviewer_id JOIN series ON reviews.series_id = series.id;

-- What if we want to print the ids of series and reviewer.
-- If we execute belkow query we can conclude  we are getting multiple columns for id in return.
SELECT * FROM reviews JOIN reviewers ON reviewers.id = reviews.reviewer_id JOIN series ON reviews.series_id = series.id;

-- Due to the ambiguity while selecting id column we will face an error how to tackle this?
-- We can use the table name prefixed while in selecting the attributes as well.
SELECT series.id, title, rating, CONCAT( first_name, ' ', last_name ) AS reviewer_fullname FROM reviews JOIN reviewers ON reviewers.id = reviews.reviewer_id JOIN series ON reviews.series_id = series.id;

-- If we want to make the table names shorter for ease of writing query we can use aliases for tables as well.
SELECT sr.id, title, rating, CONCAT( first_name, ' ', last_name ) AS reviewer_fullname FROM reviews JOIN reviewers ON reviewers.id = reviews.reviewer_id JOIN series AS sr ON reviews.series_id = sr.id;