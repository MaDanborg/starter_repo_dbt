WITH total_avg AS (
        SELECT city
        , country
        , DATE_PART('week', date) AS week
        , DATE_PART('month', date) AS month
        , DATE_PART('quarter', date) AS quarter
        , MAX(avgtemp_c) AS max_avg
        , MIN(avgtemp_c) AS min_avg
        , AVG(avgtemp_c) AS weekly_avg
    FROM {{ref("prep_temp")}}
    group by week, city, country, month, quarter
    order by week
)
SELECT * from total_avg