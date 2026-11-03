/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

/*change over time*/

select 
month(order_date) as order_month,
sum(sales_amount) as total_sales,
count(distinct customer_key) as tottal_customers,
sum(quantity) as total_quantity
from gold_fact_sales
where order_date is not null
group by month(order_date)
order by month(order_date)

======================================================================
Cumulative analysis

/* calculate the total sales per month*/
/*and the running total of sales over time*/

select 
order_date,
total_sales,
sum(total_sales) over(partition by order_date order by order_date) as running_total_sales,
avg(avg_price) over(order by order_date) as moving_average_price
from
(
select
DATE_FORMAT(order_date, '%Y-%m-01') as order_date,
sum(sales_amount) as total_sales,
avg(price) as avg_price
from  gold_fact_sales
where order_date is not null
group by DATE_FORMAT(order_date, '%Y-%m-01')
order by DATE_FORMAT(order_date, '%Y-%m-01')
)t
