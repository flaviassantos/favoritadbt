WITH final AS (
    SELECT
        date_day AS "Date",
        year AS "Year",
        week_year AS "Week number year",
        month_number AS "Month number",
        month_name AS "Month name",
        week_number AS "Week number",
        day_number AS "Day number",
        month_day_number AS "Month day number",
        week_day_number AS "Week day number",
        week_day_name AS "Week day name"
    FROM {{ ref('src__calender') }}
)

SELECT * FROM final
