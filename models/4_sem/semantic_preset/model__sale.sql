WITH dim_store AS (
    SELECT * FROM {{ ref('sem__store') }}
),

dim_event AS (
    SELECT * FROM {{ ref('sem__event') }}
),

dim_calender AS (
    SELECT * FROM {{ ref('sem__calender') }}
),

fact_sale AS (
    SELECT * FROM {{ ref('sem__sale') }}
),

final AS (
    SELECT
        dim_calender.*,
        fact_sale."Product family",
        fact_sale."Sales order number",
        fact_sale."Quantity",
        fact_sale."Promotion",
        fact_sale."Status",

        fact_sale."Source",
        dim_store."Store code",
        dim_store."Store type code",
        dim_store."Store group code",
        dim_store."City",
        dim_store."State",
        dim_store."Country",
        dim_store."Latitude",

        dim_store."Longitude",
        dim_event."Event type",
        dim_event."Event locale scope",
        dim_event."Event locale name",

        dim_event."Event transferred"
    FROM fact_sale
    LEFT JOIN dim_store ON dim_store."Store id" = fact_sale."Store id"
    LEFT JOIN dim_event ON dim_event."Date" = fact_sale."Date"
    LEFT JOIN dim_calender ON dim_calender."Date" = fact_sale."Date"
)

SELECT * FROM final
