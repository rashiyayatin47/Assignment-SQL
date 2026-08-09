-- 1.Create two tables in your SQL database: Users (user_id, username, city) and Orders (order_id, user_id, product, amount). Insert at least 3 users and 5 orders, making sure some users have no orders.
create table Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    city varchar(50)
);

CREATE table orders (
    order_id INT primary KEY,
    user_id INT,
    product VARCHAR(100),
    amount int
);

INSERT INTO users VALUES
(1, 'Rahul', 'Ahmedabad'),
(2, 'Priya', 'Mumbai'),
(3, 'Amit', 'Delhi');


INSERT INTO orders VALUES
(101, 1, 'Pizza', 300),
(102, 1, 'Burger', 200),
(103, 2, 'Biryani', 250),
(104, 2, 'Sandwich', 150),
(105, 1, 'Pasta', 350);


-- 2.Write an SQL query using INNER JOIN to list all usernames and their ordered products, showing only users who have placed at least one order.
SELECT Users.username, Orders.product
FROM users
inner join Orders
ON Users.user_id = orders.user_id;


-- 3.Write an SQL query using LEFT JOIN to display all usernames along with their ordered products. For users who haven't placed any orders, show NULL for the product.
SELECT users.username, orders.product
FROM users
LEFT JOIN orders
ON users.user_id = orders.user_id;

-- 4.Write an SQL query using RIGHT JOIN to show all orders and the corresponding username for each order. If an order has a user_id that doesn't exist in the Users table, display NULL for the username.<br><br><em><strong>Hint:</strong> Try deleting one user and keeping their order to test this case.</em>
select orders.order_id, orders.product, users.username
from users
right join orders
ON Users.user_id = Orders.user_id;


-- 5.Suppose you want to analyze food delivery data like Zomato. Create a CustomerSegments table (segment_id, segment_name), and link it to Users with a foreign key. Write an SQL query to show each username, their segment name, and total order amount (use JOINs as needed).
CREATE TABLE CustomerSegments (
    segment_id INT PRIMARY KEY,
    segment_name VARCHAR(50)
);

ALTER TABLE Users
ADD segment_id INT;

INSERT INTO CustomerSegments VALUES
(1, 'Regular'),
(2, 'Premium'),
(3, 'New');



