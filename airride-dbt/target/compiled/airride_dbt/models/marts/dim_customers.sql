with  __dbt__cte__int_order_trip__joined as (
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
), customers as (
    select * from `prod`.`warehouse`.`stg_airride__customers`
),

groups as (
    select * from `prod`.`warehouse`.`stg_airride__customer_groups`
),

countries as (
    select * from `prod`.`seeds`.`src_countries`
),

first_orders as (
    select
        customer_id,
        min(started_at) as first_orderred_at

    from __dbt__cte__int_order_trip__joined
    group by 1

),

joined as (
    select
        customers.customer_id,
        customers.name,
        groups.name as group_name,
        groups.type as group_type,
        countries.country_name as booking_country,

        first_orders.first_orderred_at
      
    from customers
    left join groups
        on customers.customer_group_id = groups.customer_group_id
    left join countries
        on customers.country_code = countries.country_code
    left join first_orders
        on customers.customer_id = first_orders.customer_id
)

select * from joined