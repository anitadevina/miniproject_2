{{ config(materialized='table', schema='mart') }}

-- i need to know the factor to answer the problem
SELECT
    da.first_name,
    da.last_name
FROM {{ ref('fact_payment') }} fp
LEFT JOIN {{ ref('dim_rental') }} dr ON fp.rental_id = dr.rental_id
LEFT JOIN {{ ref('dim_inventory') }} di ON dr.inventory_id = di.inventory_id
LEFT JOIN {{ ref('dim_film') }} df ON di.film_id = df.film_id
LEFT JOIN {{ ref('dim_film_actor') }} dfa ON df.film_id = dfa.film_id
LEFT JOIN {{ ref('dim_actor') }} da ON dfa.actor_id = da.actor_id