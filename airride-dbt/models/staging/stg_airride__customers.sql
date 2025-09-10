with source as (

    select * from {{ source('airride', 'customer') }}

),

renamed as (

    select
        customer_id,
        name,
        customer_group_id,
        trim(email) as email,
        phone_number,
        regexp_substr(phone_number, '[+0-9]+') as country_code

    from source

)

select * from renamed
