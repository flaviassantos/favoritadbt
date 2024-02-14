{{
  config(
    materialized = 'view',
    )
}}

--{% set row_id = ['meta_valid_row_id'] %}
{% set store_id = ['store_code'] %}

WITH geocodes AS (
    SELECT
        /*Keys*/
        store_nbr AS store_code,
        latitude,
        longitude,
        /*Meta*/
        'External API' AS source_data
    FROM {{ source('FAVORITA', 'EXTERNAL_GEOCODES') }}
),

final AS (
    SELECT
        {{ unique_business_key(store_id) }} AS store_id,
        *
    FROM geocodes
)

SELECT * FROM final
