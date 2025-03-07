--  Verify the correct database is selection for this section.
SELECT DATABASE();

-- ----------------------------------------------- REPLACE STRING FUNCTION -------------------------------------------- --
-- REPLACE, replaces part of string.
-- Usage REPLACE( 'Hello World', 'Hello', 'sq32&*' )

SELECT REPLACE( 'Hello World', 'Hello', 'sq32&*' ) AS replaced_string;

-- The REPLACE string function considers case sensitiveness while replacing the string.
SELECT REPLACE( 'Hello WOrld', 'o', 0 ) AS replaced_string; -- 'Hell0 WOrld'

SELECT REPLACE( 'cheese bread coffee milk', ' ', ' and ' ) AS grocessy_list;

-- Let's use books data
SELECT REPLACE( title, 'e', 3 ) AS updated_title FROM books;

-- Let's update  'a' and 'A' both with 3
SELECT REPLACE(REPLACE(title, 'a', '3'), 'A', '3') AS updated_title FROM books;

-- Let's try to combine REPLACE with CONCAT function.
-- SUBSTRING the title and then REPLACE all e from the substring with 3.
SELECT REPLACE( SUBSTRING( title, 1, 11 ), 'e', 3 ) AS updated_string FROM books;

-- REPLACE all e from the title with 3 and then creare a SUBSTRING of updated title.
SELECT SUBSTRING( REPLACE( title, 'e', 3 ), 1, 11 ) AS updated_string FROM books;