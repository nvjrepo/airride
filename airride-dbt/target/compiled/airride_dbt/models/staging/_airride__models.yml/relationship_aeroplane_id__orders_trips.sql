
    
    

with child as (
    select trip_id as from_field
    from `prod`.`warehouse`.`stg_airride__orders`
    where trip_id is not null
),

parent as (
    select trip_id as to_field
    from `prod`.`warehouse`.`stg_airride__trips`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


