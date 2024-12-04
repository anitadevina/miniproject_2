{{ config(materialized='table', schema='mart') }}

-- i need to know the factor to answer the problem, currently i use my perception
WITH rank_by_total_roles AS (
	SELECT
		da.actor_id,
		(da.first_name || ' ' || da.last_name) AS actor_name,
	    COUNT(DISTINCT dfc.category_id) AS total_roles,
	    ARRAY_AGG(DISTINCT dc."name") AS categories,
	    DENSE_RANK() OVER (
	    	order BY COUNT(DISTINCT dfc.category_id) DESC
	    ) AS rank
    FROM {{ ref('fact_payment') }} fp
    LEFT JOIN {{ ref('dim_rental') }} dr ON fp.rental_id = dr.rental_id
    LEFT JOIN {{ ref('dim_inventory') }} di ON dr.inventory_id = di.inventory_id
    LEFT JOIN {{ ref('dim_film') }} df ON di.film_id = df.film_id
    LEFT JOIN {{ ref('dim_film_actor') }} dfa ON df.film_id = dfa.film_id
    INNER JOIN {{ ref('dim_actor') }} da ON dfa.actor_id = da.actor_id
    INNER JOIN {{ ref('dim_film_category') }} dfc ON df.film_id = dfc.film_id
    INNER JOIN {{ ref('dim_category') }} dc ON dfc.category_id = dc.category_id 
	GROUP BY da.actor_id, da.first_name, da.last_name
)
SELECT 
    actor_id, 
    actor_name, 
    total_roles, 
    categories 
FROM rank_by_total_roles
WHERE rank = 1
ORDER BY actor_name ASC