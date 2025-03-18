-- ------------------------------------------------------------------------------ SQL MODES -------------------------------------------------------------------- --
-- SQL MODES are basically settings. This changes the behavior and validations of the SQL.

-- ------------------------------------------------------------------------------ VIEWING SQL MODES -------------------------------------------------------------------- --
-- We have two kind of modes, GLOBAL and SESSION, we can change the settings for the current session, or for all users for all sessions globally.
-- If we have not touched any settings as of now, both the values will be same.

SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

-- ------------------------------------------------------------------------------ HOW TO UPDATE SQL MODES -------------------------------------------------------------------- --
-- SET GLOBAL sql_mode = <'modes'>;

-- We will be only updating session setting, as these will be valid for the session being run and wont affect the global settings.
-- SET SESSION sql_mode = <'modes'>;

-- Below is the current setting we have in session as well as in global mode.
-- STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION

-- We will be updating sessing setting by removing the 'ERROR_FOR_DIVISION_BY_ZERO.
-- Let's try what happens if we have this setting in place.
SELECT 59/0; -- NULL
SHOW WARNINGS; -- This will show the warning abot the division by 0.
SHOW ERRORS;

-- Let's update the setting and try.
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
SHOW WARNINGS;

SELECT 59/0;
SHOW WARNINGS; -- Now we wont see any warning as we have set the session mode ommiting ERROR_FOR_DIVISION_BY_ZERO setting.

-- ------------------------------------------------------------------------------ STRICT TRANS TABLE SQL MODES -------------------------------------------------------------------- --
-- This means STRICT TRANSACTIONAL TABLE.
-- This mode should be enabled by default. Let's check.
SELECT @@GLOBAL.sql_mode;

-- What does this STRICT TRANS TABLE mode mean.
-- Strict mode controls how MySQL handles invalid or missing values in data-change statements such as INSERT or UPDATE. A value can be invalid for several reasons.
-- E.g., it might have the wrong data type for the column, or it might be out of range, etc.
-- Strict mode also affects DDL statements such as CREATE TABLE.
SELECT @@SESSION.sql_mode;

use tv_db;
DESC reviews;
--  Field         Type            Null    Key   Default  Extra
-- ---------------------------------------------------------------------- --
-- 'id'           'int'           'NO',  'PRI'   NULL    'auto_increment'
-- 'rating'       'decimal(3,1)'  'NO',  ''      NULL    ''
-- 'series_id'    'int'           'NO'   'MUL'   NULL    ''
-- 'reviewer_id'  'int'           'NO'   'MUL'   NULL    ''

-- Lets try an incorrect statement by inserting a string for the rating field of integer.
-- We should get an error and we do, Error Code: 1366. Incorrect decimal value: 'Hi' for column 'rating' at row 1
INSERT INTO reviews ( rating ) VALUES ('Hi');

-- If we turn the sql mode STRICT TRANS TABLE off let's see what happens.
SET session sql_mode='';
SELECT @@SESSION.sql_mode;
INSERT INTO reviews ( rating ) VALUES ('Hi');

-- As we updated the reviews table if we check the value, it does not insert the field with 'Hi' but the default value for rating that is 0.0