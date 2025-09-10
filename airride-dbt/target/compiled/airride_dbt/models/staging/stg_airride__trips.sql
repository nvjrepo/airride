with source as (

    select * from `prod`.`raw`.`trip`

),

renamed as (

    select
        trip_id,
        origin_city,
        destination_city,
        airplane_id as aeroplane_id,
        start_timestamp as started_at,
        case
            when date_diff(hour, started_at, end_timestamp) < 0 then date_add(day, 1, end_timestamp)
            else end_timestamp
        end as ended_at

    from source

)

select * from renamed