/*
===============================================================================
Magnitude Analysis
===============================================================================
Purpose:
    - To quantify data and group results by specific dimensions.
    - For understanding data distribution across categories.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT(), AVG()
    - GROUP BY, ORDER BY
===============================================================================
*/
/*find total customers by counties*/
select
country,
count(customer_key) as total_customers
from 
gold_dim_customers
group by country
order by total_customers desc;


/*find total customers by gender*/
select
gender,
count(customer_key) as total_gender
from gold_dim_customers
group by gender
order by total_gender desc;

/*find total products by category*/
select 
category,
count(product_key) as total_products
from gold_dim_products
group by category
order by total_products desc;

/*what is the average costs in each category?*/
select 
category,
avg(cost) as avg_costs
from  gold_dim_products
group by category
order by avg_costs desc;


/*what is the total revenue generated for each category?*/
select
p.category,
sum(f.sales_amount) total_revenue
from gold_fact_sales f
left join gold_dim_products p
on p.product_key=f.product_key
group by p.category
order by total_revenue desc;
