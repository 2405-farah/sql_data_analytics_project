/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To find the proportion of each part relative to the whole.
    - To see which categories contribute the most to overall sales.

SQL Functions Used:
    - SUM(): Aggregates values per category.
    - Window Functions: SUM() OVER() for the overall total.
===============================================================================
*/
/* which categories contribute the most to overall sales*/
/* Which categories contribute the most to overall sales */

SELECT
    category,
    total_sales,
    SUM(total_sales) OVER() AS overall_sales,
    concat(round((total_sales/sum(total_sales)over())*100,2),'%') as prcentage_of_total
FROM (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold_fact_sales f
    LEFT JOIN gold_dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.category
) AS category_sales
order by total_sales desc;
