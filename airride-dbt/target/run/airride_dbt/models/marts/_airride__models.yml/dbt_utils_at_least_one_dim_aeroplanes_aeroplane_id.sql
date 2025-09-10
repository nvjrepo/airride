
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`dbt_utils_at_least_one_dim_aeroplanes_aeroplane_id`
    
      
    ) dbt_internal_test