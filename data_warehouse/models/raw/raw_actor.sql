{{ config(materialized='table', schema='raw') }}

SELECT 
    -- CAST(actor_id AS INT) AS actor_id,
    -- first_name,
    -- last_name,
    -- last_update
    *
FROM {{ source('public', 'actor') }}