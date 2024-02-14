WITH final AS (
    SELECT
        date,
        event_type,
        event_locale_scope,
        event_locale_name,
        event_description,
        event_transferred,
        source_data
    FROM {{ ref('src__holiday_event') }}
)

SELECT * FROM final
