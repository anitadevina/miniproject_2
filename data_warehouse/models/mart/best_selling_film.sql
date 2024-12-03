{{ config(materialized='table', schema='mart') }}

-- i need to know the factor to answer the problem, currently i use my perception
SELECT
    MIN(df.film_id) AS film_id, 
    df.title, 
    COUNT(dr.*)::integer AS total_rent
FROM {{ ref('fact_payment') }} fp
LEFT JOIN {{ ref('dim_rental') }} dr ON fp.rental_id = dr.rental_id
LEFT JOIN {{ ref('dim_inventory') }} di ON dr.inventory_id = di.inventory_id
LEFT JOIN {{ ref('dim_film') }} df ON di.film_id = df.film_id
GROUP BY df.title
ORDER BY COUNT(dr.*)::integer DESC