-- 1.Open your SQL editor and run a query to select all columns from a table named restaurants using SELECT * FROM restaurants;.
CREATE TABLE restaurants (
    id INT ,
    name VARCHAR(100),
    location VARCHAR(100)
);
USE food_delivery_db;

INSERT INTO restaurants VALUES
(1, 'Spice Hub', 'Ahmedabad'),
(2, 'Pizza World', 'Surat'),
(3, 'Burger Point', 'Vadodara'),
(4, 'Sushi House', 'Mumbai'),
(5, 'Tandoori Treat', 'Delhi'),
(6, 'Green Bowl', 'Pune'),
(7, 'BBQ Nation', 'Bengaluru'),
(8, 'Cafe Aroma', 'Jaipur');


SELECT * FROM restaurants;


-- 2.Write an SQL query to display only the name and rating columns from the table zomato_reviews.
CREATE TABLE zomato_reviews (
    id INT ,
    name VARCHAR(100),
    rating DECIMAL(2,1),
    city VARCHAR(50)
);


INSERT INTO zomato_reviews (id, name, rating, city) VALUES
(1, 'Spice Hub', 4.5, 'Ahmedabad'),
(2, 'Pizza World', 4.2, 'Surat'),
(3, 'Burger Point', 4.0, 'Vadodara'),
(4, 'Sushi House', 4.7, 'Mumbai'),
(5, 'Tandoori Treat', 4.3, 'Delhi'),
(6, 'Green Bowl', 4.1, 'Pune'),
(7, 'BBQ Nation', 4.6, 'Bengaluru'),
(8, 'Cafe Aroma', 4.4, 'Jaipur');

select name,rating from zomato_reviews;

-- 3.Write an SQL query to select the movie_name and release_year columns from a table called movies, but rename movie_name as 'Title' and release_year as 'Year Released' in the output using the AS keyword.

CREATE TABLE movies (
    id INT ,
    movie_name VARCHAR(100),
    release_year INT
);


INSERT INTO movies (id, movie_name, release_year) VALUES
(1, 'Iron Man', 2008),
(2, 'The Avengers', 2012),
(3, 'Captain America: Civil War', 2016),
(4, 'Black Panther', 2018),
(5, 'Avengers: Endgame', 2019),
(6, 'Spider-Man: No Way Home', 2021);

select movie_name as 'TITLE', release_year as 'Year Released' from movies;



-- 4.In a table called products, write an SQL query that selects all columns and add a comment in your SQL code explaining what the query does.<br><br><em><strong>Hint:</strong> Use -- to write a single-line comment above your query.</em>

-- This query displays all columns and all records from the products table.
SELECT * FROM products;


