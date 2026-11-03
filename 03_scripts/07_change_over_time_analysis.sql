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

