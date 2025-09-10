







select *
from (
    with pruned_rows as (
      select
        order_id
      from `prod`.`warehouse`.`stg_airride__orders`
      
        where order_id is not null
        limit 1
      
    )
    select
        
        
      
      count(order_id) as filler_column

    from pruned_rows

    

    having count(order_id) = 0

) validation_errors

