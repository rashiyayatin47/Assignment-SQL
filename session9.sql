-- 1.Create two tables, influencers and brands, with at least 3 sample rows each. Use a FULL OUTER JOIN to list all influencers and brands, showing influencer_name and brand_name, matching on city. If there is no match, display NULL for the missing side.<br><br><em><strong>Hint:</strong> Use LEFT JOIN, RIGHT JOIN, and UNION if your SQL dialect does not support FULL OUTER JOIN directly.</em>

select i.influencer_name, b.brand_name
from influencers i
right join brands b
on i.city = b.city;

-- 2.Given a table called playlists with columns (id, playlist_name, parent_playlist_id), write a SELF JOIN query to display each playlist alongside its parent playlist's name, similar to how Spotify might nest playlists.
select p.playlist_name, parent.playlist_name as parent_name
from playlists p
left join playlists parent
on p.parent_playlist_id = parent.id;

-- 3.Create two tables: users and offers. Write a CROSS JOIN query to generate all possible combinations of users and offers, displaying user_name and offer_title. Explain in a comment how this could be used for a Flipkart-style personalized offer campaign.
select u.user_name, o.offer_title
from users u
cross join offers o;

-- 4.You have an employees table with columns (id, name, manager_id). Write a SELF JOIN to display each employee's name along with their manager's name. Then, modify your query to only show employees who do not have a manager (i.e., top-level managers).
select e.name as employee, m.name as manager
from employees e
left join employees m
on e.manager_id = m.id;

-- this creates every user and offer combination
-- it can be used to give personalized offers

--  5.Use ChatGPT or Copilot to help you write a SQL query that finds all pairs of users from a users table who live in the same city (excluding pairs where the user is compared with themselves). Paste the query and briefly describe how the AI helped you improve or debug it.
select u1.name as user1, u2.name as user2, u1.city
from users u1
join users u2
on u1.city = u2.city
and u1.id < u2.id;