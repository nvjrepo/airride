
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  







select *
from (
    with pruned_rows as (
      select
        id
      from `airline`.`raw`.`trip`
      
        where id is not null
        limit 1
      
    )
    select
        
        
      
      count(id) as filler_column

    from pruned_rows

    

    having count(id) = 0

) validation_errors


  
  
      
    ) dbt_internal_test