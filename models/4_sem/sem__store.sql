WITH final AS (
    SELECT
        store_id AS "Store id",
        store_code AS "Store code",
        store_type_code AS "Store type code",
        store_group_code AS "Store group code",
        city AS "City",
        state AS "State",
        country AS "Country",
        latitude AS "Latitude",
        longitude AS "Longitude",
        source_data AS "Source"
    FROM {{ ref('mart__dim_store') }}
)

SELECT * FROM final
