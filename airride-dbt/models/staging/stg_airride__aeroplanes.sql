with source as (

    select * from {{ source('airride', 'aeroplane') }}

),

renamed as (

    select
        airplane_id as aeroplane_id,
        airplane_model as model,
        manufacturer,
        {{ dbt_utils.generate_surrogate_key(["airplane_model", "manufacturer"]) }} as hashed_aeroplane_id

    from source

)

select * from renamed
