{{
  config(
    materialized = 'view',
    )
}}

--{% set row_id = ['meta_valid_row_id'] %}
{% set store_id = ['store_code'] %}

WITH store AS (
    SELECT
        /*Keys*/
        store_nbr AS store_code,
        /*Attributes*/
        type AS store_type_code,
        cluster AS store_group_code,
        city,
        state,
        'Ecuador' AS country,
        /*Meta*/
        'Kaggle' AS source_data
    FROM {{ source('FAVORITA', 'STORES') }}
),

final AS (
    SELECT
        {{ unique_business_key(store_id) }} AS store_id,
        *
    FROM store
)

SELECT * FROM final
