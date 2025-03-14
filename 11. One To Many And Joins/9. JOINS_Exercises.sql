-- ---------------------------------------------------------------------------------- JOINS EXERCISES ------------------------------------------------------------------------ --
-- Write a schema:
-- Students: id ( primary key ), first_name
-- Papers: title, grade, student_id ( foreign key )

CREATE DATABASE joins_exercises;
USE joins_exercises;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR( 50 )
);

CREATE TABLE papers (
    title VARCHAR(50),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

SHOW COLUMNS FROM students;
DESC papers;

-- INSERT some data in the tables.
INSERT INTO students ( first_name ) VALUES ( 'Caleb' ), ( 'Samantha' ), ( 'Raj' ),  ( 'Carlos' ),  ( 'Lisa' );
INSERT INTO papers ( student_id, title, grade )
VALUES ( 1, 'My First Book Report', 60 ),
       ( 1, 'My Second Book Report', 75 ),
       ( 2, 'Russian Lit Through The Ages', 94 ),
       ( 2, 'De Montaigne and The Art of The Essay', 98 ),
       ( 4, 'Borges and Magical Realism', 89 );

-- Print the data using INNER JOIN
SELECT first_name, title, grade FROM papers JOIN students ON papers.student_id = students.id;
SELECT first_name, title, grade FROM papers INNER JOIN students ON papers.student_id = students.id;
SELECT first_name, title, grade FROM papers LEFT JOIN students ON papers.student_id = students.id;

-- Print all irrespective of paper title.
SELECT first_name, title, grade FROM papers RIGHT JOIN students ON papers.student_id = students.id;
SELECT first_name, title, grade FROM students LEFT JOIN papers ON papers.student_id = students.id;

-- Print all irrespective of paper title. Just make one modification if the value is NULL for string update to Missing, and for INT update it to 0.
-- Hint: Use IFNULL method.
SELECT first_name, IFNULL(title, 'MISSING') AS title, IFNULL(grade, 0) AS grades FROM papers RIGHT JOIN students ON papers.student_id = students.id;
SELECT first_name, IFNULL(title, 'MISSING') AS title, IFNULL(grade, 0) AS grades FROM students LEFT JOIN papers ON papers.student_id = students.id;

-- PRINT first_name and average_grade
SELECT first_name, IFNULL( AVG( grade ), 0 ) AS average FROM papers RIGHT JOIN students ON papers.student_id = students.id GROUP BY first_name ORDER BY average DESC;
SELECT first_name, IFNULL( AVG( grade ), 0 ) AS average FROM students LEFT JOIN papers ON papers.student_id = students.id GROUP BY first_name ORDER BY average DESC;

-- PRINT first_name, average_grade and passing_state. Passing score is above 75.
SELECT first_name, IFNULL( AVG( grade ), 0 ) AS average, 
    CASE
         WHEN IFNULL( AVG( grade ), 0 ) < 76 THEN 'FAILING'
         ELSE 'PASSING'
	 END AS passing_state
FROM papers RIGHT JOIN students ON papers.student_id = students.id GROUP BY first_name ORDER BY average DESC;

-- PRINT first_name, average_grade and passing_state. Passing score is above 75. But make sure only show the result for NOT NULL values.
SELECT first_name, IFNULL( AVG( grade ), 0 ) AS average, 
    CASE
         WHEN AVG(grade) < 76 THEN 'FAILING'
         ELSE 'PASSING'
	 END AS passing_state
FROM papers JOIN students ON papers.student_id = students.id GROUP BY first_name ORDER BY average DESC;