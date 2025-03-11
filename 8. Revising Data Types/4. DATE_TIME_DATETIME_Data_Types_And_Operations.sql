-- ------------------------------------------------------------------------------ DATE, TIME and DATETIME -------------------------------------------------------------------- --
-- DATE data type only stores the date and not time.
-- The format in which the data stored is 'YYYY-MM-DD'.
-- This data type is used for storing a date. E.g. Birth Date, Marriage Date, Joining Date, etc.

-- DATE data type only stores the time only and not date.
-- The format in which the datre stored in 'HH:MM:SS'.

-- DATETIME data type stores both date and time.
-- The format in which the data stored is 'YYYY-MM-DD HH:MM:SS'.
-- This data type is used for storing data like, when someone checked in the system, when someone commented on the post etc.

-- DATETIME is the most versatile among these 3 data types.

-- Let's create our own  DATE data.
USE new_testing_db;
SELECT database();

CREATE TABLE people ( name VARCHAR( 50 ), birthdate DATE, birthtime TIME, birthdt DATETIME );
INSERT INTO people ( name, birthdate, birthtime, birthdt ) VALUES ( 'Pravin', '1998-03-12', '21:43:23', '1998-03-12 21:43:23' );
INSERT INTO people ( name, birthdate, birthtime, birthdt ) VALUES ( 'Larry', '1994-02-13', '04:10:42', '1994-02-13 04:10:42' );
SELECT * FROM people;

-- ------------------------------------------------------------------------------ CURDATE(), CURTIME(), and NOW() FUNCTIONS -------------------------------------------------------------------- --
-- CURDATE(): Gives us current date.
-- CURTIME(): Gives us current time.
-- NOW(): Gives us current date-time.

INSERT INTO people ( name, birthdate, birthtime, birthdt ) VALUES ( 'Toaster', CURDATE(), CURTIME(), NOW() );
INSERT INTO people ( name, birthdate, birthtime, birthdt ) VALUES ( 'Microwave', CURRENT_DATE, CURRENT_TIME, NOW() );
SELECT * FROM people;
DELETE FROM people WHERE name='Microwave';
SELECT * FROM people;

-- Functions and constants to return us the current date.
SELECT CURRENT_DATE;
SELECT CURDATE() AS CURRENTDATE;

-- Functions and constants to return us the current time.
SELECT CURRENT_TIME;
SELECT CURTIME() AS CURRENTTIME;

-- Functions and constants to return us the current datetime.
SELECT NOW() AS DATETIME;

-- ------------------------------------------------------------------------------ FORMATTING DATE -------------------------------------------------------------------- --
-- There are a lot of DATE and TIME functions on MySQL documentation if we need something we can just to documentation whenever needed.
-- https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html ( May be updated on documentation site of not able to reach the site, please Google it. )

SELECT name, birthdate FROM people;

-- DAY()
SELECT name, birthdate, DAY( birthdate ) FROM people;

-- DAYNAME()
SELECT name, birthdate, DAYNAME( birthdate ) FROM people;

-- DAYOFWEEK
SELECT name, birthdate, DAYOFWEEK( birthdate ) FROM people;

-- DAYOFYEAR
SELECT name, birthdate, DAYOFYEAR( birthdate ) FROM people;

-- MONTHNAME
SELECT name, birthdate, MONTHNAME( birthdate ) FROM people;

-- When we use these methods on the birthtime, we do get the warning and the result returns NULL / arbitrary value. Try running below command to be sure
SELECT name, birthtime, DAY( birthtime ) FROM people;
SELECT name, birthtime, DAYNAME( birthtime ) FROM people;
SELECT name, birthtime, DAYOFWEEK( birthtime ) FROM people;
SELECT name, birthtime, DAYOFYEAR( birthtime ) FROM people;


-- All these methods do work on DATETIME. Try running below queries to verify.
SELECT name, birthdt, DAY( birthdt ) FROM people;
SELECT name, birthdt, DAYNAME( birthdt ) FROM people;
SELECT name, birthdt, DAYOFWEEK( birthdt ) FROM people;
SELECT name, birthdt, DAYOFYEAR( birthdt ) FROM people;
SELECT name, birthdt, MONTHNAME( birthdt ) FROM people;

-- Let's try out some functions which work with TIME.
-- HOUR
SELECT name, birthtime, HOUR( birthtime ) FROM people;

-- MINUTE
SELECT name, birthtime, MINUTE( birthtime ) FROM people;

-- SECOND
SELECT name, birthtime, SECOND( birthtime ) FROM people;

-- Use the methods just discussed and achieve this: "April 21 2017 06 PM"
-- There is a better way to achieve this, but let's try and use what we know so far.
-- 2017-04-21
SELECT CONCAT( MONTHNAME( '2017-04-21' ), ' ', DAYOFMONTH( '2017-04-21' ), ' ', YEAR( '2017-04-21' ), ' ', HOUR( '06:00:00' ), ' PM.') AS my_date_format;
SELECT CONCAT( MONTHNAME( birthdt ), ' ', DAYOFMONTH( birthdate ), ' ', YEAR( birthdate ), ' ', HOUR( birthtime ) ) AS my_date_format FROM people;

-- How we can achive the result for formatting date? There is a function to achiev that, it is called DATE_FORMAT( DATE, format )
-- https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-format
-- We provide 2 arguments to the DATE_FORMAT methods, first argument being date, and second parameter is format specifier.
SELECT DATE_FORMAT( birthdate, '%W %M %Y' ) FROM people;
SELECT DATE_FORMAT( birthdate, '%W-%M-%Y' ) FROM people;
SELECT DATE_FORMAT( birthdate, '%W%M%Y' ) FROM people;

