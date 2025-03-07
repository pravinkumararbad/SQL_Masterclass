-- Let's refine the selected data from the query.
-- What do we mean by refining the data. Refining is being specific by sorting the data, limit the queried data, get the unique data from the query.

-- Make sure we are working with correct database.
SELECT DATABASE();

-- Before going ahead lets add some more data in the book_shop DB, in books table for this section.
INSERT INTO books(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
       ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
       ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- Verify that the data is inserted correctly.
SELECT * FROM books;
