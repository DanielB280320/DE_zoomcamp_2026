SELECT
    {{dbt_utils.generate_surrogate_key([
        'T.vendor_id',
        'T.pickup_datetime',
        'T.pickup_location_id'
        ]) 
    }} AS trip_id, 
    T.vendor_id, 
    T.rate_code_id, 
    T.pickup_location_id, 
    T.dropoff_location_id,
    T.pickup_datetime,
    T.dropoff_datetime,
    T.store_and_fwd_flag,
    T.passenger_count,
    T.trip_distance,
    T.trip_distance,
    T.trip_type,
    T.fare_amount,
    T.extra,
    T.mta_tax,
    T.tip_amount,
    T.tolls_amount,
    T.ehail_fee,
    T.improvement_surcharge,
    T.total_amount,
    T.payment_type,
    P.description AS payment_type_description,  
    T.congestion_surcharge

FROM {{ref('int_trips_unioned')}} T
LEFT JOIN {{ref('payment_type_lookup')}} AS P
    ON T.payment_type = P.payment_type


SELECT COUNT(*) AS total_trips
FROM {{ref('int_trips_unioned')}}


--To Do:
-- One row per trip (doesn't matter if yellow or green)
-- Add a primary key (trip_id). It has to be unique.
-- Find all the duplicates, understand why they happen, and fix them.
-- Find a way to enrich the column payment_type.