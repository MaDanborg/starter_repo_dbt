    WITH temperature_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_weekday AS (
    SELECT *,
        DATE_PART('dow', date) AS weekday,
        DATE_PART('day', date) AS day_num
    FROM temperature_daily
)
SELECT *
FROM add_weekday