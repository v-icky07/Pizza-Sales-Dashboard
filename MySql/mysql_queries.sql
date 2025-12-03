-- KPI's
SELECT * from pizza_sales;
SELECT sum(total_price) as Total_Revenue from pizza_sales;
SELECT sum(total_price)/count(distinct order_id) as Avg_Order_Value from pizza_sales;
SELECT sum(quantity) as Total_Pizza_Sold from pizza_sales;
SELECT count(distinct order_id) as Total_Orders from pizza_sales;
SELECT sum(quantity)/count(distinct order_id) as Avg_Pizzas_per_Order from pizza_sales;

-- Chart Ouputs

select dayname(order_date) as order_day, count(distinct order_id) as Total_Orders 
from pizza_sales group by dayname(order_date);
select monthname(order_date) as order_month, count(distinct order_id) as Total_Orders
from pizza_sales group by monthname(order_date); 
select pizza_category, round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as PCT
from pizza_sales group by pizza_category;
select pizza_size, round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as PCT
from pizza_sales group by pizza_size;
select pizza_category, sum(quantity) as Total_Pizza 
from pizza_sales group by pizza_category;

-- Top and Bottom 5 
select pizza_name, round(sum(total_price),2) as Revenue
from pizza_sales group by pizza_name
order by sum(total_price) desc limit 5;
select pizza_name, round(sum(total_price),2) as Revenue
from pizza_sales group by pizza_name
order by sum(total_price) limit 5;
select pizza_name, round(sum(quantity),2) as Total_Quantity
from pizza_sales group by pizza_name
order by sum(quantity) desc limit 5;
select pizza_name, round(sum(quantity),2) as Total_Quantity
from pizza_sales group by pizza_name
order by sum(quantity) limit 5;
select pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales group by pizza_name
order by count(distinct order_id) desc limit 5;
select pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales group by pizza_name
order by count(distinct order_id) limit 5;



