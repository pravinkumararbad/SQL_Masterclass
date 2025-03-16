-- ------------------------------------------------------------------------------ Many : Many Relationship -------------------------------------------------------------------- --
-- This a bit trickier relationship. This is also widely used relationship.
-- Some examples of Many:Many Relationship.
-- 1. Books <-> Authors
-- 2. Blog Posts <-> Tags
-- 3. Students <-> Classes

-- Now for Many:Many relationship we will be building a tv show reviewing application.
-- Basic  schema would be like below.
--  1. Reviewers: Hold the reviewers data
--  2. Series: TV Series data.
--  3. To join these tqo tables we will be using a third table which will connect reviewers and series table.

/*
+------------+---------------+
| Table Name | Column Name   |
+------------+---------------+
| Reviewers  | id            |
|            | first_name    |
|            | last_name     |
+------------+---------------+
| Series     | id            |
|            | title         |
|            | released_year |
|            | genre         |
+------------+---------------+
| Reviews    | id            |    This is called a join or union table.
|            | rating        |  
|            | series_id     |  This will be a foreign key pointing to Series.id
|            | reviewer_id   |  This will be a foreign key pointing to Reviewes.id
+------------+---------------+
*/

/*
+------------+--------------------------------------------------------------------------------------------------+
| Table Name | Columns                                                                                          |
+------------+--------------------------------------------------------------------------------------------------+
| Reviewers  | id INT PRIMARY KEY, first_name VARCHAR(255), last_name VARCHAR(255)                              |
+------------+--------------------------------------------------------------------------------------------------+
| Series     | id INT PRIMARY KEY, title VARCHAR(255), released_year INT, genre VARCHAR(100)                    |
+------------+--------------------------------------------------------------------------------------------------+
| Reviews    | id INT PRIMARY KEY, rating DECIMAL(3,1), series_id INT, reviewer_id INT,                         |
|            | FOREIGN KEY (series_id) REFERENCES Series(id), FOREIGN KEY (reviewer_id) REFERENCES Reviewers(id)|
+------------+--------------------------------------------------------------------------------------------------+
*/

-- Some sample data to understand how the data will be filled in the tables.
/*
+------------+----+------------+-----------+
| Reviewers  | id | first_name | last_name |
+------------+----+------------+-----------+
|            | 1  | John       | Doe       |
|            | 2  | Alice      | Smith     |
|            | 3  | Bob        | Johnson   |
+------------+----+------------+-----------+

+--------+----+----------------+---------------+--------------+
| Series | id | title          | released_year | genre        |
+--------+----+----------------+---------------+--------------+
|        | 1  | Dark Matter   | 2024           | Sci-Fi       |
|        | 2  | The Crown     | 2016           | Drama        |
|        | 3  | Breaking Bad  | 2008           | Crime        |
+--------+----+----------------+---------------+--------------+

+---------+----+--------+-----------+-------------+
| Reviews | id | rating | series_id | reviewer_id |
+---------+----+--------+-----------+-------------+
|         | 1  | 8.5    | 1         | 1           |
|         | 2  | 9.0    | 2         | 2           |
|         | 3  | 9.5    | 3         | 3           |
|         | 4  | 7.8    | 1         | 2           |
+---------+----+--------+-----------+-------------+
*/

