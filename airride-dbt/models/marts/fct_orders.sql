with orders as (
    select * from {{ ref('stg_airride__orders') }}
),

final as (
    select
        order_id,
        trip_id,
        customer_id,
        seat_number,
        is_successful_order,
        status,
        booking_amount,

    from orders

)

select * from final
