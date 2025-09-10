
    
    

select
    aeroplane_id as unique_field,
    count(*) as n_records

from `prod`.`warehouse`.`stg_airride__aeroplanes`
where aeroplane_id is not null
group by aeroplane_id
having count(*) > 1


