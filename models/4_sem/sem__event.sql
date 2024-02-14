WITH final AS (
    SELECT
        date AS "Date",
        event_type AS "Event type",
        event_locale_scope AS "Event locale scope",
        event_locale_name AS "Event locale name",
        event_description AS "Event description",
        event_transferred AS "Event transferred",
        source_data AS "Source"
    FROM {{ ref('mart__dim_event') }}
)

SELECT * FROM final
