-- ------------------------------------------------------------------------------ EXERCISES ON DATA TYPES -------------------------------------------------------------------- --
USE new_testing_db;

-- What's a good case for CHAR
CREATE TABLE states_and_capitals ( state_code CHAR( 2 ), capital VARCHAR( 50 ) );

-- Fill in the blanks here
-- CREATE TABLE inventory (item_name _______, price _________, quantity ________ );
-- NOTE: price is alwats < 1000000
CREATE TABLE inventory (item_name VARCHAR( 50 ), price DECIMAL( 8,2 ), quantity INT );

-- Print out the current time
SELECT CURRENT_TIME;
SELECT CURTIME();
SELECT CURRENT_TIME();

-- Print out the current day of the week.
SELECT DAYNAME( NOW() );
SELECT DAYOFWEEK( NOW() );
SELECT DAYOFWEEK( CURDATE() );
SELECT DAYOFWEEK( CURRENT_DATE );
SELECT DATE_FORMAT( now(), '%w' );

-- Print out current day and time using format mm/dd/yyyy
SELECT DATE_FORMAT( NOW(), '%m/%d/%Y' );
SELECT DATE_FORMAT( CURDATE(), '%m/%d/%Y' );
SELECT DATE_FORMAT( CURRENT_DATE, '%m/%d/%Y' );

-- Print out the current day and time using format. 'March 11th at 23:27'
SELECT DATE_FORMAT( NOW(), '%M %D at %H:%i' );

-- Create a tweets table taht stores, tweet_content, a username, time it was created, and last_update.
CREATE TABLE tweets( tweet_content CHAR( 140 ), username CHAR( 30 ), tweet_created TIMESTAMP DEFAULT NOW(), tweet_updated TIMESTAMP DEFAULT NOW() ON UPDATE NOW() );
INSERT INTO tweets ( tweet_content, username ) VALUES ( 'This is my first tweet!', 'pharbad' );
SELECT * FROM tweets;
-- 'This is my first tweet!', 'pharbad', '2025-03-11 23:31:02', '2025-03-11 23:31:02'

UPDATE tweets SET tweet_content='Updating my first tweet.' WHERE tweet_content='This is my first tweet!';
SELECT * FROM tweets;
-- 'Updating my first tweet.', 'pharbad', '2025-03-11 23:31:02', '2025-03-11 23:32:17'
