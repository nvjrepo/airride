
    
    

with child as (
    select aeroplane_id as from_field
    from `prod`.`warehouse`.`stg_airride__trips`
    where aeroplane_id is not null
),

parent as (
    select aeroplane_id as to_field
    from `prod`.`warehouse`.`stg_airride__aeroplanes`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


