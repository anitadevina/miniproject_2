{{ config(materialized='table', schema='raw') }}

SELECT 
    -- CAST(customer_id AS INT) AS customer_id,
    -- CAST(store_id AS INT) AS store_id,
    -- first_name,
    -- last_name,
    -- email,
    -- CAST(address_id AS INT) AS address_id,
    -- activebool,
    -- create_date,
    -- last_update,
    -- active
    *
FROM {{ source('public', 'customer') }}