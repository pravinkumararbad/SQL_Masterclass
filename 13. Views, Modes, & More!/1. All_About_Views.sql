-- ------------------------------------------------------------------------------ What is a View? -------------------------------------------------------------------- --
-- What is a a View?
-- A view in SQL is a virtual table that is based on the result of a SQL query. It does not store data itself but provides a way to simplify complex queries and enhance security by restricting access to specific columns or rows.

-- Syntax for View. We write query as usual  and prefix CREATE statement for view as given below.
-- CREATE VIEW view_name AS SELECT column1, column2, ... FROM table_name WHERE condition;

use tv_db;
SELECT DATABASE();
SHOW TABLES;

-- ------------------------------------------------------------------------------ How to create a View? -------------------------------------------------------------------- --
-- Now, we create a view that shows only high-rated reviews (above 8.0):
-- When we execute create view command, it does not return any data but will create a VIEW in database, which we can use it as a reusable function.
CREATE VIEW HighRatedReviews AS SELECT * FROM reviews WHERE rating > 8.0;

CREATE VIEW full_reviews AS SELECT title, release_year, genre, rating, first_name, last_name FROM reviews JOIN series ON series.id = reviews.series_id JOIN reviewers ON reviewers.id = reviews.reviewer_id;

-- ------------------------------------------------------------------------------ How to find available views in the DB? -------------------------------------------------------------------- --
-- Verify the view is create and check the view.
-- SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA = 'your_database_name';
-- This command may vary based on RDBMS we are using.
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA = 'tv_db';
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA = DATABASE();
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS;

-- E.g.
-- ORACLE:
-- SELECT view_name FROM user_views;

-- SQL SERVER:
-- SELECT name FROM sys.views;
-- SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS;

-- PostgreSQL:
-- SELECT table_name FROM information_schema.views WHERE table_schema = 'public';

-- ------------------------------------------------------------------------------ How to use view? -------------------------------------------------------------------- --

-- With this we will get the result set in return for the view created.
SELECT * FROM highratedreviews;

-- We can further filter the views result using WHERE clause or any othe keywords.
SELECT * FROM highratedreviews WHERE rating > 9 ORDER BY rating;

-- Advantanges using Views.
-- Simplicity – Simplifies complex queries by storing reusable queries.
-- Security – Limits access to specific columns or rows.
-- Abstraction – Hides underlying table structure from users.
-- Data Integrity – Ensures users see consistent data without modifying the original tables.

-- Select data from full_review
SELECT * FROM full_reviews;
SELECT genre, AVG(rating) FROM full_reviews GROUP BY genre;

-- View is a virtual table for us now at our disposal whenever needed. We can use the data an also filter it as and when needed.

-- ------------------------------------------------------------------------------ How to update data from a view? -------------------------------------------------------------------- --
-- With the selections from table without using VIEW, we have access to the actual table and we can delete, or modify the data from the table.
-- Let's try, do we get the same priviledges by using VIEWs as these are virtual tables.

DELETE FROM full_reviews WHERE release_year=2010;

-- As we see from the result of the query above we get an error: Error Code: 1395. Can not delete from join view 'tv_db.full_reviews'
-- There are set of rules which all operations are possible for us to perform when we are working with the VIEWs.
-- DOC: https://dev.mysql.com/doc/refman/8.4/en/view-updatability.html [documentation link may be updated on doc portal.]

-- Very small portion of the views are eligible for data update, insert or delete.
-- For view to be updatable, there must be a one-to-one relationship between the rows in the view and the rows in the underlying table.
-- If the query on which the view is built has any of these elements then the views are not updatable.
-- Aggregate function
-- DICTINCT
-- GROUP BY
-- HAVING
-- UNION or UNION ALL
-- subquery in the SELECT list, or FROM clasue.
-- JOIN
-- Reference to non-updatable view in FROM clause., etc.

-- Let's write a simple view which does not break any of the pre-requisite conditions for the view to be updatable, insertable and deletable.
CREATE VIEW ordered_series AS SELECT * FROM series ORDER BY release_year;
SELECT * FROM ordered_series;

-- Now insert the data using view.
INSERT INTO ordered_series (title, release_year, genre) VALUES ( 'The Great', 2020, 'Comedy' );

-- The view is not a real table, now check the entry for new series is added in the VIEW and TABLE both.
SELECT * FROM ordered_series;
SELECT * FROM series;

-- Now let's try to delete the data added for series 'The Great' using view.
DELETE FROM ordered_series WHERE title='The Great';

-- Verify the entry for The Great is removed.
SELECT * FROM ordered_series;
SELECT * FROM series;

-- ------------------------------------------------------------------------------ How to ALTER/REPLACE a view? -------------------------------------------------------------------- --
-- We currently have a VIEW named ordered_series. Let's assume we made a mistake and the ORDER BY clause was set to ASC, but we need it to be in DESC order.  
-- How can we modify the VIEW to achieve this?
SELECT * FROM ordered_series;

-- Can we just rerun the query to create the viewe with same name any updated query? Let's try
CREATE VIEW ordered_series AS SELECT * FROM series ORDER BY release_year DESC;

-- We are getting the error that the veiw already exists: Error Code: 1050. Table 'ordered_series' already exists
-- We must use a new keyword REPLACE to update the view.
CREATE OR REPLACE VIEW ordered_series AS SELECT * FROM series ORDER BY release_year DESC;

-- Verify the view is updated and there is no new entry is added in views.
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS;

-- Verify the order has changed.
SELECT * FROM ordered_series;

-- As we have already seen some sessions back we have ALTER clause to make an update we can also use the same for ALTERING the VIEW.
ALTER VIEW ordered_series AS SELECT * FROM series ORDER BY release_year;

-- Verify the view is updated and there is no new entry is added in views.
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS;

-- Verify the order is again updated to be ASC based on release_year.
SELECT * FROM ordered_series;

-- ------------------------------------------------------------------------------ How to DROP a view? -------------------------------------------------------------------- --
-- Using DROP we can drop a view from DB.
DROP VIEW ordered_series;

-- Verify the ordered_series view is dropped by fetching a view or running a query using view.
-- We should get an error: Error Code: 1146. Table 'tv_db.ordered_series' doesn't exist
SELECT * FROM ordered_series;

-- See the view deleted in not available in the views list.
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS;

-- This does not mean we deleted the data from table, we just deleted the virtual table or VIEW created in the DB, so the data in the tables is safe.