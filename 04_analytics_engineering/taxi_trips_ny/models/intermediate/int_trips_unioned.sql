WITH green_trip_data AS (
    SELECT *
    FROM {{ref('stg_green_trip_data')}}
), 

yellow_trip_data AS (
    SELECT *
    FROM {{ref('stg_yellow_trip_data')}}
),

trips_unioned AS (
    SELECT *
    FROM green_trip_data

    UNION ALL
    
    SELECT *
    FROM yellow_trip_data
)

SELECT *
FROM trips_unioned