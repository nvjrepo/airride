with source as (

    select * from `prod`.`raw`.`customer_group`

),

renamed as (

    select
        id as customer_group_id,
        type,
        name,
        registry_number

    from source

)

select * from renamed