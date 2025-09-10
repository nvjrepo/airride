
    select
      sum(coalesce(diff_count, 0)) as failures,
      sum(coalesce(diff_count, 0)) != 0 as should_warn,
      sum(coalesce(diff_count, 0)) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`dbt_utils_equal_rowcount_dim_c_51f9ae192f88f163fe0664c785c8f6b6`
    
      
    ) dbt_internal_test