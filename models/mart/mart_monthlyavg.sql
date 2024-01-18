WITH total_avg_monthly AS (
        SELECT city
        , country
        , month
        , week
        , quarter
        , MAX(avgtemp_c) AS max_avg
        , MIN(avgtemp_c) AS min_avg
        , AVG(avgtemp_c) AS weekly_avg
    FROM {{ref("prep_temp")}}
    group by month, city, country, week, quarter
    order by month
)
SELECT * from total_avg_monthly