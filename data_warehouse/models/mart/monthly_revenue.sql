{{ config(materialized='table', schema='mart') }}

SELECT
    to_char(fp.payment_date, 'FMMonth YYYY') AS month_year,
    SUM(fp.amount) AS total_revenue
FROM {{ ref('fact_payment') }} fp
--LEFT JOIN {{ ref('dim_rental') }} dr ON fp.rental_id = dr.rental_id
GROUP BY month_year
ORDER BY MIN(fp.payment_date)