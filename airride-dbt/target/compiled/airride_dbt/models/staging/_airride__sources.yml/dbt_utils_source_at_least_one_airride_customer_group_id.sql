







select *
from (
    with pruned_rows as (
      select
        id
      from `prod`.`raw`.`customer_group`
      
        where id is not null
        limit 1
      
    )
    select
        
        
      
      count(id) as filler_column

    from pruned_rows

    

    having count(id) = 0

) validation_errors

