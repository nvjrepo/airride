with orders as (
    select * from `prod`.`warehouse`.`stg_airride__orders`
),

trips as (
    select * from `prod`.`warehouse`.`stg_airride__trips`
)

select
    orders.*,
    trips.started_at,
    trips.ended_at,
    trips.origin_city,
    trips.destination_city,
    trips.aeroplane_id

from orders
inner join trips
    on orders.trip_id = trips.trip_id