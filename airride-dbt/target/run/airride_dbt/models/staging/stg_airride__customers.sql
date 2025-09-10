
  
  
  create or replace view `prod`.`warehouse`.`stg_airride__customers`
  (
    `customer_id` comment 'A unique identifie of the customer',
	`name`,
	`customer_group_id`,
	`email`,
	`phone_number`,
	`country_code`
  )
  comment 'staging layer for customer'
  as (
    with source as (

    select * from `prod`.`raw`.`customer`

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
  )
