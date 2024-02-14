WITH geocodes AS (
    SELECT * FROM {{ ref('src__geocodes') }}
),

store AS (
    SELECT * FROM {{ ref('src__store') }}
),

final AS (
    SELECT
        store.*,
        geocodes.latitude,
        geocodes.longitude
    FROM store
    LEFT JOIN
        geocodes ON
            geocodes.store_id = store.store_id
)

SELECT * FROM final
