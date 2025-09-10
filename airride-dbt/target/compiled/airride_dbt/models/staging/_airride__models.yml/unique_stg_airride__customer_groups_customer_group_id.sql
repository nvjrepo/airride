
    
    

select
    customer_group_id as unique_field,
    count(*) as n_records

from `prod`.`warehouse`.`stg_airride__customer_groups`
where customer_group_id is not null
group by customer_group_id
having count(*) > 1


