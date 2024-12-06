{{ config(materialized='table', schema='intermediate') }}

SELECT
    customer_id,
    store_id,
    first_name,
    last_name,
    address_id,
    email,
    activebool,
    create_date,
    last_update,
    active
FROM {{ ref('raw_customer')}}