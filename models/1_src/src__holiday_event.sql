{{
  config(
    materialized = 'table',
    )
}}

WITH final AS (
    SELECT
        date,
        type AS event_type,
        locale AS event_locale_scope,
        locale_name AS event_locale_name,
        description AS event_description,
        transferred AS event_transferred,
        /*Meta*/
        'Kaggle' AS source_data
    FROM {{ source('FAVORITA', 'HOLIDAYS_EVENTS') }}
)

SELECT * FROM final
