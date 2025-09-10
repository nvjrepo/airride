with source as (

    select * from {{ source('airride', 'aeroplane_model') }}

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
        {{ dbt_utils.generate_surrogate_key(["model", "manufacturer"]) }} as hashed_aeroplane_id

    from source

)

select * from renamed
