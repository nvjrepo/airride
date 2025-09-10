
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`unique_stg_airride__customer_groups_customer_group_id`
    
      
    ) dbt_internal_test