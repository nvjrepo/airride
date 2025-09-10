
    
    

with child as (
    select customer_group_id as from_field
    from `prod`.`warehouse`.`stg_airride__customer_groups`
    where customer_group_id is not null
),

parent as (
    select customer_group_id as to_field
    from `prod`.`warehouse`.`stg_airride__customers`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


