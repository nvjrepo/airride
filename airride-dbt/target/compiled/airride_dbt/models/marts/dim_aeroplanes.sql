with aeroplanes as (
    select * from `prod`.`warehouse`.`stg_airride__aeroplanes`

),

models as (
    select * from `prod`.`warehouse`.`stg_airride__aeroplane_models`

),

joined as (
    select
        aeroplanes.aeroplane_id,
        aeroplanes.hashed_aeroplane_id,
        aeroplanes.model,
        aeroplanes.manufacturer,
        models.max_seats,
        case
            when models.max_seats < 100 then 'Small'
            when models.max_seats between 100 and 200 then 'Meidum'
            else 'Large'
        end as aeroplane_size

    from aeroplanes
    left join models
        on aeroplanes.hashed_aeroplane_id = models.hashed_aeroplane_id

)

select * from joined