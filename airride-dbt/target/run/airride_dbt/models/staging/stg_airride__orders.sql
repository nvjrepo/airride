
  
  
  create or replace view `prod`.`warehouse`.`stg_airride__orders`
  (
    `order_id` comment 'A unique identifie of the order',
	`customer_id` comment 'A unique identifie of the customer',
	`trip_id` comment 'A unique identifie of the trip',
	`booking_amount`,
	`seat_number`,
	`status`,
	`is_successful_order`
  )
  comment 'staging layer for order'
  as (
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
  )
