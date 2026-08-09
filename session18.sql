-- 1.Write an SQL query using CASE WHEN to classify orders in a 'FoodOrders' table as 'Small', 'Medium', or 'Large' based on the total_amount: 'Small' for less than 300, 'Medium' for 300 to 999, and 'Large' for 1000 and above.
select order_id, total_amount,
       case
           when total_amount < 300 then 'Small'
           when total_amount < 1000 then 'Medium'
           else 'Large'
       end as order_size
from FoodOrders;

-- 2.Given a 'Movies' table with a 'rating' column (out of 10), write an SQL query that adds a new column 'popularity' which shows 'Blockbuster' for ratings 8 and above, 'Hit' for 5 to 7.9, and 'Average' for below 5 using CASE WHEN ELSE END.
select movie_id, rating,
       case
           when rating >= 8 then 'Blockbuster'
           when rating >= 5 then 'Hit'
           else 'Average'
       end as popularity
from Movies;

-- 3.For a 'FlipkartProducts' table with a 'price' column, write an SQL query to create a 'price_category' column that bins prices as 'Budget' (below 500), 'Standard' (500 to 2000), and 'Premium' (above 2000) using CASE WHEN.
select product_id, price,
       case
           when price < 500 then 'Budget'
           when price <= 2000 then 'Standard'
           else 'Premium'
       end as price_category
from FlipkartProducts;

-- 4.Write an SQL query for a 'SpotifyTracks' table that uses CASE WHEN to assign a 'duration_label' column: 'Short' for tracks under 180 seconds, 'Medium' for 180-300 seconds, and 'Long' for over 300 seconds.<br><br><em><strong>Hint:</strong> Use multiple WHEN conditions to cover all possible durations.</em>
select song_id, duration_sec,
       case
           when duration_sec < 180 then 'Short'
           when duration_sec <= 300 then 'Medium'
           else 'Long'
       end as duration_label
from SpotifyTracks;