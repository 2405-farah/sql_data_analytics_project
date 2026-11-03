/*
===============================================================================
Date Range Exploration
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/
/* find the date of the first and last order*/
select 
min(order_date) first_order_date,
max(order_date) max_order_date,
TIMESTAMPDIFF(month,min(order_date),max(order_date)) as order_range_years 
from gold_fact_sales
where order_date != '000-00-00';

/* find the youngest and oldest customers*/
select 
min(birthdate) oldest_cust,
TIMESTAMPDIFF(year,min(birthdate),now()) as oldest_age,
max(birthdate) youngest_cust,
TIMESTAMPDIFF(year,max(birthdate),now()) as youngest_age
from gold_dim_customers
where birthdate != ‘000-00-00';
