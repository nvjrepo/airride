
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`dbt_utils_at_least_one_stg_air_8959db2ee9f3543382e27014af7ca757`
    
      
    ) dbt_internal_test