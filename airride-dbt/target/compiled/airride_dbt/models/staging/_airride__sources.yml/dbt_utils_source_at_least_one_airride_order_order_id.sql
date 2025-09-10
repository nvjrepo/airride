







select *
from (
    with pruned_rows as (
      select
        order_id
      from `prod`.`raw`.`order`
      
        where order_id is not null
        limit 1
      
    )
    select
        
        
      
      count(order_id) as filler_column

    from pruned_rows

    

    having count(order_id) = 0

) validation_errors

