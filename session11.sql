-- 1.Write a SQL query to display the names and ratings of restaurants (from a table named Restaurants) where the rating is higher than the average rating of all restaurants in the table.<br><br><em><strong>Hint:</strong> Use a subquery in the WHERE clause to calculate the average rating.</em>
select name, rating
from Restaurants
where rating > (
    select avg(rating)
    from Restaurants
);

-- 2.In a Flipkart-style Products table (columns: product_id, name, price, category), write a SQL query to list each product name along with the average price of its category as an additional column using a scalar subquery in the SELECT statement.
select name, price,
       (select avg(price)
        from Products
        where category = p.category) as category_avg
from Products p;

-- 3.Given a Playlists table (playlist_id, user_id, playlist_name) and a Users table (user_id, username), write a SQL query using a subquery in the FROM clause to show each username and the number of playlists they have created, displaying only users who have created more playlists than the average number of playlists per user.<br><br><em><strong>Hint:</strong> Use a derived table (subquery in FROM) to count playlists per user, then filter with a subquery in WHERE.</em>
select u.username, count(p.playlist_id) as playlist_count
from Users u
join Playlists p
on u.user_id = p.user_id
group by u.user_id, u.username
having count(p.playlist_id) > (
    select avg(cnt)
    from (
        select count(*) as cnt
        from Playlists
        group by user_id
    ) x
);

-- 4.Suppose you have an Orders table (order_id, user_id, total_amount) for a food delivery app. Write a query to find all user_ids who have placed at least one order with a total_amount greater than the average order amount, using a subquery in the WHERE clause.
select distinct user_id
from Orders
where total_amount > (
    select avg(total_amount)
    from Orders
);