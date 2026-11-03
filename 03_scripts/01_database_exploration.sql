/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database, including the list of tables and their schemas.
    - To inspect the columns and metadata for specific tables.

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/
/*explore all tables in data base*/
select * from information_schema.tables;

/*explore all columns in data base*/
select *from information_schema.columns
where table_name=‘gold_dim_customers';
