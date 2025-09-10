with source as (

    select * from `prod`.`raw`.`aeroplane_model`

),

renamed as (

    select
        id as aeroplane_model_id,
        manufacturer,
        model,
        max_seats,
        max_weight,
        max_distance,
        engine_type,
        md5(cast(concat(coalesce(cast(model as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(manufacturer as string), '_dbt_utils_surrogate_key_null_')) as string)) as hashed_aeroplane_id

    from source

)

select * from renamed