SELECT 
    -- ids
    CAST(vendorid AS INT) AS vendor_id,
    CAST(ratecodeid AS INT) AS rate_code_id,
    CAST(pulocationid AS INT) AS pickup_location_id,
    CAST(dolocationid AS INT) AS dropoff_location_id,
    -- timestamps
    CAST(tpep_pickup_datetime AS DATETIME) AS pickup_datetime,
    CAST(tpep_dropoff_datetime AS DATETIME) AS dropoff_datetime,
    -- trip details
    CAST(store_and_fwd_flag AS STRING) AS store_and_fwd_flag,
    CAST(passenger_count AS INT) AS passenger_count,
    CAST(trip_distance AS NUMERIC) AS trip_distance,
    1 AS trip_type, -- All yellow taxi trips are taken on the street, so we can hardcode this value.
    
    -- payment info
    CAST(fare_amount AS NUMERIC) AS fare_amount,
    CAST(extra AS NUMERIC) AS extra,
    CAST(mta_tax AS NUMERIC) AS mta_tax,
    CAST(tip_amount AS NUMERIC) AS tip_amount,
    CAST(tolls_amount AS NUMERIC) AS tolls_amount,
    0 AS ehail_fee, -- The ehail_fee column is only present in the green taxi data, so we can hardcode this value for the yellow taxi data.
    CAST(improvement_surcharge AS NUMERIC) AS improvement_surcharge,
    CAST(total_amount AS NUMERIC) AS total_amount,
    CAST(payment_type AS INT) AS payment_type,
    CAST(congestion_surcharge AS NUMERIC) AS congestion_surcharge
    

FROM {{source('raw_ny_taxi_trips', 'yellow_tripdata')}}
WHERE vendorid IS NOT NULL
