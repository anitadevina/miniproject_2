{{ config(materialized='table', schema='raw') }}

SELECT 
    -- CAST(film_id AS INT) AS film_id,
    -- title,
    -- description,
    -- release_year,
    -- CAST(language_id AS INT) AS language_id,
    -- rental_duration,
    -- rental_rate,
    -- length,
    -- replacement_cost,
    -- rating,
    -- last_update,
    -- special_features,
    -- fulltext
    *
FROM {{ source('public', 'film') }}