CREATE DATABASE retail_analysis;
USE retail_analysis;

create table orders (
order_id INT,
order_date DATE,
ship_mode VARCHAR (50),
segment VARCHAR (50),
country VARCHAR (50),
city VARCHAR (50),
state VARCHAR (50),
postal_code VARCHAR (20),
region VARCHAR (50),
category VARCHAR (50),
sub_category VARCHAR (50),
product_id VARCHAR (50),
cost_price DECIMAL (10,2),
list_price DECIMAL (10,2),
quantity INT,
discount_percent DECIMAL (10,2)
);
select * from orders
limit 10;

# Total Revenue

select
round(sum(list_price * quantity),2) as Total_Revenue
from orders; 

# Top 5 gategories by revenue

select
category,
round(sum(list_price * quantity),2) as revenue
from orders
group by category
order by revenue desc
limit 5;

# top 5 states by revenue

select state,
round(sum(list_price*quantity),2) as revenue
from orders
group by state
order by revenue desc
limit 5;

# monthly revenue trend

select 
month(order_date) as month,
year (order_date) as year,
round(sum(list_price*quantity),2) as revenue
from orders
group by year, month
order by year, month;

# top 5 sub-category by revenue

select sub_category,
round(sum(list_price*quantity),2) as revenue
from orders
group by sub_category
order by revenue desc
limit 5;

# total profit by ctaegory

select category,
round(sum(list_price*quantity) - sum(cost_price*quantity),2) as profit
from orders
group by category
order by profit
desc;

# avg discount per category

select category,
round(avg(discount_percent),2) as avg_discount
from orders
group by category
order by avg_discount
desc;

# total order per segment

select segment,
count(order_id) as total_order
from orders
group by segment
order by total_order desc;

# top 5 cities by revenue

select city,
round(sum(list_price*quantity),2) as revenue
from orders
group by city
order by revenue desc
limit 5;

#year wise revenue comparison

select 
year(order_date) as year,
round(sum(list_price*quantity),2) as revenue
from orders
group by year
order by year;

select
order_id,
order_date,
ship_mode,
segment,
country,
city,
state,
region,
category,
sub_category,
cost_price,
list_price,
quantity,
discount_percent,
ROUND(list_price * quantity, 2) AS revenue,
ROUND((list_price - cost_price) * quantity, 2) AS profit
FROM orders;