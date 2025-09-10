
  
    
        create or replace table `prod`.`marts`.`fct_trips`
      
      
  using delta
      
      
      
      
      
      comment 'events table for monitoring trips information'
      
      as
      with trips as (
    select * from `prod`.`warehouse`.`stg_airride__trips`
),

cities as (
    select * from `prod`.`seeds`.`src_cities`
),

final as (
    select
        trips.trip_id,
        trips.aeroplane_id,
        trips.started_at,
        trips.ended_at,

        trips.origin_city,
        trips.destination_city,
        c1.latitude as origin_city_latitude,
        c1.longitude as origin_city_longitude,
        c2.latitude as destination_city_latitude,
        c2.longitude as destination_city_longitude

    from trips
    left join cities c1
        on trips.origin_city = c1.city_name
    left join cities c2
        on trips.destination_city = c2.city_name

)

select * from final
  