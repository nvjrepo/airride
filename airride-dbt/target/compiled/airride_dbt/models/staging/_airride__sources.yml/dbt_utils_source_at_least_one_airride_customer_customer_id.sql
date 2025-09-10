







select *
from (
    with pruned_rows as (
      select
        customer_id
      from `prod`.`raw`.`customer`
      
        where customer_id is not null
        limit 1
      
    )
    select
        
        
      
      count(customer_id) as filler_column

    from pruned_rows

    

    having count(customer_id) = 0

) validation_errors

