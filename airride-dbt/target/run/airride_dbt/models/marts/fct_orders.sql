
  
    
        create or replace table `prod`.`marts`.`fct_orders`
      
      
  using delta
      
      
      
      
      
      
      
      as
      with orders as (
    select * from `prod`.`warehouse`.`stg_airride__orders`
),

final as (
    select
        order_id,
        trip_id,
        customer_id,
        seat_number,
        is_successful_order,
        status,
        amount

    from orders

)

select * from final
  