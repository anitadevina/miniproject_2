{{ config(materialized='table', schema='raw') }}

SELECT 
    -- CAST(actor_id AS INT) AS actor_id,
    -- CAST(film_id AS INT) AS film_id,
    -- last_update
    *
FROM {{ source('public', 'film_actor') }}