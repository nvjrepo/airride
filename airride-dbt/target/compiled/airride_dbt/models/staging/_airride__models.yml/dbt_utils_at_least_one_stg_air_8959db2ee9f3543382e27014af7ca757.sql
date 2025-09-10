







select *
from (
    with pruned_rows as (
      select
        customer_group_id
      from `prod`.`warehouse`.`stg_airride__customer_groups`
      
        where customer_group_id is not null
        limit 1
      
    )
    select
        
        
      
      count(customer_group_id) as filler_column

    from pruned_rows

    

    having count(customer_group_id) = 0

) validation_errors

