    WITH temperature_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_timestamps AS (
    SELECT *,
        DATE_PART('dow', date) AS weekday,
        DATE_PART('day', date) AS day,
        DATE_PART('week', date) AS week,
        DATE_PART('month', date) AS month,
        DATE_PART('quarter', date) AS quarter
    FROM temperature_daily
)
SELECT *
FROM add_timestamps

SELECT *
FROM temperature_daily AS temp
	SELECT 	week 
					, AVG(avgtemp_c) AS weekly_averages
					FROM temperature_daily
					GROUP BY week, city


add_averages AS (
    select avgtemp_c
    , week
    , avg(avgtemp_c) as weekly_averages
    from temperature_daily
    group by week
)
SELECT *
FROM add_averages