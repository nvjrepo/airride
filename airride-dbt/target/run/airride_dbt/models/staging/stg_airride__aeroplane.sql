
  
  
  create or replace view `prod`.`default`.`stg_airride__aeroplane`
  (
    `airplane_id`,
	`airplane_model`,
	`manufacturer`
  )
  
  as (
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
  )
