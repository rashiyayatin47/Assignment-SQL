-- 1.Write an SQL query using the NOW() function to display the current date and time as 'CurrentDateTime' in your result set.
select now() ;

-- 2.Suppose you have a table called Orders with a column order_date (DATE type). Write a query to display each order's order_date, the year, month, and day as separate columns using YEAR(), MONTH(), and DAY().
select order_date,
       year(order_date) ,
       month(order_date) ,
       day(order_date) 
from Orders;

-- 3.Imagine you are building a feature like Zomato's order delivery estimate. Given a table Deliveries with a column delivery_date, write a query to show delivery_date and a new column expected_pickup_date which is 2 days before delivery_date using DATE_SUB().
select delivery_date,
       date_sub(delivery_date, interval 2 day) 
from Deliveries;

-- 4.You have a table called Subscriptions with columns user_id, start_date, and end_date. Write a query to display user_id, start_date, end_date, and the total number of days of each subscription using DATEDIFF().<br><br><em><strong>Hint:</strong> Use DATEDIFF(end_date, start_date) to get the duration.</em>
select user_id, start_date, end_date,
       datediff(end_date, start_date) 
from Subscriptions;

-- 5.Create an SQL query for a table named AppLogins (columns: user_id, last_login_date) to find all users who haven't logged in for more than 30 days from today. Use NOW() and DATEDIFF() in your query.<br><br><em><strong>Constraint:</strong> Only select user_id and last_login_date for users who meet the criteria.</em>
select user_id, last_login_date
from AppLogins
where datediff(now(), last_login_date) > 30;