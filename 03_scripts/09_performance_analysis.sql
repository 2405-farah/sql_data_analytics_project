/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis.
===============================================================================
*/

/* Analyze the yearly sales performance of each product by calculating
   its total sales for each year. */

select
year(f.order_date) as order_year,
p.product_name,
sum(f.sales_amount) as current_sales
from gold_fact_sales f
left join gold_dim_products p
on f.product_key=p.product_key
where f.order_date != 0
group by year(f.order_date),
p.product_name;
