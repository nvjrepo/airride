{{
    config(
        partition_by="date_day"
    )
}}

with dates as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2024-08-01' as date)",
        end_date="cast('2024-08-30' as date)"
       )
    }}

),

orders as (
    select * from {{ ref('int_order_trip__joined') }}
),

customers as (
    select * from {{ ref('dim_customers') }}
),

joined as (
    select
        {{ dbt_utils.generate_surrogate_key([
            "dates.date_day",
            "customers.customer_id"
        ]) }} as unique_id,
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
