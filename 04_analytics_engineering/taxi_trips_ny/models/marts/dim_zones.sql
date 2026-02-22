WITH taxi_zone_lookup AS (
    SELECT *
    FROM {{ref('taxi_zone_lookup')}}
), 

renamed_taxi_zone_lookup AS (
    SELECT 
        LocationID AS location_id,
        Borough, 
        Zone,
        service_zone
    FROM taxi_zone_lookup
)

SELECT *
FROM renamed_taxi_zone_lookup