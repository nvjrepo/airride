
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`not_null_stg_airride__customers_customer_id`
    
      
    ) dbt_internal_test