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
), dates as (
    





with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
     + 
    
    p2.generated_number * power(2, 2)
     + 
    
    p3.generated_number * power(2, 3)
     + 
    
    p4.generated_number * power(2, 4)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
     cross join 
    
    p as p4
    
    

    )

    select *
    from unioned
    where generated_number <= 29
    order by generated_number



),

all_periods as (

    select (
        timestampadd(day, row_number() over (order by 1) - 1, cast('2024-08-01' as date))
    ) as date_day
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_day <= cast('2024-08-30' as date)

)

select * from filtered



),

orders as (
    select * from __dbt__cte__int_order_trip__joined
),

customers as (
    select * from `prod`.`marts`.`dim_customers`
),

joined as (
    select
        dates.date_day::date as date_day,
        customers.customer_id

    from dates
    cross join customers
        on dates.date_day::date >= customers.first_orderred_at::date

),

final as (
    select
        joined.*,
        orders.order_id,
        orders.trip_id,
        orders.order_id is not null as is_active

    from joined
    left join orders
        on joined.customer_id = orders.customer_id
            and joined.date_day between orders.started_at::date and orders.ended_at::date
)

select * from final