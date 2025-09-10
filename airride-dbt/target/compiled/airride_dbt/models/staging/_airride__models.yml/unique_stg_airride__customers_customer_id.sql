
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from `prod`.`warehouse`.`stg_airride__customers`
where customer_id is not null
group by customer_id
having count(*) > 1


