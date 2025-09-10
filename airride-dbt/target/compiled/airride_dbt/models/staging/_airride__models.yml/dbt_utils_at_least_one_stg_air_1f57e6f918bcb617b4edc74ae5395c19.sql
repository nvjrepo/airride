







select *
from (
    with pruned_rows as (
      select
        aeroplane_model_id
      from `prod`.`warehouse`.`stg_airride__aeroplane_models`
      
        where aeroplane_model_id is not null
        limit 1
      
    )
    select
        
        
      
      count(aeroplane_model_id) as filler_column

    from pruned_rows

    

    having count(aeroplane_model_id) = 0

) validation_errors

