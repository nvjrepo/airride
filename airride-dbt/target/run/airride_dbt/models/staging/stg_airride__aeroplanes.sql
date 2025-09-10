
  
  
  create or replace view `prod`.`warehouse`.`stg_airride__aeroplanes`
  (
    `aeroplane_id` comment 'A unique identifie of the aeroplane',
	`model`,
	`manufacturer`,
	`hashed_aeroplane_id`
  )
  comment 'staging layer for aeroplane'
  as (
    with source as (

    select * from `prod`.`raw`.`aeroplane`

),

renamed as (

    select
        airplane_id as aeroplane_id,
        airplane_model as model,
        manufacturer,
        md5(cast(concat(coalesce(cast(airplane_model as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(manufacturer as string), '_dbt_utils_surrogate_key_null_')) as string)) as hashed_aeroplane_id

    from source

)

select * from renamed
  )
