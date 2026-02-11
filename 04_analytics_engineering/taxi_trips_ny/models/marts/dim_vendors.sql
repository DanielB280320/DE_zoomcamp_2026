WITH vendors AS (
    SELECT 
        DISTINCT vendor_id,
        {{get_vendor_names('vendor_id')}} AS vendor_name
        
    FROM {{ref('int_trips_unioned')}}
)

SELECT *
FROM vendors