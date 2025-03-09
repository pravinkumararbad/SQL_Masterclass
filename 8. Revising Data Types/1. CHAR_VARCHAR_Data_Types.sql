-- ------------------------------------------------------------------------------ CHAR and VARCHAR -------------------------------------------------------------------- --
-- How to store text.
-- VARCHAR, is used to store text. We already seen and used this data type.
-- There is one more data type that we can use to store data type, CHAR.
-- The only difference between VARCHAR and CHAR is CHAR fixed length.
-- CHAR ( 3 ) -- Only char text of length 3 can be added using CHAR ( 3 )

-- Let's go through the official explaination from MySQL documentation
-- The length of a CHAR column is fixed to the length that you declare when you create the table. The length can be any value from 0-255. When CHAR values a re stored, they are right padded with spaces to the specified length.
-- When CHAR values are retrieved, trailing spaces are removed unless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled.

-- What are the advantages using CHAR over VARCHAR
-- E.g. When we use some state codes, some department codes, those are of some specific length. In that case we do know the fixed length of text, it is when we use CHAR.

-- E.g.
-- Value       Char(4)     Storage     Varchar(4)     Storage
-- ''          'ab'        4 bytes     ''             1 byte
-- 'ab'        'ab  '      4 bytes     'ab'           3 bytes
-- 'abcd'      'abcd'      4 bytes     'abcd'         5 bytes
-- 'abcdefg'   'abcd'      4 bytes     'abcdefg'      5 byte

CREATE database new_testing_db;
USE new_testing_db;
SELECT database();

CREATE TABLE dogs ( name CHAR( 5 ), breed VARCHAR( 10 ) );
INSERT INTO dogs ( name, breed ) VALUES ( 'Bob', 'Beagle' );
INSERT INTO dogs ( name, breed ) VALUES ( 'Robby', 'Corgie' );
INSERT INTO dogs ( name, breed ) VALUES ( 'Princess Jane', 'Retriever' );
INSERT INTO dogs ( name, breed ) VALUES ( 'Princess Jane_1', 'Retriever_Retriever' );
SELECT * FROM dogs;