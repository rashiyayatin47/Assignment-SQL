
-- 1.Create two tables: AppOrders (for orders placed via a food delivery app like Zomato) and InStoreOrders (for direct restaurant orders), each with columns: order_id, customer_name, amount, and order_date. Insert at least 3 sample records into each table.
create table AppOrders (
    order_id int,
    customer_name varchar(50),
    amount int,
    order_date date
);
insert into AppOrders values
(1, 'rahul', 300, '2026-08-01'),
(2, 'priya', 450, '2026-08-02'),
(3, 'amit', 250, '2026-08-03');

create table InStoreOrders (
    order_id int,
    customer_name varchar(50),
    amount int,
    order_date date
);
insert into InStoreOrders values
(4, 'neha', 500, '2026-08-01'),
(5, 'rahul', 300, '2026-08-02'),
(6, 'rohan', 350, '2026-08-03');


-- 2.Write a SQL query using UNION to combine all unique customer names from both AppOrders and InStoreOrders tables into a single list.

select customer_name
from AppOrders
union select customer_name from InStoreOrders;

-- 3.Write a SQL query using UNION ALL to display every order (including duplicates if any) from both AppOrders and InStoreOrders, showing order_id, customer_name, amount, and order_date.
select order_id, customer_name, amount, order_date
from AppOrders union all select order_id, customer_name, amount, order_date from InStoreOrders;

-- 4.Demonstrate the difference between UNION and UNION ALL by adding a duplicate customer_name in both tables, then running both queries and noting the difference in the result count.<br><br><em><strong>Hint:</strong> UNION removes duplicates, UNION ALL does not.</em>
insert into AppOrders values
(7, 'sameer', 200, '2026-08-04');

insert into InStoreOrders values
(8, 'sameer', 400, '2026-08-04');

select customer_name
from AppOrders
union select customer_name
from InStoreOrders;


select customer_name
from AppOrders union all select customer_name
from InStoreOrders;