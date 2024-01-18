create table prep_temp AS
(
WITH temperature_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_timestamps AS (
    SELECT *
        , DATE_PART('dow', date) AS weekday
        , DATE_PART('day', date) AS day
        , DATE_PART('week', date) AS week
        , DATE_PART('month', date) AS month
        , DATE_PART('quarter', date) AS quarter
    FROM temperature_daily
)
SELECT *
FROM add_timestamps
)

