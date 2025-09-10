
  
  
  create or replace view `prod`.`warehouse`.`stg_airride__trips`
  (
    `trip_id` comment 'A unique identifie of the trip',
	`origin_city`,
	`destination_city`,
	`aeroplane_id` comment 'A unique identifie of the aeroplane',
	`started_at`,
	`ended_at`
  )
  comment 'staging layer for trip'
  as (
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
  )
