    WITH temp_daily AS (
    SELECT * 
    FROM {{ref('staging_temp')}}
),
add_weekday AS (
    SELECT *,
        SELECT DATE('date') AS weekday,
        SELECT DATE('date') AS day_num
    FROM temp_daily
)
SELECT *
FROM add_weekday