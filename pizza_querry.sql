create database pizza_DB;

select * from pizza_sales;

select sum(total_price) as Total_Revenue from pizza_sales;

select sum(total_price)/ count(distinct order_id) as Avg_order_value from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

select count(distinct order_id) as total_order from pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_pizza_per_order from pizza_sales;

select datename(dw, order_date) as order_day, count(distinct order_id) as Total_orders from pizza_sales
group by datename(dw, order_date);


select datename(month, order_date) as Month_name, count(distinct order_id) as Total_orders from pizza_sales
group by datename(month, order_date)
order by Total_orders desc;

select pizza_category, sum(total_price) as Toatal_sales, sum(total_price)* 100 / 
(select sum(total_price) from pizza_sales where month(order_date) = 1) as PCT from pizza_sales
where month(order_date) = 1
group by pizza_category;



select pizza_size, cast(sum(total_price) as decimal(10,2)) Total_sales, cast(sum(total_price)* 100 / 
(select sum(total_price) from pizza_sales where datepart(quarter, order_date)= 1) as decimal(10,2)) PCT from pizza_sales
where datepart(quarter, order_date)= 1
group by pizza_size
order by PCT desc;


select top 5 pizza_name ,sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name 
order by Total_Revenue desc;


select top 5 pizza_name ,sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name 
order by Total_Revenue asc;


select top 5 pizza_name ,sum(quantity) as Total_quantity from pizza_sales
group by pizza_name 
order by Total_quantity desc;


select top 5 pizza_name ,sum(quantity) as Total_quantity from pizza_sales
group by pizza_name 
order by Total_quantity asc;


select top 5 pizza_name , count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name 
order by Total_orders desc;

select top 5 pizza_name, count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name 
order by Total_orders asc;


select top 5 pizza_name ,sum(quantity) as Total_pizzas_sold from pizza_sales
where month(order_date) = 8
group by pizza_name 
order by sum(quantity) asc;



