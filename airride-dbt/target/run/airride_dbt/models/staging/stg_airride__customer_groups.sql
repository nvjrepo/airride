
  
  
  create or replace view `prod`.`warehouse`.`stg_airride__customer_groups`
  (
    `customer_group_id`,
	`type`,
	`name`,
	`registry_number`
  )
  comment 'staging layer for customer group'
  as (
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
  )
