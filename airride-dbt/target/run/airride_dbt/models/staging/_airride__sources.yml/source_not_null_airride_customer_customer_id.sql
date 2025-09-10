
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`source_not_null_airride_customer_customer_id`
    
      
    ) dbt_internal_test