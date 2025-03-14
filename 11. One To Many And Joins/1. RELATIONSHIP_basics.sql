-- ------------------------------------------------------------------------------ ONE TO MANY AND JOINS -------------------------------------------------------------------- --
-- Relationships and Join.
-- So for we have been using and workign with very simple and single table data.
-- Real world data is not so simple and available entirely in a single table, information is stored in multiple tables and interrelated.

-- Lets consider the books data that were using so far. The books data we used on its own does not help with much of the operations.
-- Condiser we are running a book shop, the book shop has books data, orders data, the versions, customer data, reviews and many more to work the store operation smoothly.
-- This is where these all multiple tables hold the data in a interconnected manner.

-- ------------------------------------------------------------------------------ Relationship Basics -------------------------------------------------------------------- --
-- In this we will see in how many different ways data can be related.
-- 1. One To One Relationship
--    One to one relationship in not very common.
--    Definition: Each record in Table A is associated with one and only one record in Table B, and vice versa.
--    Setup: Include a foreign key in one of the tables that references the primary key of the other table.
--    For example: Tables users and user_profiles, where each user has a single corresponding profile.

-- E.g.
-- CREATE TABLE users (
--     user_id INT PRIMARY KEY,
--     username VARCHAR(50));
-- CREATE TABLE user_profiles (
--     profile_id INT PRIMARY KEY,
--     user_id INT UNIQUE,
--     profile_data VARCHAR(255),
--     FOREIGN KEY (user_id) REFERENCES users(user_id));

-- Output for these tables will be:
--          users                                                                       user_profiles
--  user_id ( priamry key )    user_name                    profile_id( primary key )  user_id ( foreign key )   profile_data
--     1                         Akash                               p01                       1                     abc
--     2                         Riya                                p02                       2                     def
--     3                         Ramesh                              p03                       3                     ghi

-- 2. One To Many Relationship
--    Definition: Each record in Table A can be associated with multiple records in Table B, but each record in Table B is associated with only one record in Table A.
--    Setup: Include a foreign key in the "many" side table (Table B) that references the primary key of the "one" side table (Table A).
--    For example: Tables departments and employees, where each department can have multiple employees, but each employee belongs to one department.

-- E.g.
-- CREATE TABLE departments (
--     department_id INT PRIMARY KEY,
--     department_name VARCHAR(50));
-- CREATE TABLE employees (
--     employee_id INT PRIMARY KEY,
--     employee_name VARCHAR(50),
--     department_id INT,
--     FOREIGN KEY (department_id) REFERENCES departments(department_id));

-- Output for these tables will be:
--                 Departments                                                                        Employees
-- department_id ( primary )      department_name                   employee_id( primary )    employee_name     department_id( foreign )
--          d1                      Technical                               e01                Ramesh                      d3
--          d2                      Accounts                                e02                Riya                        d1
--          d3                      PR                                      e03                Neha                        d2
--          d4                      Product Mgmt                            e04                Mayank                      d1
--                                                                          e05                Kritika                     d4
--                                                                          e06                Anuj                        d4
--                                                                          e07                Sam                         d1
--                                                                          e08                Gurpreet                    d2
-- Here for one entry from department table can have many relations with Employees table. But any entry from employees table will have only single relation with departments table entry.

-- 3. Many To Many Relationship
--    Definition: Each record in Table A can be associated with multiple records in Table B, and vice versa.
--    Setup: Create an intermediate table (also known as a junction or linking table) that contains foreign keys referencing both related tables.
--    For example: Tables students and courses, where each student can enroll in multiple courses, and each course can have multiple students.
--    For Example: Table books and authors, where each aothor can have many books and each book can be authored by multiple authors.

-- E.g.
-- CREATE TABLE students (
--     student_id INT PRIMARY KEY,
--     student_name VARCHAR(50));
-- CREATE TABLE courses (
--     course_id INT PRIMARY KEY,
--     course_name VARCHAR(50));
-- CREATE TABLE student_courses (
--     student_id INT,
--     course_id INT,
--     PRIMARY KEY (student_id, course_id),
--     FOREIGN KEY (student_id) REFERENCES students(student_id),
--     FOREIGN KEY (course_id) REFERENCES courses(course_id));

--                 Students                  courses                            student_courses
-- student_id (pri)  student_name    course_id( pi )    course_name        stduent_id          course_id
--       1           Ramesh                101            Maths                1                  101
--       2           Tina                  102            History              1                  102
--       3           Riya                  103            Comp Sci             3                  102
-- Here the table student_courses indicate both the columns being served as both primary and foreign key.
