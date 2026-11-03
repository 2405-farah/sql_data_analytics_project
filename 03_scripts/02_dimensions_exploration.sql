/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.

SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/
/* explore all countries our customers come from*/
select distinct 
country 
from gold_dim_customers;

/* explore all categories "the major divissions*/
select distinct 
  category,
  subcategory,
  product_name 
  from gold_dim_products
order by category, subcategory, product_name;
