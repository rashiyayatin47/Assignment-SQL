-- 1.Write an SQL query using the WITH clause to create a temporary result set called TopArtists that selects the top 3 most-followed artists from a table SpotifyArtists (columns: artist_id, name, followers), then select all rows from TopArtists.
with TopArtists as (
    select *
    from SpotifyArtists
    order by followers desc
    limit 3
)
select *
from TopArtists;

-- 2.Using a table named FlipkartOrders (columns: order_id, user_id, order_date, total_amount), write a query with a CTE called MonthlyTotals that calculates the total sales amount for each month in 2023, then select the month with the highest total sales from MonthlyTotals.<br><br><em><strong>Hint:</strong> Use EXTRACT(MONTH FROM order_date) or DATE_FORMAT(order_date, '%m') depending on your SQL dialect.</em>
with MonthlyTotals as (
    select extract(month from order_date) as month,
           sum(total_amount) as total_sales
    from FlipkartOrders
    where extract(year from order_date) = 2023
    group by extract(month from order_date)
)
select *
from MonthlyTotals
order by total_sales desc
limit 1;

-- 3.Create a recursive CTE to generate a list of dates for the next 7 days starting from today in a table called CalendarDays (columns: day_date).<br><br><em><strong>Hint:</strong> Use UNION ALL inside your CTE and limit recursion to 7 levels.</em>
with recursive CalendarDays as (
    select current_date as day_date

    union all

    select day_date + interval '1 day'
    from CalendarDays
    where day_date < current_date + interval '6 days'
)
select *
from CalendarDays;

-- 4.Given a table called ZomatoRestaurants (columns: id, name, city, rating), use a CTE to find the average rating for each city, then select all restaurants in cities where the average rating is above 4.0.
with CityAvg as (
    select city, avg(rating) as avg_rating
    from ZomatoRestaurants
    group by city
)
select r.name, r.city, r.rating
from ZomatoRestaurants r
join CityAvg c
on r.city = c.city
where c.avg_rating > 4.0;

-- 5.Use ChatGPT or Copilot to help you write an SQL query with a CTE that, given a table IPLMatches (columns: match_id, team, runs, match_year), calculates the total runs scored by each team in 2023 and lists only teams with more than 2000 runs.
with TeamRuns as (
    select team, sum(runs) as total_runs
    from IPLMatches
    where match_year = 2023
    group by team
)
select *
from TeamRuns
where total_runs > 2000;