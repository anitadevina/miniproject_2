{{ config(materialized='table', schema='intermediate') }}

SELECT 
    *
FROM {{ ref('raw_customer') }}