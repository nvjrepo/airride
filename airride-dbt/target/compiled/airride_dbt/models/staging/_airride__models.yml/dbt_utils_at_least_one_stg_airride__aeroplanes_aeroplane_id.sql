







select *
from (
    with pruned_rows as (
      select
        aeroplane_id
      from `prod`.`warehouse`.`stg_airride__aeroplanes`
      
        where aeroplane_id is not null
        limit 1
      
    )
    select
        
        
      
      count(aeroplane_id) as filler_column

    from pruned_rows

    

    having count(aeroplane_id) = 0

) validation_errors

