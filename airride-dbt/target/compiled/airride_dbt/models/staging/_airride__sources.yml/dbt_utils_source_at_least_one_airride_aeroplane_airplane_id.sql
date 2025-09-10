







select *
from (
    with pruned_rows as (
      select
        airplane_id
      from `prod`.`raw`.`aeroplane`
      
        where airplane_id is not null
        limit 1
      
    )
    select
        
        
      
      count(airplane_id) as filler_column

    from pruned_rows

    

    having count(airplane_id) = 0

) validation_errors

