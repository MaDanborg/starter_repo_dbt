WITH temperature_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_averages AS (
    SELECT *
        , DATE_PART('dow', date) AS weekday
        , DATE_PART('day', date) AS day
        , DATE_PART('week', date) AS week
        , DATE_PART('month', date) AS month
        , DATE_PART('quarter', date) AS quarter
        , MAX(avgtemp_c) AS weekly_max
        , MIN(avgtemp_c) AS weekly_min
        , AVG(avgtemp_c) AS weekly_avg
    FROM temperature_daily
    group by week
)
SELECT *
FROM add_averages