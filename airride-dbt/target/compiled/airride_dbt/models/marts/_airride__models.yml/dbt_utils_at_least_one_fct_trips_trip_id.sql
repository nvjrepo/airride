







select *
from (
    with pruned_rows as (
      select
        trip_id
      from `prod`.`marts`.`fct_trips`
      
        where trip_id is not null
        limit 1
      
    )
    select
        
        
      
      count(trip_id) as filler_column

    from pruned_rows

    

    having count(trip_id) = 0

) validation_errors

