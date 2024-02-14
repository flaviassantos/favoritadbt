{{
  config(
    materialized = 'view',
    )
}}

--{% set row_id = ['meta_valid_row_id'] %}
{% set sale_id = ['sale_order_number'] %}
{% set store_id = ['store_code'] %}
{% set product_id = ['product_family_code'] %}

WITH sale_open AS (
    SELECT
        /*Keys*/
        id AS sale_order_number,
        /*Dimentions codes*/
        store_nbr AS store_code,
        family AS product_family_code,
        /*Dates*/
        date AS sale_date,
        /*Quantities and units*/
        NULL AS sale_qty,
        /*Attributes*/
        onpromotion AS on_promotion,
        'Open' AS sale_status,
        /*Meta*/
        'Kaggle' AS source_data

    FROM {{ source('FAVORITA', 'TEST') }}
),

final AS (
    SELECT
        {{ unique_business_key(sale_id) }} AS sale_id,
        {{ unique_business_key(store_id) }} AS store_id,
        {{ unique_business_key(product_id) }} AS product_id,
        *
    FROM sale_open
)

SELECT * FROM final
