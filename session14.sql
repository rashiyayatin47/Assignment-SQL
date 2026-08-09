-- 1.Given a table Orders with columns (order_id, user_id, order_date, total_amount), write an SQL query using ROW_NUMBER() to assign a unique sequential number to each order per user, ordered by order_date descending.
select order_id, user_id, order_date, total_amount,
       row_number() over(
           partition by user_id
           order by order_date desc
       ) as order_no
from Orders;

-- 2.Suppose you have a table called Songs with columns (song_id, artist, streams). Write an SQL query using RANK() to list each song along with its rank based on streams within each artist.
select song_id, artist, streams,
       rank() over(
           partition by artist
           order by streams desc
       ) as song_rank
from Songs;

-- 3.For a table named Movies with columns (movie_id, genre, rating), write an SQL query using DENSE_RANK() to assign a rank to each movie within its genre based on rating, with the highest rating getting rank 1.
select movie_id, genre, rating,
       dense_rank() over(
           partition by genre
           order by rating desc
       ) as movie_rank
from Movies;

-- 4.Imagine a table named Influencers with columns (id, platform, followers). Write an SQL query to display the top 3 influencers per platform using ROW_NUMBER(), showing id, platform, followers, and their row number.<br><br><em><strong>Hint:</strong> Use a subquery or CTE to filter for row numbers less than or equal to 3.</em>
with x as (
    select id, platform, followers,
           row_number() over(
               partition by platform
               order by followers desc
           ) as rn
    from Influencers
)
select id, platform, followers, rn
from x
where rn <= 3;