WITH temperature_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_averages AS (
    SELECT week
        , MAX(avgtemp_c) AS weekly_max
        , MIN(avgtemp_c) AS weekly_min
        , AVG(avgtemp_c) AS weekly_avg
    FROM temperature_daily
    group by week
)
SELECT *
FROM add_averages