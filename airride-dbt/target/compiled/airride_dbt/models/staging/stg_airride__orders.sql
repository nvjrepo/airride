with source as (

    select * from `prod`.`raw`.`order`

),

renamed as (

    select
        order_id,
        customer_id,
        trip_id,
        price_eur as booking_amount,
        seat_no as seat_number,
        status,
        status in ('Booked', 'Finished') as is_successful_order


    from source

)

select * from renamed
