
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`dbt_utils_at_least_one_stg_air_1f57e6f918bcb617b4edc74ae5395c19`
    
      
    ) dbt_internal_test