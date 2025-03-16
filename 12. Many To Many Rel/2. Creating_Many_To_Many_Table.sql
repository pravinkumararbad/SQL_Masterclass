-- ------------------------------------------------------------------------------ Creating Many : Many Relation Tables -------------------------------------------------------------------- --
CREATE DATABASE  tv_db;
use tv_db;

CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    first_name VARCHAR( 50 ) NOT NULL,
    last_name VARCHAR( 50 ) NOT NULL
);

CREATE TABLE series (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    title VARCHAR( 50 ) NOT NULL,
	release_year YEAR NOT NULL,  -- release_year INT NOT NULL
    genre VARCHAR( 20 ) NOT NULL
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    rating DECIMAL( 3,1 ) NOT NULL,
    series_id INT NOT NULL,
    reviewer_id INT NOT NULL,
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(id), -- We have a choice of ON_DELETE_CASCADE
    FOREIGN KEY (series_id) REFERENCES series(id)
);

-- ON_DELETE_CASCADE on reviewer_id or on series_id will delete the reviews of the reviewer or series if either of thos entries are deleted.
-- We are currently not interested in deleting reviews based on the reviewer or series deletion.

show TABLES;

INSERT INTO series ( title, release_year, genre ) VALUES
    ( 'Archer', 2009, 'Animation' ),
    ( 'Arrested Development', 2003, 'Comedy' ),
    ( "Bob's Burgers", 2011, 'Animation' ),
    ( 'Bojack Horseman', 2014, 'Animation' ),
    ( 'Breaking Bad', 2008, 'Drama' ),
    ( 'Curb Your Enthusiasm', 2000, 'Comedy' ),
    ( 'Fargo', 2014, 'Drama' ),
    ( 'Freaks and Geeks', 1999, 'Comedy' ),
    ( 'General Hospital', 1963, 'Drama' ),
    ( 'Halt and Catch Fire', 2014, 'Drama' ),
    ( 'Malcolm In The Middle', 2000, 'Comedy' ),
    ( 'Pushing Daisies', 2007, 'Comedy' ),
    ( 'Seinfeld', 1989, 'Comedy' ),
    ( 'Stranger Things', 2016, 'Drama' );
    
SELECT * FROM series;

INSERT INTO reviewers ( first_name, last_name ) VALUES
    ( 'Thomas', 'Stoneman' ),
    ( 'Wyatt', 'Skaggs' ),
    ( 'Kimbra', 'Masters' ),
    ( 'Domingo', 'Cortes' ),
    ( 'Colt', 'Steele' ),
    ( 'Pinkie', 'Petit' ),
    ( 'Marlon', 'Crafford' );

SELECT * FROM reviewers;

INSERT INTO reviews ( series_id, reviewer_id, rating ) VALUES
    (),
    ();