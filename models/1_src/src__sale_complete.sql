{{
  config(
    materialized = 'view',
    )
}}

--{% set row_id = ['meta_valid_row_id'] %}
{% set sale_id = ['sale_order_number'] %}
{% set store_id = ['store_code'] %}
{% set product_id = ['product_family_code'] %}

WITH sale_complete AS (
    SELECT
    /*Keys*/ store_nbr AS store_code,
    /*Dimentions codes*/
    family AS product_family_code,
    date AS sale_date,
    /*Dates*/
    sales AS sale_qty,
    /*Quantities and units*/
    onpromotion AS on_promotion,
    /*Attributes*/
    'Completed' AS sale_status,
    'Kaggle' AS source_data,
    /*Meta*/
    -
    id AS sale_order_number

    FROM {{ source('FAVORITA', 'TRAIN') }}
),

final AS (
    SELECT
        {{ unique_business_key(sale_id) }} AS sale_id,
        {{ unique_business_key(store_id) }} AS store_id,
        {{ unique_business_key(product_id) }} AS product_id,
        *
    FROM sale_complete
)

SELECT * FROM final
