{{
  config(
    materialized = 'view',
    )
}}

with date_spine as (
{{ dbt_utils.date_spine(
    datepart = "day",
    start_date = "cast('2010-01-01' as date)",
    end_date = "cast('2026-01-01' as date)"
) }}
),

final as (
    select
        date_day,
        year(date_day) as year,
        yearofweekiso(date_day) as week_year,
        month(date_day) as month_number,
        case month(date_day)
            when 1 then 'January' when 2 then 'February' when 3 then 'Mars'
            when 4 then 'April' when 5 then 'Mai' when 6 then 'June'
            when 7 then 'July' when 8 then 'August' when 9 then 'September'
            when
                10 then 'October'
            when 11 then 'November' when 12 then 'December'
        end as month_name,
        weekiso(date_day) as week_number,
        dayofyear(date_day) as day_number,
        dayofmonth(date_day) as month_day_number,
        dayofweekiso(date_day) as week_day_number,
        case dayofweekiso(date_day)
            when 1 then 'Monday'
            when 2 then 'Tuesday'
            when 3 then 'Wednesday'
            when 4 then 'Thursday'
            when 5 then 'Friday'
            when 6 then 'Saturday'
            when 7 then 'Sunday'
        end as week_day_name

    from date_spine
)

select * from final
