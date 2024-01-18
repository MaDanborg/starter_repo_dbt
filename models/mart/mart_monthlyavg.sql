WITH total_avg_monthly AS (
        SELECT city
        , country
        , month
        , quarter
        , MAX(avgtemp_c) AS max_avg
        , MIN(avgtemp_c) AS min_avg
        , AVG(avgtemp_c) AS monthly_avg
    FROM {{ref("prep_temp")}}
    group by month, city, country, quarter
    order by month
)
SELECT * from total_avg_monthly