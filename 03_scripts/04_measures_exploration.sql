/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/
/* find the total sales*/
select sum(sales_amount) total_sales from gold_fact_sales;

/*find how many items are sold*/
select sum(quantity) total_items from gold_fact_sales;

/* find the average selling price*/
select avg(price) avg_price from gold_fact_sales;

/* find the total number of orders*/
select count(order_number) total_order from gold_fact_sales;
select count(distinct order_number) total_order from gold_fact_sales;

/* find the total number of products*/
select count(distinct product_key) total_product from gold_dim_products;

/* find the total number of customers*/
select count(distinct customer_key) total_customer from gold_dim_customers;

/* find the total number of customers that has placed an order*/
select count(distinct customer_key) total_customer from gold_fact_sales;

/* generate a report that shows all key metrics of the business*/
select 'total sales' as measure_name, sum(sales_amount) as measure_value from gold_fact_sales
union all
select 'total quantity', sum(quantity) from gold_fact_sales
union all
select 'average price', avg(price) from gold_fact_sales
union all
select 'total n. order', count(distinct order_number) from gold_fact_sales
union all
select 'total n. product', count(distinct product_key) from gold_dim_products
union all
select 'total n.customers', count(distinct customer_key) from gold_dim_customers;
