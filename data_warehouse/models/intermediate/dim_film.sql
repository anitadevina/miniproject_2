{{ config(materialized='table', schema='intermediate') }}

SELECT
    film_id,
    title,
    description,
    release_year,
    language_id,
    rental_duration,
    rental_rate,
    length,
    replacement_cost,
    rating,
    last_update,
    special_features,
    fulltext
FROM {{ ref('raw_film')}}