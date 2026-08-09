-- 1.Create a table called Orders with columns: order_id, user_id, order_amount, and app_name (e.g., 'Zomato', 'Swiggy', 'Flipkart'). Insert at least 10 sample records with different users and apps. Write an SQL query using the OVER() function to display each order's amount along with the total order amount for all orders.
create table Orders (
    order_id int,
    user_id int,
    order_amount int,
    app_name varchar(30)
);
insert into Orders values
(1, 101, 300, 'Zomato'),
(2, 102, 500, 'Swiggy'),
(3, 101, 250, 'Flipkart'),
(4, 103, 700, 'Zomato'),
(5, 102, 400, 'Swiggy'),
(6, 104, 600, 'Flipkart'),
(7, 101, 350, 'Zomato'),
(8, 103, 450, 'Swiggy'),
(9, 104, 800, 'Flipkart'),
(10, 102, 200, 'Zomato');

select order_id, order_amount,
       sum(order_amount) over() as total_amount
from Orders;


-- 2.Using the Orders table, write an SQL query to show each user's order_id, order_amount, and the average order_amount for that user using the OVER(PARTITION BY user_id) clause.<br><br><em><strong>Hint:</strong> Use AVG(order_amount) OVER(PARTITION BY user_id) to get the per-user average.</em>
select user_id, order_id, order_amount,
       avg(order_amount) over(partition by user_id) as user_average
from Orders;



-- 3.Suppose you have a table called Playlist with columns: song_id, user_id, and duration_sec. Write an SQL query to display each song's duration, and the total duration of songs added by each user using SUM(duration_sec) OVER(PARTITION BY user_id).
select user_id, song_id, duration_sec,
       sum(duration_sec) over(partition by user_id) as total_duration
from Playlist;

-- 4.Given a table named MovieRatings with columns: rating_id, user_id, movie_name, and rating (1-5), write an SQL query to show each rating, the average rating per movie, and the difference between the user's rating and the movie's average rating using window functions.<br><br><em><strong>Hint:</strong> Use AVG(rating) OVER(PARTITION BY movie_name) and subtract it from the user's rating.</em>
select user_id, movie_name, rating,
	avg(rating) over(partition by movie_name) as movie_average,
	rating - avg(rating) over(partition by movie_name) as difference
from MovieRatings;