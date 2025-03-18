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