{{ config(materialized='table', schema='raw') }}

SELECT 
    -- CAST(rental_id AS INT) AS rental_id,
    -- rental_date,
    -- CAST(inventory_id AS INT) AS inventory_id,
    -- CAST(customer_id AS INT) AS customer_id,
    -- return_date,
    -- CAST(staff_id AS INT) AS staff_id,
    -- last_update
    *
FROM {{ source('public', 'rental') }}