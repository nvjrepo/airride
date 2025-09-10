with source as (

    select * from `prod`.`raw`.`aeroplane`

),

renamed as (

    select
        airplane_id,
        airplane_model,
        manufacturer

    from source

)

select * from renamed