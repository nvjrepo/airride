
    
    

select
    aeroplane_model_id as unique_field,
    count(*) as n_records

from `prod`.`warehouse`.`stg_airride__aeroplane_models`
where aeroplane_model_id is not null
group by aeroplane_model_id
having count(*) > 1


