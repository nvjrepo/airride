
    
    

select
    trip_id as unique_field,
    count(*) as n_records

from `prod`.`warehouse`.`stg_airride__trips`
where trip_id is not null
group by trip_id
having count(*) > 1


