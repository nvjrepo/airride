
    
    

with child as (
    select hashed_aeroplane_id as from_field
    from `prod`.`warehouse`.`stg_airride__aeroplanes`
    where hashed_aeroplane_id is not null
),

parent as (
    select hashed_aeroplane_id as to_field
    from `prod`.`warehouse`.`stg_airride__aeroplane_models`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


