{{ config(materialized='table', schema='raw') }}

SELECT 
    -- CAST(inventory_id AS INT) as inventory_id,
    -- CAST(film_id AS INT) as film_id,
    -- CAST(store_id AS INT) as store_id,
    -- last_update
    *
FROM {{ source('public', 'inventory') }}