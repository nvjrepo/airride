
    
    

select
    airplane_id as unique_field,
    count(*) as n_records

from `prod`.`raw`.`aeroplane`
where airplane_id is not null
group by airplane_id
having count(*) > 1


