/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

/*which 5 products generate the highest revenue*/
select 
p.product_name,
sum(f.sales_amount) total_revenue
from gold_fact_sales f
left join gold_dim_products p
on p.product_key=f.product_key
group by p.product_name
order by total_revenue desc
limit 5;

/*which 5 worst performing products in terms of sales*/
select 
p.product_name,
sum(f.sales_amount) total_revenue
from gold_fact_sales f
left join gold_dim_products p
on p.product_key=f.product_key
group by p.product_name
order by total_revenue
limit 5;

/*which 5 products generate the highest revenue*/
select 
p.product_name,
sum(f.sales_amount) total_revenue
from gold_fact_sales f
left join gold_dim_products p
on p.product_key=f.product_key
group by p.product_name
order by total_revenue desc
limit 5;

select *
from(
select 
p.product_name,
sum(f.sales_amount) total_revenue,
row_number()over(order by sum(f.sales_amount) desc) as rank_products
from gold_fact_sales f
left join gold_dim_products p
on p.product_key=f.product_key
group by p.product_name)t
where rank_products <= 5;

/*which 5 worst performing products in terms of sales*/
select 
p.product_name,
sum(f.sales_amount) total_revenue
from gold_fact_sales f
left join gold_dim_products p
on p.product_key=f.product_key
group by p.product_name
order by total_revenue
limit 5;