SELECT DATE_FORMAT( birthdt, 'Was born on a %D, the day was %W' ) FROM people;
SELECT DATE_FORMAT( birthdt, '%m/%d/%y' ) FROM people; -- '03/12/98'
SELECT DATE_FORMAT( birthdt, '%m/%d/%Y' ) FROM people; -- '03/12/1998'

-- There is something called time formatter as well, this also works in a similar manner.
SELECT DATE_FORMAT( birthdt, '%m/%d/%Y at %h:%m' ) FROM people; -- '03/12/1998 at 09:03'

-- ------------------------------------------------------------------------------ DATE ARITHMETIC -------------------------------------------------------------------- --
-- For date arithmetic we are going through some of the methods provided my MySQL.

-- DATEDIFF( expr1, expr2 ): Return the number of days
SELECT * FROM people;
SELECT DATEDIFF( NOW(), birthdate ) FROM people;
SELECT name, birthdate, DATEDIFF( CURDATE(), birthdate ) FROM people;

-- DATE_ADD( date/datetime, INTERVAL, temporal INTERVAL expression ) / DATE_SUB( date/datetime, INTERVAL, temporal interval expression )
-- Temporal Interval Expression: https://dev.mysql.com/doc/refman/8.4/en/expressions.html#temporal-intervals
SELECT name, birthdt, DATE_ADD( birthdt, INTERVAL 1 MONTH ) FROM people;
SELECT name, birthdt, DATE_ADD( birthdt, INTERVAL 10 SECOND ) FROM people;
SELECT name, birthdt, DATE_ADD( birthdt, INTERVAL 3 QUARTER ) FROM people;

-- +/-: Instead of DATE_ADD or DATE_SUB we can use +/-
SELECT name, birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT name, birthdt, birthdt - INTERVAL 5 MONTH FROM people;

-- We can not combile mulltiple add/remove suppose for month and time at one go in DATE_ADD or DATE_SUB.
-- This can be achieve by +/-. Refer example below.
SELECT name, birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 SECOND FROM people;
SELECT name, birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

-- ------------------------------------------------------------------------------ WORKING WITH TIMESTAMPS -------------------------------------------------------------------- --
-- Timestamps are referred to maintain time when we do something.
-- TIMESTAMP is also a datatype in SQL

-- Let's compare DATETIME and TIMESTAMP:
-- DATETIME and TIMESTAMP are both used for values that contain both date and time parts.
-- The main difference comes when we discuss on the range this data type supports.
-- DATETIME: 1000-01-01 00:00:00 to 9999-12-31 23:59:59
-- TIMESTAMP: 1970-01-01 00:00:01 to 2038-01-19 03:14:07

CREATE TABLE comments ( content VARCHAR( 100 ), created_at TIMESTAMP DEFAULT NOW() );
-- What is DEFAULT: We do not have to manually update the values while adding a new record as this will be taking the value of NOW time by default.

INSERT INTO comments ( content ) VALUES ( 'LOL! This is so funny.' );
INSERT INTO comments ( content ) VALUES ( 'I found this interesting.' );

SELECT * FROM comments;

INSERT INTO comments ( content ) VALUES ( 'nljkasdbjvbasD.' );
SELECT * FROM comments ORDER BY created_at DESC;

-- There is an interesting keyword we are introducing now ON UPDATE
-- When the row/content is changed update the created_at TIMESTAMP.
-- CREATE TABLE comments2 ( content VARCHAR( 100 ), created_at INT DEFAULT 1 ON UPDATE 2 );

CREATE TABLE comments2 ( content VARCHAR( 100 ), created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP );
INSERT INTO comments2 ( content ) VALUES ( 'LOL! This is so funny.' );
INSERT INTO comments2 ( content ) VALUES ( 'Add an entry for example.' );

SELECT * FROM comments2;
-- content                       created_at
-- 'LOL! This is so funny.'     '2025-03-11 23:06:36'
-- 'Add an entry for example.'  '2025-03-11 23:06:37'

-- Let's update an entry, this will update the created_at value as we are using ON UPDATE.
UPDATE comments2 SET content='Alas! This is so sad.' WHERE content='LOL! This is so funny.';
SELECT * FROM comments2;

-- content                       created_at
-- 'Alas! This is so sad.'      '2025-03-11 23:09:44'
-- 'Add an entry for example.'  '2025-03-11 23:06:37'

-- Let's try one more example.
CREATE TABLE comments3 ( content VARCHAR( 100 ), created_at TIMESTAMP DEFAULT NOW(), last_updated TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP );
INSERT INTO comments3 ( content ) VALUES ( 'LOL! This is so funny.' );
INSERT INTO comments3 ( content ) VALUES ( 'Add an entry for example.' );

SELECT * FROM comments3;
-- 'LOL! This is so funny.      '2025-03-11 23:11:50'  '2025-03-11 23:11:50'
-- 'Add an entry for example.'  '2025-03-11 23:12:00'  '2025-03-11 23:12:00'


UPDATE comments3 SET content='Alas! This is so sad.' WHERE content='LOL! This is so funny.';
SELECT * FROM comments3;
-- 'LOL! This is so funny.      '2025-03-11 23:11:50'  '2025-03-11 23:12:58'
-- 'Add an entry for example.'  '2025-03-11 23:12:00'  '2025-03-11 23:12:00'