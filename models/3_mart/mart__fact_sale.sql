WITH src__sale_open AS (
    SELECT
        sale_id,
        product_id,
        store_id,
        sale_order_number,
        store_code,
        product_family_code,
        sale_date,
        sale_qty,
        on_promotion,
        sale_status,
        source_data
    FROM {{ ref('src__sale_open') }}
),

src__sale_complete AS (
    SELECT
        sale_id,
        product_id,
        store_id,
        sale_order_number,
        store_code,
        product_family_code,
        sale_date,
        sale_qty,
        on_promotion,
        sale_status,
        source_data
    FROM {{ ref('src__sale_complete') }}
),

final AS (
    SELECT * FROM src__sale_open
    UNION ALL
    SELECT * FROM src__sale_complete
)

SELECT * FROM final
