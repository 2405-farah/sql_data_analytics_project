/*
===============================================================================
Data Segmentation Analysis
===============================================================================
Purpose:
    - To group data into meaningful categories for targeted insights.
    - For customer segmentation, product categorization, or regional analysis.

SQL Functions Used:
    - CASE: Defines custom segmentation logic.
    - GROUP BY: Groups data into segments.
===============================================================================
*/

/*segment products into cost ranges and 
count how many products fall into each segment*/
SELECT DISTINCT
    cost_range,
    COUNT(product_key) OVER(
        PARTITION BY cost_range
    ) AS total_products
FROM (
    SELECT
        product_key,
        product_name,
        cost,
        CASE
            WHEN cost < 100 THEN 'below 100'
            WHEN cost BETWEEN 100 AND 499 THEN '100-499'
            WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
            ELSE 'above 1000'
        END AS cost_range
    FROM gold_dim_products
) AS product_segments
ORDER BY total_products DESC;
