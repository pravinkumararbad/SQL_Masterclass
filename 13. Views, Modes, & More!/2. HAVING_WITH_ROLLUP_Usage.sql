-- ------------------------------------------------------------------------------ CLAUSES WHICH WORK WITH GROUP BY -------------------------------------------------------------------- --

USE tv_db;

-- ------------------------------------------------------------------------------ HAVING -------------------------------------------------------------------- --
-- The HAVING clasuse specifies a condition on groups, typically formed by the GROUP BY clause.
-- Let's run a query to get the reviews table.
select * FROM full_reviews;

-- Let's use the GROUP BY to group the selection using title.
select title, AVG(rating) AS avg_rating FROM full_reviews GROUP BY title;

-- What if my requirement is to just select title, and average of the movie reviews having atleast 1 review.
-- We quickly may think of using WHERE clasuse. This wont be useful as we are using the GROUP BY which returns me a group of data under single row.
-- The solution for this requirement would be HAVING.

select title, AVG(rating) AS avg_rating, COUNT( rating ) AS review_count FROM full_reviews GROUP BY title;
select title, AVG(rating) AS avg_rating, COUNT( rating ) AS review_count FROM full_reviews GROUP BY title HAVING count( rating ) > 1;

-- ------------------------------------------------------------------------------ WITH ROLLUP -------------------------------------------------------------------- --
-- The GROUP BY clasue permits a WITH ROLLUP modifier that causes summary output to include extra rows that represent higher-level (that is, super-aggregate) summary operations.
-- ROLLUP this enables you to answer questions at multiple levels of analysis with a single query.
-- E.g. ROLLUP can be used to provide support for OLAP ( Online Analytic Processing ) operations.

SELECT * FROM full_reviews;

-- Using aggregate function AVG or COUNT.
-- By looking at these two examples we can concluded that, these two queries are operating at two different levels.
SELECT AVG( rating ) FROM full_reviews;  -- Operating at all data.
SELECT title, AVG( rating ) FROM full_reviews GROUP BY title;  -- Operating at title group level.

-- If we take the second query and add the ROLLUP clause, remember the ROLLUP clause only works with GROUP BY.
SELECT title, AVG( rating ) FROM full_reviews GROUP BY title WITH ROLLUP;

-- The two queries seems to provide same output result set.
SELECT title, AVG( rating ) FROM full_reviews GROUP BY title;
SELECT title, AVG( rating ) FROM full_reviews GROUP BY title WITH ROLLUP;

-- On close lookup we see there is an entry with NULL title and a AVG(rating), this represents the summary statistics, summary average rating of entire table.
-- NULL, '8.02553'

-- Let's try another examples.
SELECT title, COUNT( rating ) FROM full_reviews GROUP BY title WITH ROLLUP;
-- NULL, '47'

-- NOTE:
-- Did you notice something, the output changes with respect to the Aggregate function being used for COUNT it summed all the rating count, for average it it provided the average rating.

-- What if we GROUP the data with multiple GROUP BY clasuses, then it becomes tricky.
SELECT release_year, AVG(rating) FROM full_reviews GROUP BY release_year;
SELECT release_year, AVG(rating) FROM full_reviews GROUP BY release_year WITH ROLLUP;

SELECT release_year, AVG(rating), genre FROM full_reviews GROUP BY release_year, genre;
SELECT release_year, AVG(rating), genre FROM full_reviews GROUP BY release_year, genre WITH ROLLUP;

-- This query with multiple GROUP BY, does not just give us the average rating of the release_year, and genre combination, but also provides the average rating of all genres in the given release year.

-- IMP NOTE:
-- There are many more things that we can do, we can replace the NULL with some identifies, there is special function called GROUPING.
SELECT 
    release_year, 
    COALESCE(genre, 'Summary Average') AS genre, 
    AVG(rating) 
FROM full_reviews 
GROUP BY release_year, genre WITH ROLLUP;

SELECT 
    release_year, 
    CASE 
        WHEN GROUPING(genre) = 1 THEN 'Summary Average' 
        ELSE genre 
    END AS genre,
    AVG(rating) AS avg_rating
FROM full_reviews 
GROUP BY release_year, genre WITH ROLLUP;

-- Use COALESCE() if you just need to replace NULL with a default value.
-- Use GROUPING() if you need to differentiate between subtotal rows and a grand total.
SELECT 
    CASE 
        WHEN GROUPING(release_year) = 1 AND GROUPING(genre) = 1 THEN 'Grand Total'
        WHEN GROUPING(genre) = 1 THEN 'Summary Average'
        ELSE CAST(release_year AS CHAR)  -- Convert year to string for uniform output
    END AS release_year,
    COALESCE(genre, 'Summary Average') AS genre,
    AVG(rating) AS avg_rating
FROM full_reviews 
GROUP BY release_year, genre WITH ROLLUP;